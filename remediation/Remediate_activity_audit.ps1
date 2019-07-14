# Remediate Log retention is 365 Days or more 

        #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzLogProfile -ErrorAction Ignore -pipelinevariable log | `
    where {$log.Categories -notmatch "Write
    Delete
    Action" } | foreach {
    $log | Add-AzLogProfile -Name $log.Name -StorageAccountId $log.StorageAccountId -Location $log.Locations -RetentionInDays 365 -Category Write,Delete,Action
    }
    }