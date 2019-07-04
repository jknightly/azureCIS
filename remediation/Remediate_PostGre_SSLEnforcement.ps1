Get-AzContext -ListAvailable -PipelineVariable AzuremSub | Set-AzContext |foreach{
Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore -PipelineVariable PostGre | foreach{
        If($PostGre.properties.sslEnforcement -eq "Disabled"){
           $PostGre.Properties.sslEnforcement = 'Enabled';
           $PostGre |  Set-AzResource  -Force;
        }
}
}

    
