# create the ASGs
$webAsg = New-AzApplicationSecurityGroup -ResourceGroupName 'Load-Balancer' -Name webASG -Location 'eastus2'

# Assign vNICs to ASG
$webNic = Get-AzNetworkInterface -Name 'myNIC0' -ResourceGroupName 'Load-Balancer'
$webNic.IpConfigurations[0].ApplicationSecurityGroups = $webAsg
Set-AzNetworkInterface -NetworkInterface $webNic

$webNic = Get-AzNetworkInterface -Name 'myNIC1' -ResourceGroupName 'Load-Balancer'
$webNic.IpConfigurations[0].ApplicationSecurityGroups = $webAsg
Set-AzNetworkInterface -NetworkInterface $webNic