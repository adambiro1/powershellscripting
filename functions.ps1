function InstallSoftware {
[CmdletBinding()]
param([Parameter(Mandatory)]
[string] $Version)
Write-Output "I installed software Version $Version. Yippe!"
}