# Ref: https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell

Get-AzProviderOperation 'Microsoft.Support/*' | Format-Table -Property Operation, Description -AutoSize

Get-AzRoleDefinition -Name 'Reader' | ConvertTo-Json | Out-File 'D:\ReaderSupportRole.json'

# Alertnatively
(Get-AzRoleDefinition "Virtual Machine Contributor").Actions #NotActions

# Try "VM and Managed Disk Contributor"
"Microsoft.Compute/Disks*",


Get-AzSubscription | Select-Object -Property id

New-AzRoleDefinition -InputFile 'C:\ReaderSupportRole.json'

Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'Help Desk Support' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | ? { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id '22222222-2222-2222-2222-222222222222'