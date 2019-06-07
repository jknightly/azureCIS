get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$azsectask = get-azsecuritytask
$azsectask | where RecommendationType -EQ  "Require secure transfer to storage account" | foreach {
    $_.ResourceId
    $info = $_.ResourceId
    $sub = $info.split('/')[-7]
    $saname = $info.split('/')[-1]
    $file = $sub + ',' + $saname
    $file | Out-File ~/clouddrive/sahttps.csv -Append
     }
 }
