#c::
oCB := ClipboardAll  ; save clipboard contents
Send, ^c
ClipWait,1

send, {"}%clipboard%{"}

ClipBoard := oCB         ; return original Clipboard contents
return