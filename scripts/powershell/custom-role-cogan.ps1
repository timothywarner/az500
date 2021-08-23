Ref: https://samcogan.com/custom-azure-rbac-roles/

Get-AzRoleDefinition -Name "Virtual Machine Contributor" | ConvertTo-Json | Out-File "D:\vmc.json"

Get-AzureRMProviderOperation "Microsoft.Compute/*" | fl Operation

# Add "Microsoft.Compute/Disks*",

New-AzRoleDefinition -InputFile 'D:\vmc.json'


