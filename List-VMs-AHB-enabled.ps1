Connect-AzAccount
$subscriptionId = "your-subscription-id"
Select-AzSubscription -SubscriptionId $subscriptionId
$vmList = Get-AzVM
$ahbCount = 0

foreach ($vm in $vmList) {
    $vmLicenseType = $vm.LicenseType
    if ($vmLicenseType -eq "Windows_Server") {
        $sqlConfig = Get-AzVMExtension -ResourceGroupName $vm.ResourceGroupName -VMName $vm.Name -Name "Microsoft.SqlServer.Management.SqlIaaSAgent"
        if ($sqlConfig -ne $null) {
            $sqlConfig = $sqlConfig | ConvertFrom-Json
            $sqlLicenseType = $sqlConfig.settings.SQLConnectivity.LicenseType
            if ($sqlLicenseType -eq "AHUB") {
                $ahbCount++
            }
        }
    }
}

Write-Host "Total number of SQL Servers using Azure Hybrid Benefit: $ahbCount"
