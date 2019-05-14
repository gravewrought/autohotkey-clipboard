#
# Create a shortcut to the AutoHotKey Clipboard script so the script
# is available when the system starts.
#

# Find the directory this script resides in -- it must be in the same directory
# as the AutoHotKey script.
$LocalPath = Split-Path -parent $script:MyInvocation.MyCommand.Path;

# Locate path to start up directory
$Startup = "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup";

# Location of the AutoHotKey script that will be referenced by shortcut.
$TargetFile = "$LocalPath\clipboard.ahk";

# Location of the shortcut thats being created.
$ShortcutFile = "$Startup\clipboard.lnk";

# Create the shortcut object
$Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($ShortcutFile);
$Shortcut.WorkingDirectory = $LocalPath;
$Shortcut.TargetPath = $TargetFile;
$Shortcut.Save();

Invoke-Item $ShortcutFile
