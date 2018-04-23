;-----------------------------------------------------------------------------------------------------------------------------------------
; example.ahk (replace "Your Username" with your username)
;-----------------------------------------------------------------------------------------------------------------------------------------

; #include %A_ScriptDir%/JSON.ahk    ;If not in the same file, don't forget to do this.
#include json.ahk    ; If not in the same file, don't forget to do this.

; Decode test.json into an AHK object
FileRead, JSONtext, sample.json
test := json_toobj(JSONtext)
me := test.username
obviousAnswer := test.spicehead
MsgBox % "Is " . me . " a Spicehead?  " . obviousAnswer
; For nested objects you could also do i.e. test.languages.java - just keep using the "." separator as deep as you need to go.

;Now that we've done the decoding, let's try encoding.
test.username := "Dallin"
newJSON := json_fromobj(test)
MsgBox % newJSON

;And just for kicks, let's do the Spicehead thing again
test2 := json_toobj(newJSON)
u := test2.username
obviousAnswer := test2.spicehead
MsgBox % "Is " . u . " a Spicehead?  " . obviousAnswer