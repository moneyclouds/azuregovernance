Connect-AzAccount
$subscriptionId = "your-subscription-id"
Select-AzSubscription -SubscriptionId $subscriptionId
$vmList = Get-AzVM
$ahbCount = 0

foreach ($vm in $vmList) {
    $vmLicenseType = $vm.LicenseType
    if ($vmLicenseType -eq "Windows_Server") {
        $ahbStatus = $vm.LicenseTypeStatus
        if ($ahbStatus -eq "Licensed") {
            $ahbCount++
        }
    }
}

Write-Host "Total number of VMs using Azure Hybrid Benefit: $ahbCount"
