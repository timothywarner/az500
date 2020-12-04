# Getting Started with Azure Blueprints
# Tim Warner (techtrainertim.com)

# Ref: https://timw.info/f88be

# Authenticate to Azure
Connect-AzAccount
Set-AzContext -SubscriptionName 'Microsoft Azure Sponsorship'

# Get Azure Blueprints module
Install-Module -Name Az.Blueprint -Force ; Update-Help -ErrorAction SilentlyContinue

# Get a reference to the sample blueprint object
$blueprint = New-AzBlueprint -Name 'MyBlueprint' -BlueprintFile .\blueprint.json

# Add artifacts
New-AzBlueprintArtifact -Blueprint $blueprint -Name 'roleContributor' -ArtifactFile .\artifacts\roleContributor.json

New-AzBlueprintArtifact -Blueprint $blueprint -Name 'policyTags' -ArtifactFile .\artifacts\policyTags.json

New-AzBlueprintArtifact -Blueprint $blueprint -Name 'policyStorageTags' -ArtifactFile .\artifacts\policyStorageTags.json

New-AzBlueprintArtifact -Blueprint $blueprint -Type TemplateArtifact -Name 'templateStorage' -TemplateFile .\artifacts\templateStorage.json -TemplateParameterFile .\artifacts\templateStorageParams.json -ResourceGroupName storageRG

New-AzBlueprintArtifact -Blueprint $blueprint -Name 'roleOwner' -ArtifactFile .\artifacts\roleOwner.json

# Publish the blueprint
Publish-AzBlueprint -Blueprint $blueprint -Version '1.0.0.0'

# Assign the blueprint
New-AzBlueprintAssignment -Blueprint $blueprint -Name 'assignMyBlueprint' -AssignmentFile .\blueprintAssignment.json

# Unassign the blueprint
Remove-AzBlueprintAssignment -Name 'assignMyBlueprint'
