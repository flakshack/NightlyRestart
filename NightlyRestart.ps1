<#
.SYNOPSIS
	This script will schedule a computer reboot and present a dialog box offering the user
	the chance to cancel the reboot.  It will be triggered by a scheduled task.	
.DESCRIPTION
	Triggers a restart command using the built-in shutdown command.  Next it prompts the user with a msgbox.
	If the user clicks OK, it cancels the reboot.
.EXAMPLE
.AUTHOR
	Scott Vintinner
.LASTEDIT
	5/2/2014
.NOTES

.LINK

#>

# add the required .NET assembly:
Add-Type -AssemblyName System.Windows.Forms

$currentDate = Get-Date
$rebootDate = $currentDate.AddSeconds(300)
$rebootTimeStr = $rebootDate.ToString("hh:mm:ss tt")
# Issue restart command with a 5 minute delay
shutdown /r /t 300 /d p:4:1 /c "Computers on the RBH network reboot nightly to perform maintenance tasks. To cancel and continue working, just click Close and click OK on the RBH Nightly Maintenance Restart prompt.  Reboot will occur at $rebootTimeStr"

# show the MsgBox:
$result = [System.Windows.Forms.MessageBox]::Show("Click OK to cancel the logoff and continue working.", 'RBH Nightly Maintenance Restart', 'OK', 'Information')
shutdown /a

