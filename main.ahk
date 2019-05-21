#NoEnv  								; Recommended for performance and compatibility with future AutoHotkey releases.
msg =Mode Input  						; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  			; Ensures a consistent starting directory.
#SingleInstance force

 ; ======================================================================
 ; ======================================================================

 ; 
 ; ---     Script made by Francesco Galletti - 2019					-----
 ; ---     Press F2 to TOGGLE PAUSE 								-----
 ; ---     Press F3 to START the SCRIPT								-----
 ; ---     Press ESC to EXIT the SCRIPT								-----
 ; ---     27 secs wait-time because of Mixer Paladins chat rules	-----
 ; 

 ; ======================================================================
 ; ======================================================================

msg = empty								; Initialize variables to empty
previousMsg = empty
msgArray := []

FileRead, Text, chatmsg.txt				; Read from text file in same directory and divide each message into elements pushed to msgArray
oText := StrSplit(Text, "|")
Loop, % oText.MaxIndex() {
	msgArray.Push(oText[A_Index])
}
 
F3::
	Send {raw}Hi there!					; Starting message in chat
	Sleep 500							; 0.5 seconds
	Send {Enter}
	Sleep 110000						; 110 seconds
		
	Loop {
		Random, i, 1, msgArray.maxIndex()
		msg = % msgArray[i]				; msg becomes a random sentence between all the elements in the msgArray (1 to lengthArray)
		Sleep 100
		
		if (previousMsg != msg) {		; If msg is not the same as previous one type it, otherwise generate new one
			Send {raw}%msg%
			Sleep 8000					; Wait 7 seconds for anti-bot system in chat that checks for instant typing
			Send {Enter}
			Sleep 113000				; Wait 113 seconds for spamming chat filter	
			previousMsg = %msg%
		}	
	}
Esc::
	ExitApp
F2::
	Pause, toggle
 
 