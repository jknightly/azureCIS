# Remediate Locations


$locations = (Get-AzLocation).Location
$locations += "global"
        #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzLogProfile -ErrorAction Ignore -pipelinevariable log | `
    where {$log.locations -notmatch $locations} | foreach {
    $log | Add-AzLogProfile -Name $log.Name -StorageAccountId $log.StorageAccountId -Location $locations -RetentionInDays 365 -Category Write,Delete,Action
    }
    }
