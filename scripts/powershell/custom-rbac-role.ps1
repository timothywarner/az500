# Ref: https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell

# ARM REST API Ref: https://docs.microsoft.com/en-us/rest/api/azure/

Get-AzProviderOperation 'Microsoft.Network/*' | Format-Table -Property Operation, Description -AutoSize

Get-AzRoleDefinition -Name 'Virtual Machine Contributor' | ConvertTo-Json | Out-File 'D:\vmc2022.json'

Get-AzSubscription -SubscriptionName 'Microsoft Azure Sponsorship' | Select-Object -Property id
# 2fbf906e-1101-4bc0-b64f-adc44e462fff

New-AzRoleDefinition -InputFile 'D:\vmc2022.json'

Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'VM Admnistrator' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | ? { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id 'fb31d481-00fd-4214-8f47-c030bcc59099'