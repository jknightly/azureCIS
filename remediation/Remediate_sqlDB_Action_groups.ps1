    #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer  -ErrorAction Ignore | Get-AzSqlserverAuditing -ErrorAction Ignore -pipelinevariable dbaudit | `
    where {$dbaudit.AuditActionGroup -notmatch "SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP
FAILED_DATABASE_AUTHENTICATION_GROUP
BATCH_COMPLETED_GROUP"} | foreach {
    $dbaudit| Set-AzSqlServerAuditing -State Enabled -AuditActionGroup @('SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP', 'FAILED_DATABASE_AUTHENTICATION_GROUP', 'BATCH_COMPLETED_GROUP')

    }
    }

    ###### Informational####
# WARNING: NOTE : Go to https://aka.ms/azps-changewarnings for steps to suppress this breaking change warning, and other information on breaking changes in Azure PowerShell.
# WARNING: Breaking changes in the cmdlet 'Get-AzSqlServerAuditing' :
# WARNING:  - The cmdlet 'GetAzSqlServerAudit' is replacing this cmdlet.