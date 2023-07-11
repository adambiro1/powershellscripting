#for each method

$data = 1,2,3,4,5
($data).ForEach({$_ * 2})

#if needed to change the type use this method

$data | Get-Member
$data.ForEach([double]) | Get-Member