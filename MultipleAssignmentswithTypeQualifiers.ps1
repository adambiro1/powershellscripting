#Multiple assignments with Type Qualifiers
$data = Get-Content -Path data.txt | foreach {
    $e=@{}
    $e.level, [int] $e.lower, [int] $e.upper = -split $_
    $e
}