#check if variable exists
Test-Path variable:myNewVariable

#creating varaibles
$var = 1

# can contain anything even closed brackets just escape it `}
${ddsdf  dfdfd cdfdfde} = 1

#global variable
$global:var = 13

#enviroment variable
$env:SystemRoot

#put name of the porperty in variable
$prop = 'length'
'Hello Wolrd'.$prop