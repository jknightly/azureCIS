get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$lp = get-azlogprofile
$count = $lp.locations | measure-object 
if ($count -lt '33') { $azurermsub | out-file ~/clouddrive/lp_not_all_regions.txt}
if ($lp.id -eq $null) {$azurermsub | out-file ~/clouddrive/nologprofile.txt}
if ($lp.retentionpolicy.enabled -eq 'False') {out-file ~/clouddrive/lP_no_retention.txt}
    elseif ($lp.retentionpolicy.days -lt'365') {out-file ~/clouddrive/lP_short_retention.txt}}