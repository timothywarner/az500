<# Manage Azure Blueprints as code
   Tim Warner (techtrainertim.com)
   01-September-2020
#>

# Authenticate
Connect-AzAccount
Set-AzContext -SubscriptionName 'Microsoft Azure Sponsorship'

# Install the Blueprints module
Install-Module -Name Az.Blueprint -Verbose

# Export an existing Azure blueprint to the local system
$bp = Get-AzBlueprint -Name 'basic-networking-blueprint'

Export-AzBlueprintWithArtifact -Blueprint $bp -OutputPath '.' -Version '1.0'


# Push sample blueprint to Azure as a draft
Import-AzBlueprintWithArtifact -Name Boilerplate -ManagementGroupId "DevMG" -InputPath  ".\samples\101-boilerplate"

# Publish a new version so it can be assigned:
# Get the blueprint we just created
$bp = Get-AzBlueprint -Name Boilerplate -ManagementGroupId "DevMG"
# Publish version 1.0
Publish-AzBlueprint -Bluerpint $bp -Version 1.0

# Assign blueprint to a subscription
# Get the version of the blueprint you want to assign, which we will pas to New-AzBlueprintAssignment
$publishedBp = Get-AzBlueprint -ManagementGroupId "DevMG" -Name "Boilerplate" -LatestPublished

# Each resource group artifact in the blueprint will need a hashtable for the actual RG name and location
$rgHash = @{ name = "MyBoilerplateRG"; location = "eastus" }

# all other (non-rg) parameters are listed in a single hashtable, with a key/value pair for each parameter
$parameters = @{ principalIds = "caeebed6-cfa8-45ff-9d8a-03dba4ef9a7d" }

# All of the resource group artifact hashtables are themselves grouped into a parent hashtable
# the 'key' for each item in the table should match the RG placeholder name in the blueprint
$rgArray = @{ SingleRG = $rgHash }

# Assign the new blueprint to the specified subscription (Assignment updates should use Set-AzBlueprintAssignment
New-AzBlueprintAssignment -Blueprint $publishedBp -Location eastus -SubscriptionId "00000000-1111-0000-1111-000000000000" -ResourceGroupParameter $rgArray -Parameter $parameters