## Remove-AzManagementGroupSubscription -GroupId 'Contoso' -SubscriptionId '12345678-1234-1234-1234-123456789012'

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

##Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
##let this run for a little bit, Az modules will take a few minutes to newly install.

Connect-AzAccount
##Set-AzContext if needed, ensure you're in the correct tenant. 

$csvFile = "ivanti-msdn-subs-batch.csv"
$table = Import-CSV $csvFile -Delimiter ","


foreach ($row in $table) 

##.SubscriptionGUID is referenced to only go through this column specifically. As long as this column is present, script can run the update.

    {
    New-AzManagementGroupSubscription -GroupId 'ManagementGroupNameExampleHere' -SubscriptionId $row.SubscriptionGuid 
    }
