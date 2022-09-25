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

#foreach method

$data = 1,2,3,4,5
($data).ForEach({$_ * 2})

#if needed to change the type use this method

$data | Get-Member
$data.ForEach([double]) | Get-Member

#fibonacci (below 100)
$($c=$p=1; while ($c -lt 100) {$c; $c,$p=($c+$p),$c}).count

#put name of the porperty in variable
$prop = 'length'
'Hello Wolrd'.$prop

#do a window
using assembly  System.Windows.Forms
using namespace System.Windows.Forms
$form = [Form] @{
    Text = 'My First Form'
}
$button = [Button] @{
    Text = 'Push Me!'
    Dock = 'Fill'
}
$button.add_Click{
    $form.Close()
}
$form.Controls.Add($button)
$form.ShowDialog()



#check if variable exists
Test-Path variable:myNewVariable

#creating varaibles
$var = 1

# can contain anything even closed bracets just espace it `}
${ddsdf  dfdfd cdfdfde} = 1

#global variable
$global:var = 13

#enviroment variable
$env:SystemRoot


