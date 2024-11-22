@description('VNet name')
param vnetName string = 'spoke-vnet'

@description('VNet address prefix')
param vnetAddressPrefix string = '10.120.0.0/16'

@description('web subnet name')
param hubSubnetWebName string = 'web'

@description('web subnet prefix')
param hubSubnetWebPrefix string = '10.120.1.0/24'

@description('hub data subnet name')
param hubSubnetDataName string = 'data'

@description('hub data subnet prefix')
param hubSubnetDataPrefix string = '10.120.2.0/24'

@description('Gateway subnet name')
param gatewaySubnetName string = 'GatewaySubnet'

@description('Gateway subnet prefix')
param gatewaySubnetPrefix string = '10.120.3.0/24'

@description('Application Gateway subnet name')
param appGatewaySubnetName string = 'ApplicationGatewaySubnet'

@description('Application Gateway subnet prefix')
param appGatewaySubnetPrefix string = '10.120.4.0/24'

@description('Bastion subnet name')
param bastionSubnetName string = 'AzureBastionSubnet'

@description('Bastion subnet prefix')
param bastionSubnetPrefix string = '10.120.5.0/24'

@description('Firewall user traffic subnet name')
param firewallSubnetName string = 'AzureFirewallSubnet'

@description('Firewall user traffic subnet prefix')
param firewallSubnetPrefix string = '10.120.6.0/24'

@description('Firewall management subnet name')
param firewallMgmtSubnetName string = 'AzureFirewallManagementSubnet'

@description('Firewall management subnet prefix')
param firewallMgmtSubnetPrefix string = '10.120.7.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: hubSubnetWebName
        properties: {
          addressPrefix: hubSubnetWebPrefix
        }
      }
      {
        name: hubSubnetDataName
        properties: {
          addressPrefix: hubSubnetDataPrefix
        }
      }
      {
        name: gatewaySubnetName
        properties: {
          addressPrefix: gatewaySubnetPrefix
        }
      }
      {
        name: appGatewaySubnetName
        properties: {
          addressPrefix: appGatewaySubnetPrefix
        }
      }
      {
        name: bastionSubnetName
        properties: {
          addressPrefix: bastionSubnetPrefix
        }
      }
      {
        name: firewallSubnetName
        properties: {
          addressPrefix: firewallSubnetPrefix
        }
      }
      {
        name: firewallMgmtSubnetName
        properties: {
          addressPrefix: firewallMgmtSubnetPrefix
        }
      }
    ]
  }
}
