
Get-AzContext -ListAvailable -PipelineVariable AzuremSub | Set-AzContext |foreach{
Get-AzResource -ResourceType Microsoft.Web/sites -ErrorAction Ignore -PipelineVariable webapp| foreach{
         $mintls = Get-AzResource -ResourceGroupName $webapp.ResourceGroupName `
        -ResourceType Microsoft.Web/sites/config `
        -ResourceName (-join $webapp.Name + '/web') -ApiVersion 2018-02-01;
        If($mintls.Properties.minTlsVersion -ne "1.2"){
            $mintls.Properties.minTlsVersion = '1.2';
            $mintls |  Set-AzResource -ApiVersion 2018-02-01 -Force;
        }

    }
}