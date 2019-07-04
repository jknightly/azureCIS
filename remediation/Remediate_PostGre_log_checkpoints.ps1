Get-AzContext -ListAvailable -PipelineVariable AzuremSub | Set-AzContext |
foreach{
    $postGre = $null;
    $postGre = Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore;
    if($postGre){
         $logcon = Get-AzResource -ResourceGroupName $PostGre.ResourceGroupName `
        -ResourceType Microsoft.DBforPostgreSQL/servers/configurations `
        -ResourceName (-join $PostGre.Name + '/log_checkpoints') -ApiVersion 2017-12-01;
        If($logcon.Properties.Value -eq "OFF"){
            $logcon.Properties.Value = 'on';
            $logcon |  Set-AzResource -ApiVersion 2017-12-01 -Force;
        }
    }
}
