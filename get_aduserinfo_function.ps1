function UserInfo {
$UserID = Read-Host "Give UserID"
Get-ADUser -Filter "Name -eq '$UserID'" -Properties "mail", 	"Manager"}

#or
$Users = get-AdUser -identity a.... -Properties *
$Users | Get-member
$Users | Select-object -Property Name, LastogonDate, LastBadPasswordAttempt
