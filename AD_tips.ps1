function UserInfo {
$UserID = Read-Host "Give UserID"
Get-ADUser -Filter "Name -eq '$UserID'" -Properties "mail", 	"Manager"}

#or
$Users = get-AdUser -identity a.... -Properties *
$Users | Get-member
$Users | Select-object -Property Name, LastogonDate, LastBadPasswordAttempt


#manage ad acounts status
Get-ADUser -Identity 'username' -Properties LockedOut | Select-Object Name,Lockedout

Unlock-ADAccount -Identity 'username'

Search-ADAccount -lockedout | Select-Object Name, SamAccountName

Search-ADAccount -Lockedout | Unlock-AdAccount

#find last log on in CMD:

net user username /domain| findstr “Last”

#in powershell

Get-ADUser -Identity "username" -Properties LastLogon

#for a normal time format:

Get-ADUser -Filter {Name -eq "username"} -Properties * | Select-Object Name, @{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon)}}
