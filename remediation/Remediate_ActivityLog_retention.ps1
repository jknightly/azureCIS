# Remediate Log retention is 365 Days or more 
# 365 is the limit

    #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzLogProfile -ErrorAction Ignore -pipelinevariable log | `
    where {$log.RetentionPolicy.Days -le 365} | foreach {
    If($log.RetentionPolicy.Days -le 365){
 #   $log.RetentionPolicy.Days = "366"
    $log | Add-AzLogProfile -Name $log.Name -StorageAccountId $log.StorageAccountId -Location $log.Locations -RetentionInDays 365 -Category Write,Delete,Action
    }
    }
    }
