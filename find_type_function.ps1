function Find-Type {
param
(
[regex]$Pattern
)
[System.AppDomain]::CurrentDomain.
GetAssemblies().GetTypes() |
Select-String $Pattern
}