// AZ-500 Security Implementation Example
// Purpose: Demonstrates secure infrastructure deployment with multiple security controls

// Parameters
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Environment name')
@allowed([
  'Production'
  'Development'
  'Test'
])
param environmentName string

@description('IP addresses or ranges that should be allowed through the firewall')
param allowedIPRanges array

@description('Key Vault SKU')
@allowed([
  'standard'
  'premium'
])
param keyVaultSku string = 'premium'

@minLength(3)
@maxLength(24)
@description('Storage Account name')
param storageAccountName string

@secure()
@description('SQL Server administrator password')
param sqlServerAdminPassword string

// Variables
var networkSecurityGroupName = 'security-nsg'
var virtualNetworkName = 'security-vnet'
var keyVaultName = 'kv-${uniqueString(resourceGroup().id)}'
var logAnalyticsWorkspaceName = 'law-${uniqueString(resourceGroup().id)}'
var applicationInsightsName = 'ai-${uniqueString(resourceGroup().id)}'

// Tags
var commonTags = {
  Environment: environmentName
  SecurityContact: 'security@contoso.com'
  DataClassification: 'Confidential'
  ComplianceRequired: 'HIPAA'
}

// Network Security Group
resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: networkSecurityGroupName
  location: location
  tags: commonTags
  properties: {
    securityRules: [
      {
        name: 'DenyAllInbound'
        properties: {
          priority: 4096
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '*'
        }
      }
    ]
  }
}

// Virtual Network with Subnets
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: virtualNetworkName
  location: location
  tags: commonTags
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'ApplicationSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsg.id
          }
          serviceEndpoints: [
            {
              service: 'Microsoft.KeyVault'
            }
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.Sql'
            }
          ]
        }
      }
      {
        name: 'DatabaseSubnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'sqlDelegation'
              properties: {
                serviceName: 'Microsoft.Sql/managedInstances'
              }
            }
          ]
        }
      }
    ]
  }
}

// Key Vault with RBAC and Advanced Security
resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  tags: commonTags
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: keyVaultSku
    }
    enableRbacAuthorization: true
    enablePurgeProtection: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
      ipRules: [for ip in allowedIPRanges: {
        value: ip
      }]
      virtualNetworkRules: [
        {
          id: '${vnet.id}/subnets/ApplicationSubnet'
        }
      ]
    }
  }
}

// Storage Account with Security Features
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  tags: commonTags
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
      virtualNetworkRules: [
        {
          id: '${vnet.id}/subnets/ApplicationSubnet'
          action: 'Allow'
        }
      ]
      ipRules: [for ip in allowedIPRanges: {
        value: ip
        action: 'Allow'
      }]
    }
  }
}

// Log Analytics Workspace
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  tags: commonTags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 90
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
}

// Application Insights for Security Monitoring
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  tags: commonTags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
    DisableIpMasking: false
    DisableLocalAuth: true
  }
}

// Diagnostic Settings for Key Vault
resource keyVaultDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  scope: keyVault
  name: 'KeyVaultAudit'
  properties: {
    workspaceId: logAnalytics.id
    logs: [
      {
        category: 'AuditEvent'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 90
        }
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
        retentionPolicy: {
          enabled: true
          days: 90
        }
      }
    ]
  }
}

// Role Assignments
resource keyVaultAdminRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, 'Key Vault Administrator')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '00482a5a-887f-4fb3-b363-3b7fe8e74483')
    principalType: 'ServicePrincipal'
    principalId: 'YOUR-MANAGED-IDENTITY-ID'
  }
}

// Outputs
output keyVaultName string = keyVault.name
output storageAccountName string = storageAccount.name
output vnetName string = vnet.name
output logAnalyticsWorkspaceId string = logAnalytics.id
