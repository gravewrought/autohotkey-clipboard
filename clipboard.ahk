#include include\WinHttpRequest\WinHttpRequest.ahk

; CTRL+ALT+C
^!c::
	; Empty the clipboard.
	clipboard := ""
	; Send CTRL+C to copy current selection.
    SendInput, ^c
	
	; Wait for the clipboard to get content.
	ClipWait, 2
	if ErrorLevel
	{
		; Return if there is an error fetching content.
		return
	}

	; Get the URL value for script out of the ClipboardUrl environment variable.
	EnvGet, url, ClipboardUrl
	; Copy the clipboard to a storage variable.
	data := clipboard

	; POST the clipboard to the configured URL.
	r := WinHttpRequest(url, data, {}, "Method: POST")

return

; CTRL+ALT+V
^!v::
	; Empty the clipboard.
	clipboard := ""

	; Get the URL value for script out of the ClipboardUrl environment variable.
	EnvGet, url, ClipboardUrl
	; Create empty storage variable.
	data := ""
	
	; GET from clipboard to the configured URL.
	r := WinHttpRequest(url, data, {}, "NO_SSL_VALIDATE")

	; Set the clipboard contents to the data retrieved from the request.
	clipboard := data
	; Send CTRL+V to paste the contents of the clipboard to the selection.
    SendInput, ^v

return
