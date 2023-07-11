#open CMD
Function sudo {param([Parameter(Mandatory)][string]$FilePath,[Parameter(ValueFromRemainingArguments)][string[]]$ArgumentList) Start-Process @PSBoundParameters -Verb Runas}
sudo cmd "/k whoami /priv"

#open PWSH
Function sudo {param([Parameter(Mandatory)][string]$FilePath,[Parameter(ValueFromRemainingArguments)][string[]]$ArgumentList) Start-Process @PSBoundParameters -Verb Runas}
sudo powershell "/k whoami /priv"
