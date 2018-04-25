#Persistent
SetTimer, WatchCaret, 100
return
WatchCaret:
    ToolTip, X%A_CaretX% Y%A_CaretY%, A_CaretX, A_CaretY - 20
return