#variable used to find the users desktop you can also just use %desktop% I just found that this was more consistent for my enviroment
$DesktopPath = [Environment]::GetFolderPath("Desktop")
#variable used to check to see if RDP client exists
$testIfThere = Test-Path -Path $DesktopPath\*.RDP -PathType Leaf
#set timezone 
tzutil /s "Eastern Standard Time"
#set high performance power option
powercfg /s SCHEME_MIN
#check if .RDP exists on desktop
If ($testIfThere) {
exit
}
#if it doesn't, copy it from your DC's network path to the desktop. 
Else { 
Copy-Item -Path "\\test-dc\C$\RDP clients\test1.rdp" -destination $DesktopPath
Copy-Item -Path "\\test-dc\C$\RDP clients\test2.rdp" -destination $DesktopPath
Copy-Item -Path "\\test-dc\C$\RDP clients\test3.rdp" -destination $DesktopPath
Copy-Item -Path "\\test-dc\C$\RDP clients\test4.rdp" -destination $DesktopPath
Copy-Item -Path "\\test-dc\C$\RDP clients\test5.rdp" -destination $DesktopPath
}
exit
