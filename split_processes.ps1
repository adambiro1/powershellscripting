#find all the processes on a computer that started today
Get-Process | where {$_.starttime -ge [DateTime]::today}


#find the computer name
(net config workstation)[1]

#with regex for match
$p='^Full Computer.* (?<computer>[^.]+)\.(?<domain>[^.]+)'

#match it with pattern
(net config workstation)[1] -match $p

#control
$matches.computer

$matches.domain

#where method is fater than where-object cmdlet
Get-Process | where Handles -gt 1000

(Get-Process).where({$_.Handles -gt 1000})
(Get-Process).where({$psitem.Handles -gt 1000})

#split process
$proc = (Get-Process).where({$_.Handles -gt 1000}, 'Split')


