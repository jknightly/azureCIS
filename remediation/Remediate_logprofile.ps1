#enable EH for a list of subscriptions 

# login to azure account
Login-AzAccount 

# Settings needed for the new log profile
$logProfileName = "default"
$locations = (Get-AzLocation).Location
$locations += "global"
$subscriptionId = "bd8a379d-3838-4d9b-b7be-6e33d82a33de"
$resourceGroupName = "Default-ActivityLogAlerts"
$eventHubNamespace = "hwscevents"

# Build the service bus rule Id from the settings above
$serviceBusRuleId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.EventHub/namespaces/$eventHubNamespace/authorizationrules/RootManageSharedAccessKey"

$path = 'C:\Temp\substoeh.txt'
$sub = (Get-Content -Path $path)

    foreach ($s in $sub) {
      Select-AzSubscription -subscription $s
    Add-AzLogProfile -Name $logProfileName -Location $locations -ServiceBusRuleId $serviceBusRuleId
     }
