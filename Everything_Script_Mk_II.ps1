cd C:\

# Step 1                                                              #
# Checks to see if scrip has already run once and skips if it has not #
$ChkFile = "C:\PS_Update" 
$FileExists = Test-Path $ChkFile 

# Step 2                             #
# If script has run once, runs 3 - 7 #
If ($FileExists -eq $True) {

pause

# Step 3                                            #
# Sets USB Drive with files as veriable "$USBDrive" #
$USBDrive = Get-WMIObject Win32_Volume | ? { $_.Label -eq 'Storage' } | select -expand driveletter

# Step 4                       #
# Removed junk Windows 10 apps #
# To uninstall Messaging and Skype Video apps together:
get-appxpackage *messaging* | remove-appxpackage

# To uninstall Sway:
get-appxpackage *sway* | remove-appxpackage

# To uninstall Phone:
get-appxpackage *commsphone* | remove-appxpackage

# To uninstall Phone Companion:
get-appxpackage *windowsphone* | remove-appxpackage

# To uninstall Calendar and Mail apps together:
get-appxpackage *communicationsapps* | remove-appxpackage

# To uninstall People:
get-appxpackage *people* | remove-appxpackage

# To uninstall Groove Music:
get-appxpackage *zunemusic* | remove-appxpackage

# To uninstall Movies  TV:
get-appxpackage *zunevideo* | remove-appxpackage

# To uninstall Money:
get-appxpackage *bingfinance* | remove-appxpackage

# To uninstall News:
get-appxpackage *bingnews* | remove-appxpackage

# To uninstall Sports:
get-appxpackage *bingsports* | remove-appxpackage

# To uninstall Weather:
get-appxpackage *bingweather* | remove-appxpackage

# To uninstall OneNote:
get-appxpackage *onenote* | remove-appxpackage

# To uninstall Alarms/Clock:
get-appxpackage *alarms* | remove-appxpackage

# To uninstall Camera:
get-appxpackage *camera* | remove-appxpackage

# To uninstall Maps:
get-appxpackage *maps* | remove-appxpackage

# To uninstall Voice Recorder:
get-appxpackage *soundrecorder* | remove-appxpackage

# To uninstall Xbox:
get-appxpackage *xboxapp* | remove-appxpackage

# To uninstall Microsoft Solitaire Collection:
get-appxpackage *solitaire* | remove-appxpackage

# To uninstall Get Office:
get-appxpackage *officehub* | remove-appxpackage

# To uninstall Get Skype:
get-appxpackage *skypeapp* | remove-appxpackage

# To uninstall Get Started/Tips:
get-appxpackage *getstarted* | remove-appxpackage

# To uninstall 3D Builder:
get-appxpackage *3dbuilder* | remove-appxpackage

# To uninstall Twitter:
get-appxpackage *twitter* | remove-appxpackage

# To uninstall Pandora:
get-appxpackage *pandora* | remove-appxpackage

# To uninstall Feedback Hub:
get-appxpackage *feedbackhub* | remove-appxpackage

# To uninstall FarmVille 2:
get-appxpackage *farmville* | remove-appxpackage

# To uninstall Candy Crush:
get-appxpackage *candycrush* | remove-appxpackage

# To uninstall Drawboard PDF:
get-appxpackage *drawboardpdf* | remove-appxpackage

# To uninstall Paid Wi-Fi and Cellular:
get-appxpackage *oneconnect* | remove-appxpackage

# To uninstall Cyberlink Media Suite Essentials:
get-appxpackage *cyberlink* | remove-appxpackage

# To uninstall Fresh Paint:
get-appxpackage *freshpaint* | remove-appxpackage

# To uninstall Pics Art:
get-appxpackage *picsart* | remove-appxpackage

# To uninstall Translator:
get-appxpackage *translator* | remove-appxpackage

# To uninstall Paradise Bay:
get-appxpackage *paradisebay* | remove-appxpackage

# To uninstall Netflix:
get-appxpackage *netflix* | remove-appxpackage

# To uninstall Minecraft:
get-appxpackage *minecraft* | remove-appxpackage

# To uninstall Facebook:
get-appxpackage *facebook* | remove-appxpackage

# To uninstall Travel
get-appxpackage *travel* | remove-appxpackage

# To uninstall Reading List App
get-appxpackage *reading* | remove-appxpackage

# To uninstall Health and Fitness
get-appxpackage *healthandfitness* | remove-appxpackage

# To uninstall Food and Drink
get-appxpackage *foodanddrink* | remove-appxpackage

# To uninstall Network Speed Test
get-appxpackage *networkspeedtest* | remove-appxpackage

# To uninstall Duolingo:
get-appxpackage *duolingo* | remove-appxpackage

# To uninstall Eclipse Manager:
get-appxpackage *eclipse* | remove-appxpackage

# To uninstall Microsoft Power Bi:
get-appxpackage *powerbi* | remove-appxpackage

# To uninstall Xbox Game Speech Window:
get-appxpackage *xboxspeechtotextoverlay* | Remove-AppxPackage

# To uninstall Sling:
get-appxpackage *sling* | remove-appxpackage

# To uninstall Remote Desktop:
get-appxpackage *remotedesktop* | remove-appxpackage

# To uninstall Adobe Photoshop Express:
get-appxpackage *photoshopexpress* | remove-appxpackage

# To uninstall Code Writer:
get-appxpackage *562882FEEB491* | remove-appxpackage

# To uninstall Paint 3d:
get-appxpackage *mspaint* | remove-appxpackage

# To uninstall 3d Viewer
get-appxpackage *3dviewer* | remove-appxpackage

# To uninstall Keeper Password Manager
get-appxpackage *keeper* | remove-appxpackage

# To uninstall Phototastic Collage
get-appxpackage *phototastic* | remove-appxpackage

# To uninstall Plex
get-appxpackage *plex* | remove-appxpackage

# To uninstall Sketchbook
get-appxpackage *sketchbook* | remove-appxpackage

# To uninstall Bubble Witch Saga 3
get-appxpackage *bubblewitch* | remove-appxpackage

# To uninstall March of Empires: War of Worlds
get-appxpackage *marchofempires* | remove-appxpackage

pause

$a = new-object -ComObject wscript.shell

# Checks is updates installed #
$intanswer = $a.popup("Did Updates Install?", 0, "Install Updates", 4)
If ($intAnswer -eq 7) {
dir C:\PS_Update\*.psm1 | Unblock-File
dir C:\PS_Update\*ps1xml | Unblock-File
set-executionpolicy unrestricted -Force
ipmo "C:\PS_Update\PSWindowsUpdate"
Get-WUInstall -acceptall
#Set-ExecutionPolicy remoteSigned
}

$intanswer = $a.popup("Did Ninite Install?", 0, "Install Ninite", 4)
If ($intAnswer -eq 7) {
& "$USBDrive\Deployment Toolkit\Ninite 7Zip Air Chrome Flash Java NET 462 Reader Installer.exe" /silent
}

$intanswer = $a.popup("Did LabTech Install?", 0, "Install LabTech", 4)
If ($intAnswer -eq 7) {
& "$USBDrive\Deployment Toolkit\Agent_Install.exe"
}

pause

# Step 5
# Removes folders created in steps 12 and 14 #
Remove-Item -Path "C:\PS_Update" -Recurse
Remove-Item -Path "C:\PS_RunOnce" -Recurse

pause

# Step 6                                                         #
# Asks if you would like to install different versions of Office #
# Versions Offered as of 11/09/17 -                              #
#                   Office 2016 Pro Plus                         #
#					Office 2016 Business                         #
#					Office 2013 Standard VLSC                    #
#					Office 2013 ProPlus  VLSC                    #
#					Office 2016 Standard VLSC                    #
$a = new-object -ComObject wscript.shell

# OFFICE 2016 PROPLUS #

$intanswer = $a.popup("Install Office 2016 ProPlus?", 0, "Install Office", 4)
If ($intAnswer -eq 6) {
& "$USBDrive\Deployment Toolkit\O365ProPlus\setup.exe" /configure "$USBDrive\Deployment Toolkit\O365ProPlus\O365ProPlus.xml"
} else {

# OFFICE 2016 BUSINESS #

$intanswer = $a.popup("Install Office 2016 Business?", 0, "Install Office", 4)
If ($intAnswer -eq 6) {
& "$USBDrive\Deployment Toolkit\O365Business\setup.exe" /configure "$USBDrive\Deployment Toolkit\O365Business\O365Business.xml"
} else { 

# OFFICE 2013 STANDARD #

$intanswer = $a.popup("Install Office 2013 Standard?", 0, "Install Office", 4)
If ($intAnswer -eq 6) {
& "$USBDrive\Deployment Toolkit\Office\office2013Standard\setup.exe"
} else { 

# OFFICE 2013 PRO PLUS #

$intanswer = $a.popup("Install Office 2013 ProPlus?", 0, "Install Office", 4)
If ($intAnswer -eq 6) {
& "$USBDrive\Deployment Toolkit\Office\office2013proplus\setup.exe"
} else { 

# OFFICE 2016 STANDARD #

$intanswer = $a.popup("Install Office 2016 Standard?", 0, "Install Office", 4)
If ($intAnswer -eq 6) {
& "$USBDrive\Deployment Toolkit\Office\office2016standard\setup.exe"
} else { 

# NO OFFICE INSTALLED #
$a.Popup("No Office Installed")
}}}}}

pause

# Step 7        #
# Closes script #
Set-ExecutionPolicy Default -Force
Exit
}

