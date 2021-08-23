# PowerShell Key Vault (Ref: https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-powershell)

# Convert a secret to a secure string
$secretvalue = ConvertTo-SecureString 'hVFkk965BuUv' -AsPlainText -Force

# Create a secret
$secret = Set-AzKeyVaultSecret -VaultName 'oreilly-vault-001' `
  -Name 'ExamplePassword' -SecretValue $secretvalue

# View the secret in plain text
(Get-AzKeyVaultSecret -vaultName "oreilly-vault-001" -name "ExamplePassword").SecretValueText
