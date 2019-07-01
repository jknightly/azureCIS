

    #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlserverAuditing -ErrorAction Ignore -pipelinevariable dbaudit | `
    where {$dbaudit.RetentionInDays -le 90} | foreach {
    If($dbaudit.RetentionInDays -le 90){
    $dbaudit |  Set-AzSqlServerAuditing -State Enabled -RetentionInDays 91

    }
    }
    }

 
