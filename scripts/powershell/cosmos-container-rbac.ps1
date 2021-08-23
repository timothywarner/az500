# Ref: https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-setup-rbac

# Install PowerShell Core
Install-Module -Name PSReleaseTools
Get-PSCore

# Install Azure PowerShell
Install-Module -Name Az -Verbose
Update-Help

# Get Cosmos DB preview module
Find-Module -Name Az.CosmosDB -AllowPrerelease
Install-Module -Name Az.CosmosDB -Verbose -Force

# Sign into Azure
Connect-AzAccount
Set-AzContext -SubscriptionName ''

# RO
$resourceGroupName = "dp201"
$accountName = "twdp201cosmos"
New-AzCosmosDBSqlRoleDefinition -AccountName $accountName `
    -ResourceGroupName $resourceGroupName `
    -Type CustomRole -RoleName MyReadOnlyRole `
    -DataAction @( `
        'Microsoft.DocumentDB/databaseAccounts/readMetadata',
        'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read', `
        'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery', `
        'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed') `
    -AssignableScope "/"

# RW
New-AzCosmosDBSqlRoleDefinition -AccountName $accountName `
    -ResourceGroupName $resourceGroupName `
    -Type CustomRole -RoleName MyReadWriteRole `
    -DataAction @( `
        'Microsoft.DocumentDB/databaseAccounts/readMetadata',
    'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*', `
        'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*') `
    -AssignableScope "/" #acct or /dbs/db/colls/container

# Fetch role IDs
Get-AzCosmosDBSqlRoleDefinition -AccountName $accountName `
    -ResourceGroupName $resourceGroupName

# Assign a role
$readOnlyRoleDefinitionId = "<roleDefinitionId>" # as fetched above
$principalId = "<aadPrincipalId>" #object ID
New-AzCosmosDBSqlRoleAssignment -AccountName $accountName `
    -ResourceGroupName $resourceGroupName `
    -RoleDefinitionId $readOnlyRoleDefinitionId `
    -Scope $accountName `
    -PrincipalId $principalId
