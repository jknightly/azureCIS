# Login-AzAccount 


$bloblstoragename = "dqlauditblob"

    #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlserverAuditing -ErrorAction Ignore -pipelinevariable dbaudit | `
    where {$dbaudit.AuditState -eq "Disabled"} | foreach {
    $dbaudit |  Set-AzSqlServerAuditing -State Enabled -StorageAccountName "dqlauditblob" -RetentionInDays 91

    }
    }


