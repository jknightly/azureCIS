get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {

    Get-AzStorageAccount | Get-AzStorageContainer -pipelinevariable azstorcont | `

        where {$azstorcont.PublicAccess -NE "Off"  }| Set-AzStorageContainerAcl -Permission "Off" -passthru}