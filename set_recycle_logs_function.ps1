
function Set-Recyclelogs
{
[CmdletBinding(
SupportsShouldProcess = $true,
ConfirmImpact = 'High')]
param
(
[Parameter(Mandatory = $true,ParameterSetName = 'Local')]
[string]$foldername,
[Parameter(Mandatory = $true,ParameterSetName = 'Local')]
[Parameter(Mandatory = $true,ParameterSetName = 'Path')]
[Parameter(Mandatory = $true,ParameterSetName = 'Remote')]
[int]$limit,
[Parameter(ParameterSetName = 'Local',Position = 0)][switch]$local,

[Parameter(Mandatory = $true,ParameterSetName = 'Remote')]
[string]$ComputerName,
[Parameter(Mandatory = $true,ParameterSetName = 'Remote')]
[string]$DriveName,
[Parameter(Mandatory = $true,ParameterSetName = 'Remote')]
[string]$folderpath,

[Parameter(ParameterSetName = 'Remote',Position = 0)][switch]$Remote,

[Parameter(Mandatory = $true,ParameterSetName = 'Path')]
[ValidateScript({
      if(-Not ($_ | Test-Path) ){throw "File or folder does not exist"}
      return $true
})]
[string]$folderlocation,

[Parameter(ParameterSetName = 'Path',Position = 0)][switch]$Path)
switch ($PsCmdlet.ParameterSetName) {
"Local"
{
$path1 = (Get-Location).path + "\" + "$foldername"
if ($PsCmdlet.ShouldProcess($path1, "Delete"))
{
Write-Host "Path Recycle - $path1 Limit - $limit" -ForegroundColor Green
$limit1 = (Get-Date).AddDays(-"$limit") #for report recycling
$getitems = Get-ChildItem -Path $path1 -recurse -file | Where-Object {$*.CreationTime -lt $limit1}
ForEach($item in $getitems){
Write-Verbose -Message "Deleting item $($item.FullName)"
Remove-Item $item.FullName -Force
}
}
}
"Remote"
{
$path1 = "\\" + $ComputerName + "\" + $DriveName + "$" + "\" + $folderpath
if ($PsCmdlet.ShouldProcess($path1, "Delete"))
{
Write-Host "Recycle Path - $path1 Limit - $limit" -ForegroundColor Green
$limit1 = (Get-Date).AddDays(-"$limit") #for report recycling
$getitems = Get-ChildItem -Path $path1 -recurse -file | Where-Object {$*.CreationTime -lt $limit1}
ForEach($item in $getitems){
Write-Verbose -Message "Deleting item $($item.FullName)"
Remove-Item $item.FullName -Force
}
}
}

"Path"
{
$path1 = $folderlocation
if ($PsCmdlet.ShouldProcess($path1, "Delete"))
{
Write-Host "Path Recycle - $path1 Limit - $limit" -ForegroundColor Green
$limit1 = (Get-Date).AddDays(-"$limit") #for report recycling
$getitems = Get-ChildItem -Path $path1 -recurse -file | Where-Object {$_.CreationTime -lt $limit1}
ForEach($item in $getitems){
Write-Verbose -Message "Deleting item $($item.FullName)"
Remove-Item $item.FullName -Force
}
}
}
}

}# Set-Recycle logs

#To recycle logs older than 10 days inside the logs folder in the current directory:

Set-Recyclelogs -foldername logs -limit 10

#Use confirm:$false to avoid confirmation once you are sure that you want to delete the files:

Set-Recyclelogs -foldername logs -limit 10 -confirm:$false

#Use verbose to check which files are getting deleted:

Set-Recyclelogs -foldername logs -limit 10 -confirm:$false -verbose

#You can specifiy the path as well if your script is in another directory and you want to delete logs in another folder structure:

Set-Recyclelogs -folderlocation c:\temp\logs -limit 10

#To recycle logs on a remote machine, use the following syntax:

Set-Recyclelogs -ComputerName testmachine -DriveName c -folderpath data\logs -limit 10