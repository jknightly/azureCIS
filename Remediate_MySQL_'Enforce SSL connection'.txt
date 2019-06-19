
#loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzResource -ResourceType Microsoft.DBforMySQL/servers -ErrorAction Ignore -ExpandProperties -pipelinevariable mysql | `
    where {$mysql.properties.sslEnforcement -eq "Disabled"} | foreach {
    $mysql.Properties.sslEnforcement = 'Enabled'
    $mysql |  Set-AzResource  -Force

    }
    }






