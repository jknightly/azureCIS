# Audit web app redirects all HTTP traffic to HTTPS in Azure App Service

$shellOutFilePath = "~/clouddrive/webapp_redirect_status.csv"

Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach{
Get-AzWebApp -ErrorAction Ignore -PipelineVariable webapp | select `
    @{n='SubscriptionName';e={$AzureRMSub.Name}}, `
    @{n='ResourceGroupName';e={$webapp.ResourceGroup}}, `
    @{n='Name';e={$webapp.Name}}, `
    @{n='HttptoHttpsOnly';e={$webapp.HttpsOnly}}
    } | Export-Csv $shellOutFilePath -Append -NoTypeInformation
    

