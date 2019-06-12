get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$contact = get-azsecuritycontact
if ($contact -eq $null)
{$AzureRMsub.Subscription | Out-File -filepath ~/clouddrive/nocontanctinfo.txt -Append}
if ($contact.email -eq $null)
{ $AzureRMsub.Subscription | Out-File  -filepath ~/clouddrive/nocontactemail.txt -Append}
if ($contact.phone -eq $null)
{  $AzureRMsub.Subscription | Out-File  -filepath ~/clouddrive/nocontactphone.txt -Append}
if ($contact.AlertNotifications -eq $null)
{ $AzureRMsub.Subscription | Out-File -filepath ~/clouddrive/noalertnotifications.txt -Append}
if ($contact.AlertstoAdmins -eq $null)
{ $AzureRMsub.Subscription | Out-File  -filepath ~/clouddrive/nocalertstoadmins.txt -Append
}
}