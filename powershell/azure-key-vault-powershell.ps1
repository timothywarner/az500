<# Work with Azure Key Vault and PowerShell

   Ref: https://docs.microsoft.com/en-us/azure/key-vault/quick-create-powershell
#>

# Set up environment
Login-AzAccount

New-AzResourceGroup -Name ContosoResourceGroup -Location EastUS

New-AzKeyVault -Name 'Contoso-Vault2' -ResourceGroupName 'ContosoResourceGroup' -Location 'East US'

# Convert a plaintext secret to a secure string
$secretvalue = ConvertTo-SecureString 'hVFkk965BuUv' -AsPlainText -Force

# Store the secret in key vault
$secret = Set-AzKeyVaultSecret -VaultName 'ContosoKeyVault' -Name 'ExamplePassword' -SecretValue $secretvalue

# Retrieve the key value
(Get-AzKeyVaultSecret -vaultName "Contosokeyvault" -name "ExamplePassword").SecretValueText

# Clean up the environment
Remove-AzResourceGroup -Name ContosoResourceGroup