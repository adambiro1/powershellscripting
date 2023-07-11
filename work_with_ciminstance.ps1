get-ciminstance -ClassName Win32_Bios
#pipe it to what property you want
| select-object -Property SerialNumber
