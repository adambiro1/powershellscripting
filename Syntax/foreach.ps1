#foreach ($<item> in $<collection>){<statement list>}
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray)
{
  Write-Host $letter
}
