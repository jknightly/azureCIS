get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$watcher = get-aznetworkwatcher 
if ($watcher -eq $null)
    {$AzureRmsub | out-file ~/clouddrive/subs_watchernotenabled.csv -Append }}