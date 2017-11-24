*************************************************
*	PREP SCRIPT INSTALL INSTRUCTIONS	*
*	Modified:	11/09/17		*
*	Modified By:	Benjamin Dadian		*
*************************************************

!!----PLEASE READ ALL INSTRUCTIONS BEFORE STARTING----!!

I.	Disclaimer:

	1.	This looks like a lot of steps, but that is because it is painfully specific. In total, this should take about 10 min to run
	2.	This script is designed to help automate the prepping of Windows 10 PCs. This script will not work on Windows 7.
	3.	As of the time this instruction manual was written, the script has only been used in the field 5 times (3 times successfully).           This script has 
		  not gone through enough testing for widescale use and is not fool proof.
	4.	This script is powerful (and a lot of fun). If tampered with, stuff could break.
	5.	Let’s be honest. You are prepping a PC. If everything goes wrong or you are worried about something, you can just wipe and reload Windows
	6.	There is more yet to be scripted (mostly workarounds to something going wrong)

II.	Different Parts of the Script:
	(these parts are commented in the script and listed with the same numbers)

	1.	Checks to see if scrip has already run once and skips if it has not
	2.	If script has run once, runs 3 - 7
	3.	Sets USB Drive with files as variable "$USBDrive"
	4.	Removed junk Windows 10 apps
	5.	Removes folders created in steps 12 and 14
	6.	Asks if you would like to install different versions of Office
		# Versions Offered as of 11/09/17 -	Office 2016 Pro Plus      #
		#					Office 2016 Business      #
		#					Office 2013 Standard VLSC #
		#					Office 2013 ProPlus VLSC  #
		#					Office 2016 Standard VLSC #
	7.	Closes script
	8.	Sets Windows 10 power settings
	9.	Sets USB Drive with files as variable "$USBDrive"
	10.	Installs Ninite Programs (7Zip, Air, Chrome, Flash, Java, NET 4.62, Adobe Reader DC) silently
	11.	Removes preinstalled versions of Office
	12.	Moves PowerShell module to install Windows Updates to C:\PS_Update
	13.	Unblocks Update module, adds module to PowerShell, and runs Windows Updates
	14.	Moves prep script to C:\PS_RunOnce
	15.	Creates RunOnce registry key to run script after rebooting PC
	16.	Installs default LabTech agent
	17.	Reboots PC

III.	Instructions:
	
	* This kit has two parts. Part one deals with Out-Of-Box-Experience (OOBE) when you first boot up PC. Part two deals with everything       after the OOBE *
	
	1.	All programs and files needed to run this script is located on the Mainstay file server at \\fs2008\BLABLABLA
	
	2.	In total, everything is 6.34 GB. It requires an 8 GB USB stick or portable hard drive to run
	
	3.	Rename USB stick or portable hard drive to "Storage"
	
	4.	Navigate to \\fs2008\Public\Deployments\Prep Kit
	
	5.	Copy content of folder to root of USB device (do not change the structure. If the structure changes, the script will not work)
	
	6.	Move to PC that will be prepped
	
	- Part 1 -	
	
	7.	Power on new PC
	
	8.	Insert USB device
	
	9.	You will see a screen that Windows in installing provisioning package. This package will set all 
		  required settings for a new PC, create an mstech account, and set the password to the local password
		  * Password Current as of 11/09/17
	
	10.	If you are not logged into mstech account, log in
	
	- Part 2 -
	
	11.	Navigate to USB device on PC
	
	12.	Open "Everything_Script_Mk_II.ps1" as a text document
	
	13.	Press Ctrl+A (or highlight all text) to select everything
	
	14.	Press Ctrl+C (or right click, copy) to copy text

	15.	Open PowerShell as Admin
		1.	Click the Windows key and type PowerShell
		2.	Right-click PowerShell
		3.	Select "Run as administrator"

	16.	PowerShell may take a few moments to load. It is important that you do not paste the script in until after it 
		  has fully loaded. You should see a line of text pointing to PowerShell.exe and a blinking curser.

	17.	After you see the blinking curser next to PowerShell.exe, wait at least 5 seconds then past what you copied in step 14

	18.	If the text starts to slowly fill the window, close PowerShell immediately and start at step 15 again, but wait longer for               PowerShell to load

	19.	After text is pasted in, hit "Enter"

	20.	You should see displayed after a little while "Now configuring your Power Plan" then "Your Power Plan has been configured" "Hit         Enter to continue"

	21.	Hit "Enter" again

	22.	Ninite programs will start installing silently. Two boxes will pop up for removing preinstalled Office. Click "Ok" on both

	23.	Windows Updates will also start installing in 4 steps. If you see a message along the lines of "Waiting on reboot", 
		  Windows Updates did not install and will need to be installed manually after reboot (found a way around this. Working on scripting       it ~ben).

	24.	After updates finish, check that Adobe Acrobat Reader DC is on the desktop. If it is not, wait for it to show up

	25.	If Adobe Acrobat Reader DC shows up, you can continue. If there is a prompt in PowerShell to reboot, hit 'n' then "Enter"

	26.	Hit "Enter" again

	27.	The script checks to see if the regkey RunOnce exists. If it does not, it is created

	28.	The location of the script is added to that regkey so it runs after the next reboot.

	29.	LabTech will now install. After it finishes, you will be notified by a pop up. Click "Ok" then "Enter"

	30.	The PC will now reboot. After reboot, login as mstech and wait for PowerShell to open again.

	31.	When prompted, press "Enter" to continue

	32.	PowerShell will now uninstall a list of preinstalled apps (list is updating regularly, but might not be completely up to date)

	33.	When prompted, press "Enter" to continue (x2)

	34.	You will now be prompted to install Office. If you do not want to install, just keep clicking "No" through all prompts

	35.	If you want to install one of the versions listed in II, 6 (earlier in document), click "No" until you 
		  get to that version. Clicking "Yes" will skip all others

	36.	When prompted, press "Enter" to continue. PowerShell will now close

	37.	If updates did not install in step 23, install updates