# Step 8                         #
# Sets Windows 10 power settings #

# Enable Remote Desktop

(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1) | Out-Null
(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null
 Get-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true

# Set time zone to Eastern Standard Time #
Set-TimeZone "Eastern Standard Time"
Start-Service w32time
w32tm /resync
 
# Turn off NIC option "Allow this device to turn off to Save Power" 

$file = "C:\NICpowerChange.log"
"Searching for Dell / Intel" | Add-Content -Path $file

#find relevant network adapters
$nics = Get-WmiObject Win32_NetworkAdapter | where {$_.Name.Contains('Dell') -or $_.Name.Contains('Intel')}

$nicsFound = $nics.Count
"number of network adapters found: ", $nicsFound | Add-Content -Path $file

foreach ($nic in $nics)
{
   $powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | where {$_.InstanceName -match [regex]::Escape($nic.PNPDeviceID)}
 
   # check to see if power management can be turned off
   if(Get-Member -inputobject $powerMgmt -name "Enable" -Membertype Properties){

     # check if powermanagement is enabled
     if ($powerMgmt.Enable -eq $True){
       $nic.Name, "----- Enabled method exists. PowerSaving is set to enabled, disabling..." | Add-Content -Path $file
       $powerMgmt.Enable = $False
       $powerMgmt.psbase.Put()
     }
     else
     {
       $nic.Name, "----- Enabled method exists. PowerSaving is already set to disabled. skipping..." | Add-Content -Path $file
     }
   }
   else
   {
     $nic.Name, "----- Enabled method doesnt exist, so PowerSaving cannot be set" | Add-Content -Path $file 
   }
}


# Set User Account Control to "Never Notify"


#New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force



# Windows 10 Power Configuration.


echo Now configuring your Power Plan.
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -h off
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 2
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 2
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 7200
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 7200
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 75
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 75
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 f1fbfde2-a960-4165-9f88-50667911ce96 50
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 2
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 2
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469 5
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 10
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f d8742dcb-3e6a-4b3c-b3fe-374623cdcf06 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 3
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c e73a048d-bf27-4f12-9731-8b2076e8891f f3c5027d-cd16-4930-aa6b-90db844a8f00 3
echo Your Power Plan has been configured.
pause

# Step 9                                            #
# Sets USB Drive with files as veriable "$USBDrive" #
$USBDrive = Get-WMIObject Win32_Volume | ? { $_.Label -eq 'Storage' } | select -expand driveletter

# Step 10                                                                                       #
# Installs Ninite Programs (7Zip, Air, Chrome, Flash, Java, NET 4.62, Adobe Reader DC) silently #
& "$USBDrive\Deployment Toolkit\Ninite 7Zip Air Chrome Flash Java NET 462 Reader Installer.exe" /silent

# Step 11                                 #
# Removes preinstalled versions of Office #
& "$USBDrive\Deployment Toolkit\Junk Removal\OffScrub_O15msi.vbs"
& "$USBDrive\Deployment Toolkit\Junk Removal\OffScrub_O16msi.vbs"
& "$USBDrive\Deployment Toolkit\Junk Removal\OffScrubc2r.vbs"

# Step 12                                                            #
# Moves PowerShell module to install Windows Updates to C:\PS_Update #
Copy-Item -path "$USBDrive\Deployment Toolkit\PSWindowsUpdate" -Destination "C:\PS_Update" -Recurse

# Step 13                                                                     #
# Unblocks Update module, adds module to powershell, and runs Windows Updates #
dir C:\PS_Update\*.psm1 | Unblock-File
dir C:\PS_Update\*ps1xml | Unblock-File
set-executionpolicy unrestricted -Force
ipmo "C:\PS_Update\PSWindowsUpdate"
Get-WUInstall -MicrosoftUpdate -acceptall -IgnoreReboot
#Set-ExecutionPolicy remoteSigned

Do {
$return = Get-WUInstallerStatus -silent
Get-WUInstallerStatus
Start-Sleep -Seconds 60
} while ($return -eq "False")

# Wait for Ninite to finish #
Wait-Process Ninite

# Step 14                            #
# Moves prep script to C:\PS_RunOnce #
new-Item c:\PS_RunOnce -ItemType Directory
Copy-Item -Path "$USBDrive\Everything_Script_Mk_II.ps1" -Destination "C:\PS_RunOnce"
Copy-Item -Path "$USBDrive\RunOnce.ps1" -Destination "C:\PS_RunOnce"
dir C:\PS_RunOnce\*.ps1 | Unblock-File

# Step 15                                                       #
# Creates RunOnce registry key to run script after rebooting PC #
$regCheck = Test-Path HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce
If ($regCheck -eq $True) {
Set-Location -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce'
Set-ItemProperty -Path . -Name removePrograms -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File C:\PS_RunOnce\RunOnce.ps1'
} else {
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion
New-Item -Path . -Name RunOnce
Set-ItemProperty -Path .\RunOnce -Name removePrograms -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File C:\PS_RunOnce\RunOnce.ps1'
}

# Step 16                       #
# Install default LabTech agent #
& "$USBDrive\Deployment Toolkit\Agent_Install.exe"

pause

# Step 17
# Reboots PC #
Restart-Computer