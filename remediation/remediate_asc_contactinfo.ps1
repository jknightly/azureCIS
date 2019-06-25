$contactemail = 'email@customer.com'
$contactph = '555-555-5555'

get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {

$contact = get-azsecuritycontact

if ($contact -eq $null -or $contact.email -eq $null -or $contact.phone -eq $null -or $contact.AlertNotifications -eq $null -or $contact.AlertstoAdmins -eq $null)

{Set-AzSecurityContact -Name "default1" -Email $contactemail -Phone $contactph  -AlertAdmin -NotifyOnAlert}}
