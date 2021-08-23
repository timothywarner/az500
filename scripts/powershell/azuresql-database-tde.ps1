# Set variables
$resourceGroup = ''
$dbServerName = ''
$dbName = ''
$keyVaultName = ''
$keyVaultKeyId = (Get-AzureKeyVaultKey -VaultName '' -Name '').Id

# Add a service principal for SQL server
$server = Set-AzSqlServer -ResourceGroupName $resourceGroup -ServerName $dbServerName -AssignIdentity

# Grand key vault permissions to server
Set-AzKeyVaultAccessPolicy -VaultName $keyVaultName `
    -ObjectId $server.Identity.PrincipalId -PermissionsToKeys get, wrapKey, unwrapKey

# add the key from Key Vault to the server
Add-AzSqlServerKeyVaultKey -ResourceGroupName $resourceGroup -ServerName $dbServerName -KeyId $keyVaultKeyId

# set the key as the TDE protector for all resources under the server
Set-AzSqlServerTransparentDataEncryptionProtector -ResourceGroupName $resourceGroup -ServerName $dbServerName `
    -Type AzureKeyVault -KeyId $keyVaultKeyId

# confirm the TDE protector was configured as intended
Get-AzSqlServerTransparentDataEncryptionProtector -ResourceGroupName $resourceGroup -ServerName $dbServerName

# Enable TDE
Set-AzSqlDatabaseTransparentDataEncryption -ResourceGroupName $resourceGroup `
    -ServerName $dbServerName -DatabaseName $dbName -State "Enabled"

# Check encryption state
# get the encryption state
Get-AzSqlDatabaseTransparentDataEncryption -ResourceGroupName $resourceGroup `
    -ServerName $dbServerName -DatabaseName $dbName `

# check the encryption progress for a database or data warehouse
Get-AzSqlDatabaseTransparentDataEncryptionActivity -ResourceGroupName $resourceGroup `
    -ServerName $dbServerName -DatabaseName $dbName

# Turn off TDE
Set-AzSqlDatabaseTransparentDataEncryption -ServerName $dbServerName -ResourceGroupName $resourceGroup `
    -DatabaseName $dbName -State "Disabled"




