
    # Audit web app is using the latest version of .Netframework
$shellOutFilePath = "~/clouddrive/webapp_netframework.csv"

#loop through all subscriptions
$report = @()
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach {
$webapps = Get-AzWebApp 
Foreach ($webapp in $Webapps){
$webappfull = $webapp| Get-AzWebApp
$repwebapp = New-Object –TypeName PSObject
$repwebapp | Add-Member –MemberType NoteProperty –Name SubscriptionName –Value $AzureRMSub.Name
$repwebapp | Add-Member –MemberType NoteProperty –Name ResourceGroupName –Value $webappfull.ResourceGroup
$repwebapp | Add-Member –MemberType NoteProperty –Name Name –Value $webappfull.Name
$repwebapp | Add-Member –MemberType NoteProperty –Name NetFrameworkVersion –Value $webappfull.SiteConfig.NetFrameworkVersion
$report += $repwebapp 
}} 
$report | Export-Csv $shellOutFilePath