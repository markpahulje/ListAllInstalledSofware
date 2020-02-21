#============================================================================================================================================================
# AUTHOR:         metadataconsult@gmail.com
# WEBSITE:        http://metadataconsulting.blogspot.com
#
# SCRIPT NAME:    GetListofInstalledSoftware.ps1  
# DATE:           21/02/2020 
# VERSION:        1.0.0.0
#
# SYNPOSIS:       Get list of installed software to uninstall software that is not listed in "Add remove programs"
#                 Does not truncate lines when like when using autoformat
#                 Works with Powershell 3.0.x.x+ 
#
# NOTES:          To execute, highlight and choose Run Selection
#                 Use msiexec.exe /x UninstallString for in ouput file
#============================================================================================================================================================

$username = $env:UserName
write-host " getting installed software for user $username" 
cd "C:\Users\$username\Documents"

get-itemproperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object * | Format-List -Property * > "C:\Users\$username\Documents\InstalledSoftwareRegistrywithUninstallerStringAll-WOW64.txt"
#For windows 10
get-itemproperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' Select-Object * | Format-List -Property * > "C:\Users\"+ $username + "\Documents\InstalledSoftwareRegistrywithUninstallerStringAll.txt"

get-childitem "Installed*.*" | sort LastWriteTime | Select Name, CreationTime
