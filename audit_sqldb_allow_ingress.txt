# Login-AzureRmAccount 

$shellOutFilePath = "~/clouddrive/sqlData_allow_ingress.csv"



#loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore -pipelinevariable sqlsvr | Get-AzSqlServerFirewallRule -FirewallRuleName AllowAllWindowsAzureIps |  Export-Csv $shellOutFilePath -Append -NoTypeInformation
    }

    