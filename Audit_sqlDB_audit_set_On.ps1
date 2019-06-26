# Login-AzAccount 

$shellOutFilePath = "~/clouddrive/sqlaudit_status.csv"

#loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlDatabase -pipelinevariable sqldb | Get-AzSqlDatabaseAuditing | Export-Csv $shellOutFilePath -Append -NoTypeInformation
    }