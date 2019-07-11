# Enforce web app redirects all HTTP traffic to HTTPS in Azure App Service


            #loop through all subscriptions
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
Get-AzWebApp -ErrorAction Ignore -PipelineVariable webapp | `
    where {$webapp.HttpsOnly -ne $true} | foreach {
    $webapp |  Set-Azwebapp -ResourceGroupName $webapp.ResourceGroup -HttpsOnly $true 
    }
    }

