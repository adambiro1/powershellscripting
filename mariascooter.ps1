# Playing Maria with powershell
$gsharp = 207
$bnatural = 246
$csharp = 277
$dsharp = 311
$half = 1000
$quarter = 500
$eighth = 250
<#
gsharp = 207Hz
bnatural = 246Hz
csharp = 277Hz
dsharp = 311Hz
#>

function Play-Melody {
[console]::beep($gsharp,$quarter)
[console]::beep($dsharp,$quarter)
[console]::beep($gsharp,$quarter)
[console]::beep($dsharp,$eighth)
[console]::beep($csharp,$eighth)
[console]::beep($bnatural,$quarter)
[console]::beep($bnatural,$quarter)
[console]::beep($bnatural,$half)
[console]::beep($bnatural,$quarter)
[console]::beep($dsharp,$quarter)
[console]::beep($bnatural,$quarter)
[console]::beep($dsharp,$eighth)
[console]::beep($bnatural,$eighth)
[console]::beep($gsharp,$quarter)
[console]::beep($gsharp,$quarter)
[console]::beep($gsharp,$half)
}
function Say-text {
    [CmdletBinding()]
    param([Parameter(Mandatory)] 
    [string] $TEXT)
(New-Object -ComObject sapi.spvoice).speak($TEXT)}

function main {
    Say-text("oooooo my, turn up the base boy")
    foreach($i in 1..2){Play-Melody};

}
main