

#loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlDatabase -pipelinevariable sqldb | Get-AzSqlDatabaseTransparentDataEncryption -ErrorAction Ignore -PipelineVariable sqltde | `
    where {$sqltde.State -eq "Disabled"} | foreach {
    $sqltde | Set-AzSqlDatabaseTransparentDataEncryption  -State Enabled -ErrorAction Ignore

    }}


