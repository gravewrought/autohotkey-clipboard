# autohotkey-clipboard

The **autohotkey-clipboard** project is a small script for AutoHotkey (http://autohotkey.com) that
uses the CTRL+ALT+V and CTRL+ALT+C shortcuts to respectively GET and POST content to a defined endpoint,
where the content is sent to the local clipboard where a paste is triggered or retrieved from the local
clipboard after a copy is triggered.

The result is the ability to copy and paste between arbitrary machines, while also being able to secure its
transfer using modern web technologies, such as SSH/TLS/HTTPS.

This project compliments the **clipboard** node project which can be found here: https://github.com/gravewrought/clipboard

## Environment

When the script is triggered, **autohotkey-clipboard** uses the environment variable `ClipboardUrl` (`%%ClipboardUrl%%`)
to determine what endpoint to call.

To set this variable in CMD run:
```
SETX ClipboardUrl http://example.com
```

To set this variable in PowerShell run:
```
[environment]::SetEnvironmentVariable("ClipboardUrl", "http://example.com", "User")
```

Where `http://example.com` is the endpoint that the scrpit should call.

## Installation

An `install.ps1` script is included to properly install the script.  As the project is for AutoHotKey, and
AutoHotKey is designed for Windows, this is the only supported installation method.

Essentially a shortcut is created in the startup directory for the current user:

`%%USERPROFILE%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

The shortcut calls the AHK script on startup, causing AutoHotKey to load and run in the background.
