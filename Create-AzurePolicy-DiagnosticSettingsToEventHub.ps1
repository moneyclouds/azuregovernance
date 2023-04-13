Install-Script -Name Create-AzDiagPolicy

##Run the script by using the parameters to specify where to send the logs. You'll be prompted to specify a subscription and resource type.
##For example, to create a policy definition that sends logs to a Log Analytics workspace and an event hub, use the following command:


Create-AzDiagPolicy.ps1 -ExportLA -ExportEH -ExportDir ".\PolicyFiles"

##Alternatively, you can specify a subscription and resource type in the command. 
##For example, to create a policy definition that sends logs to a Log Analytics workspace and an event hub for SQL Server databases, use the following command:

Create-AzDiagPolicy.ps1 -SubscriptionID xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx -ResourceType Microsoft.Sql/servers/databases  -ExportLA -ExportEH -ExportDir ".\PolicyFiles"

##The script creates separate folders for each policy definition. 
##Each folder contains three files named azurepolicy.json, azurepolicy.rules.json, and azurepolicy.parameters.json. 
##If you want to create the policy manually in the Azure portal, you can copy and paste the contents of azurepolicy.json because it includes the entire policy definition. 
##Use the other two files with PowerShell or the Azure CLI to create the policy definition from a command line.
New-AzPolicyDefinition -name "Deploy Diagnostic Settings for SQL Server database to Log Analytics workspace" -policy .\Apply-Diag-Settings-LA-Microsoft.Sql-servers-databases\azurepolicy.rules.json -parameter .\Apply-Diag-Settings-LA-Microsoft.Sql-servers-databases\azurepolicy.parameters.json -mode All -Metadata '{"category":"Monitoring"}'
