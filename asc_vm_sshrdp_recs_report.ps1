get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$azsectask = get-azsecuritytask
$azsectask | where RecommendationType -EQ  "Close management ports on your Virtual Machines" | foreach {
    $_.ResourceId
    $info = $_.ResourceId
    $sub = $info.split('/')[-7]
    $saname = $info.split('/')[-1]
    $file = $sub + ',' + $saname
    $file | Out-File ~/clouddrive/openrdpssh.csv -Append
     }
 }
