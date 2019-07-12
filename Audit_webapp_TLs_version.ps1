# Audit web app is using the latest version of TLS encryption

$shellOutFilePath = "~/clouddrive/webapp_minTLs_version.csv"

Get-AzContext -ListAvailable -PipelineVariable AzureRMSub -ErrorAction Ignore | Set-AzContext | foreach {
Get-AzResource -ResourceType Microsoft.Web/sites -ErrorAction Ignore -PipelineVariable webapp | select `
    @{n='SubscriptionName';e={$AzureRMSub.Name}}, `
    ResourceGroupName,Name, `
    @{n='minTlsVersion';e={(Get-AzResource -ResourceGroupName newscriptrg -ResourceType Microsoft.Web/sites/config -ResourceName (-join $webapp.Name + "/web") -ApiVersion 2018-02-01).Properties.minTlsVersion}}
 
} | Export-CSV $shellOutFilePath -NoTypeInformation 



