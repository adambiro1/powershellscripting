# new folder creation function
function New-FolderCreation
{
[CmdletBinding()]
param
(
[Parameter(Mandatory = $true)]
[string]$foldername
)
$logpath  = (Get-Location).path + "\" + "$foldername"
$testlogpath = Test-Path -Path $logpath
if($testlogpath -eq $false)
{
#Start-ProgressBar -Title "Creating $foldername folder" -Timer 10
$null = New-Item -Path (Get-Location).path -Name $foldername -Type directory
}
}#New-FolderCreation