
$shellOutFilePath = "~/clouddrive/sqlData_encryption_status.csv"

#loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlDatabase -pipelinevariable sqldb | Get-AzSqlDatabaseTransparentDataEncryption | Export-Csv $shellOutFilePath -Append -NoTypeInformation
    }