# get a reference to our ASG
$asg = Get-AzApplicationSecurityGroup -ResourceGroupName oreilly -Name oreilly-asg

# get a reference to VM's vNICs and associate with ASG
$winNic = Get-AzNetworkInterface -Name win-victim-1936 -ResourceGroupName oreilly

$winNic.IpConfigurations[0].ApplicationSecurityGroups = $asg

Set-AzNetworkInterface -NetworkInterface $winNic
