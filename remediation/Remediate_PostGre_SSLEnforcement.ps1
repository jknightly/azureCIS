    $postGre = $null;
    $postGre = Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore;


Get-AzContext -ListAvailable -PipelineVariable AzuremSub | Set-AzContext |
foreach{
 #   $postGre = $null;
 #   $postGre = Get-AzResource -ResourceType Microsoft.DBforPostgreSQL/servers -ExpandProperties -ErrorAction Ignore;
    if($postGre){
        If($PostGre.properties.sslEnforcement -eq "Disabled"){
            $PostGre.Properties.sslEnforcement = 'Enabled';
           $PostGre |  Set-AzResource  -Force;
        }
    }
}

    
