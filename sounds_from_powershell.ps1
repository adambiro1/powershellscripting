Text to speech + potential exfil data via audio/console beep
(new-Object -ComObject sapi.spvoice).speak("hey everyone")
(new-Object -ComObject sapi.spvoice).speak($(cat c:\temp\speak.txt))
[console]::beep(440,1000)