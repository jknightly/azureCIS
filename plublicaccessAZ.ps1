get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
    Get-AzStorageAccount | Get-AzStorageContainer -pipelinevariable azstorcont | `
        where {$azstorcont.PublicAccess -NE "Off" | Out-File ~/clouddrive/publicstorage.txt}}
