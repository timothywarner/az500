# install Azure PowerShell
Install-Module -Name Az -Verbose

# install Azure AD module
Install-Module -Name AzureADPreview -Verbose
Import-Module -Name AzureADPreview

# connect to Azure and AAD
Connect-AzAccount
Connect-AzureAD

# get AAD PIM commands

Get-Command -Noun AzureADMSPriv*

Get-AzureADMSPrivilegedRoleDefinition -ProviderId aadRoles -ResourceId 926d99e7-117c-4a6a-8031-0cc481e9da26

# MS PIM module https://timw.info/5ut

# install the module
Install-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule -force -allowclobber

# import and view commands & help
Import-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule

Get-Command -Module Microsoft.Azure.ActiveDirectory.PIM.PSModule

Tutorial: https://timw.info/14r