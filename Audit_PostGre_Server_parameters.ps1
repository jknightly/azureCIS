
$shellOutFilePath = "~/clouddrive/PostGre_Parameters.csv"


Get-AzContext -ListAvailable -PipelineVariable AzureRMSub -ErrorAction Ignore | Set-AzContext | foreach {
Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore -PipelineVariable PostGre | select `
    @{n='SubscriptionName';e={$AzureRMSub.Name}}, `
    ResourceGroupName,Name, `
    @{n='log_checkpoints';
        e={(Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
            -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
                -ResourceName  (-join $PostGre.Name + "/log_checkpoints") -ApiVersion 2017-12-01).Properties.value}}, `
    @{n='SSL_Enforcement';e={$PostGre.Properties.sslEnforcement}}, `
    @{n='log_connections';e={(Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
            -ResourceName (-join $PostGre.Name + "/log_connections") -ApiVersion 2017-12-01).Properties.value}}, `
    @{n='log_disconnections';e={(Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
            -ResourceName (-join $PostGre.Name + "/log_disconnections") -ApiVersion 2017-12-01).Properties.value}}, `
    @{n='log_duration';e={(Get-AzResource -ResourceGroupName  $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
            -ResourceName (-join $PostGre.Name + "/log_duration") -ApiVersion 2017-12-01).Properties.value}}, `
    @{n='connection_throttling';e={(Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
            -ResourceName (-join $PostGre.Name + "/connection_throttling") -ApiVersion 2017-12-01).Properties.value}}, `
    @{n='log_retention_days';e={(Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
            -ResourceName (-join $PostGre.Name + "/log_retention_days") -ApiVersion 2017-12-01).Properties.value}}
} | Export-CSV $shellOutFilePath -NoTypeInformation 
