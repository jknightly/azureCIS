Get-AzContext -ListAvailable -PipelineVariable AzuremSub | Set-AzContext |foreach{
Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore -PipelineVariable PostGre| foreach{
         $logcon = Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
        -ResourceName (-join $PostGre.Name + '/log_duration') -ApiVersion 2017-12-01;
        If($logcon.Properties.Value -eq "OFF"){
            $logcon.Properties.Value = 'on';
            $logcon.Properties.source = 'user-override';
            $logcon |  Set-AzResource -ApiVersion 2017-12-01 -Force;
        }

    }
}
