Get-AzContext | Format-List

New-AzResourceGroup -Name 'cs' -Location EastUS

New-AzKeyVault -Name 'cs-vault' -ResourceGroupName 'cs' -Location 'East US'

Set-AzKeyVaultAccessPolicy -VaultName 'cs-vault' `
    -UserPrincipalName 'tim@timw.info' `
    -PermissionsToSecrets get, set, delete

$secretvalue = ConvertTo-SecureString '?!hVFkk965BuUv!?' -AsPlainText -Force

$secretset = Set-AzKeyVaultSecret -VaultName 'cs-vault' `
    -Name 'cs-password' -SecretValue $secretvalue

$secretget = Get-AzKeyVaultSecret -VaultName 'cs-vault' -Name 'ExamplePassword'

$ssPtr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret.SecretValue)

try {
    $secretValueText = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ssPtr)
}
finally {
    [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ssPtr)
}
Write-Output $secretValueText