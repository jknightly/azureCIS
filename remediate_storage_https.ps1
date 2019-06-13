get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$azsectask = get-azsecuritytask
$azsectask | where RecommendationType -EQ  "Require secure transfer to storage account" | foreach {
     Set-AzStorageAccount -ResourceGroupName $_.resourceid.split('/')[-5] -accountname  $_.resourceid.split('/')[-1] -EnableHttpsTrafficOnly $true
    }
 }
