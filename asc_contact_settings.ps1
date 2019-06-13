get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
$contact = get-azsecuritycontact
if ($contact -eq $null -or $contact.email -eq $null -or $contact.phone -eq $null -or $contact.AlertNotifications -eq $null -or $contact.AlertstoAdmins -eq $null)
    {AzureRMsub | out-file ~/clouddrive/ASC_contacts_not_set.csv -append}
}
