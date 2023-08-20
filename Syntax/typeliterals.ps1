#using a type literal
$i = [int] '123'
#changing the literal and also creating an array of integers
$i = [int[]] '123'
#view types in powershell:
$tna = [psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')::Get
$tna.GetEnumerator() | Sort-Object Key