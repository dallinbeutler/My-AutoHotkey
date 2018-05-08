
; HasSelection(){
; 	local selected := false
; 	ClipSaved := ClipboardAll       ;save clipboard
; 	clipboard := ""  ; empty clipboard
; 	Send, ^c    ; copy the selected file
; 	ClipWait, 1		; wait for the clipboard to contain data
; 	if (!ErrorLevel)    ; if NOT ErrorLevel clipwait found data on the clipboard
; 	{
; 		If text_selected
; 			selected = %clipboard%
; 	}
; 	else
; 		selected := false
; 	Sleep, 100
; 	clipboard := ClipSaved       ; restore original clipboard
; 	ClipSaved := ""   ;  free the memory in case the clipboard was very large.
; 	return selected
; }


; $RButton Up::
; 	if GetKeyState("LButton","p")
; 		OptionsMenu()
; 	else
; 		Send, {RButton Up}
; 	return


; RShift::
; 	SendInput, {LControl Down}{Tab}
; 	KeyWait, RShift
; 	SendInput, {LControl Down}
; 	return


; Pause::
; 	Clip0 = %ClipBoardAll%
;     ClipBoard = %ClipBoard% ; Convert to plain text
;     Send ^v
;     Sleep 1000
;     ClipBoard = %Clip0%
;     VarSetCapacity(Clip0, 0) ; Free memory
;     Return	