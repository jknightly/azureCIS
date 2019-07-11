# remove sqlserverfirewallrul "allowallwindowsazureips"

    #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzSqlServer -ErrorAction Ignore | Get-AzSqlServerFirewallRule  -pipelinevariable sqlfw | `
    where {$sqlfw.FirewallRuleName -eq "AllowAllWindowsAzureIps"} | foreach {
    $sqlfw | remove-AzSqlServerFirewallRule -FirewallRuleName "AllowAllWindowsAzureIps"

    }
    }


