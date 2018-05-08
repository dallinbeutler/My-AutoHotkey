#SingleInstance, Force
; #Persistent


	CapsLock & j:: Send, {4}
	CapsLock & k:: Send, {5}
	CapsLock & l:: Send, {6}
	
	CapsLock & u:: Send, {7}
	CapsLock & i:: Send, {8}
	CapsLock & o:: Send, {9}
	
	CapsLock & m:: Send, {1}
	CapsLock & ,:: Send, {2}
	CapsLock & .:: Send, {3}
	CapsLock & Space:: Send, {0}



RAlt::F13

#if GetKeyState("F13")
{
    i:: Up
    j:: Left
    k:: Down
    l:: Right
    o:: End
    u:: Home

    h:: ^Left
    `;:: ^Right

    8:: !+Up
    ,:: !+Down
    \:: Delete
}

