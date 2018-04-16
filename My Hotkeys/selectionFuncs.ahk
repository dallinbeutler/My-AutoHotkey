#If


;returns the selection, or changes the clipboard to inpt
Clip(Text="", Reselect="") ; http://www.autohotkey.com/forum/viewtopic.php?p=467710 , modified February 19, 2013
{
	Static BackUpClip, Stored, LastClip
	If (A_ThisLabel = A_ThisFunc) {
		If (Clipboard == LastClip)
			Clipboard := BackUpClip
		BackUpClip := LastClip := Stored := ""
	} Else {
		If !Stored {
			Stored := True
			BackUpClip := ClipboardAll ; ClipboardAll must be on its own line
		} Else
			SetTimer, %A_ThisFunc%, Off
		LongCopy := A_TickCount, Clipboard := "", LongCopy -= A_TickCount ; LongCopy gauges the amount of time it takes to empty the clipboard which can predict how long the subsequent clipwait will need
		If (Text = "") {
			SendInput, ^c
			ClipWait, LongCopy ? 0.6 : 0.2, True
		} Else {
			Clipboard := LastClip := Text
			ClipWait, 10
			SendInput, ^v
		}
		SetTimer, %A_ThisFunc%, -700
		Sleep 20 ; Short sleep in case Clip() is followed by more keystrokes such as {Enter}
		If (Text = "")
			Return LastClip := Clipboard
		Else If (ReSelect = True) or (Reselect and (StrLen(Text) < 3000)) {
			StringReplace, Text, Text, `r, , All
			SendInput, % "{Shift Down}{Left " StrLen(Text) "}{Shift Up}"
		}
	}
	Return
	Clip:
	Return Clip()
}

SurroundSelection(char1, char2)
{
	
	clip( char1 clip() char2, true )	

}
return

Capitalize()
{
	clip(RegExReplace(clip(), "([A-Z]*[a-z])", "$u1"))
	^+Home
	return
}


Google1(){
googlethis := Clip()
Run, http://www.google.com/search?q=%googlethis%
Return
}

;Broken :(
	global searchtags
	
Google2(selectedText){
	 
	Gui googGui:Default

	Gui, Add, Text,, Extra Tags:
	Gui, Add, Edit, tbsearchtags, %searchtags% ; ym  ; , %searchtag% ym  ; The ym option starts a new column of controls.
	Gui, Add, Text,, Selected text:
	Gui, Add, Edit, tbselectedText, %selectedText%
	;Gui, Add, Button, +Default, OK ; The label ButtonOK (if it exists) will be run when the button is pressed.
	Gui, Add, Button, default, OK

	Gui, Show,, Simple Input Example
	return  ; End of auto-execute section. The script is idle until the user does something.

	GoogGuiClose:
	GoogGuiButtonOK:
	Gui, Submit  ; Save the input from the user to each control's associated variable.
	searchtags = %tbsearchtags%
	;wholeSelection := RegExReplace(clip(),FirstName, LastName)
	;clip(wholeSelection)
	
	Run, http://www.google.com/search?q=%tbselectedText%

	Gui, Destroy
	return
	
}


; Example: A simple input-box that takes a find and replaces
findReplace(){
	local vFirstName, vLastName 
	Gui findReplaceUI: Default
	
	Gui, Add, Text,, Find:
	Gui, Add, Text,, Replace:
	Gui, Add, Edit, vFirstName ym  ; The ym option starts a new column of controls.
	Gui, Add, Edit, vLastName
	Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
	Gui, Show,, Simple Input Example
	return  ; End of auto-execute section. The script is idle until the user does something.

	findReplaceUIClose:
	findReplaceUIButtonOK:
	Gui, Submit  ; Save the input from the user to each control's associated variable.

	wholeSelection := RegExReplace(clip(),FirstName, LastName)
	if(wholeSelection.StrLen > 0)
	{
		clip(wholeSelection)
	}
	

	Gui, Destroy
	return
}