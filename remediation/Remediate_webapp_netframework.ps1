    # Remediate web app is using the latest version of .Netframework
    #latest version 
$latestversion = "v4.0"
            #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzWebApp -ErrorAction Ignore -PipelineVariable webapp | `
    where {$webapp.SiteConfig.NetFrameworkVersion -ne $latestversion} | foreach {
    $webapp |  Set-Azwebapp -ResourceGroupName $webapp.ResourceGroup -NetFrameworkVersion $latestversion 
    }
    }

