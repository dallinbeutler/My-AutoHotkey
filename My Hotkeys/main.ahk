SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

#Include, menu.ahk
#Include, WinExplorerFuncs.ahk
#Include, selectionFuncs.ahk
#Include, windowFuncs.ahk
#Include, miscFuncs.ahk
#Include, MoveResizeWindow.ahk
#Include, SynonymLookup.ahk

RWin:: OptionsMenu()

RAlt::F13
#if GetKeyState("F13")
	{
		i:: Up
		j:: Left
		k:: Down
		l:: Right
		o:: End
		u:: Home
		h:: ^+Left
		`;:: ^+Right
		8:: !+Up
		,:: !+Down
		\:: Delete
		r:: findReplace()
		g:: Google1()
		+g:: Google2(clip())
		
	CapsLock:: Capitalize()
		":: SurroundSelection("""","""")
		':: SurroundSelection("'","'")
		[:: SurroundSelection("[","]")
		]:: SurroundSelection("[","]")
		{:: SurroundSelection("{","}")
		}:: SurroundSelection("{","}")
		(:: SurroundSelection("(",")")
		):: SurroundSelection("(",")")
		P:: SurroundSelection("System.Console.WriteLine(",");")
		F::Explorer_GetPath()
		return
	}


~LButton:: dragMoveWindow()

#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}



#if
	CapsLock & j:: Send, {4}
	CapsLock & k:: Send, {5}
	CapsLock & l:: Send, {6}
	
	CapsLock & u:: Send, {7}
	CapsLock & i:: Send, {8}
	CapsLock & o:: Send, {9}
	
	CapsLock & m:: Send, {1}
	CapsLock & ,:: Send, {2}
	CapsLock & .:: Send, {3}
	CapsLock & c:: Run calc.exe
	CapsLock & Space:: Send, {0}
	
	:*:emailz::dallinbeutler@gmail.com
	:*:namez::Dallin{space}Beutler
	:*:pz::public
	:*:printz::System.Console.WriteLine("
	:*:getz:: 
	 	clip("{ get; set; }")
		 return
	:*:shrugz::¯\_(ツ)_/¯
	:*:flipz::(╯°□°)╯︵ ┻━┻
	:*:tablez::┬─┬﻿ ノ( ゜-゜ノ)
	:*:flipmanz::(╯°Д°）╯︵ /(.□ . \)
  

	 
Pause::
	Clip0 = %ClipBoardAll%
    ClipBoard = %ClipBoard% ; Convert to plain text
    Send ^v
    Sleep 1000
    ClipBoard = %Clip0%
    VarSetCapacity(Clip0, 0) ; Free memory
    Return	

	
PrintScreen:: Run SnippingTool.exe
RETURN


#IfWinActive ahk_class CabinetWClass ; for use in explorer.
F12::openCMDinFolder()
+F12:: Run, powershell -Command "Start-Process PowerShell  -Verb RunAs" 

F1:: Clipboard := Explorer_GetSelected()
#IfWinActive

;=====================ahk Reference examples ======================================
banana := 0
return
#MaxThreadsPerHotkey 2
$NumLock::
	; banana:=!banana .... This assigns banana to the value of NOT (!) banana. so lets
	; say banana starts out FALSE (0). you then turn banana to NOT FALSE. which is
	; TRUE (1). so now banana is set to TRUE. and then lets say you toggle it again.
	; you set banana to NOT TRUE, which is FALSE. banana is now set to FALSE. 
	; .... 1 is true, 0 is false. ! is NOT.
	banana:=!banana
	;#if (banana=1 or KeyIsDown)
return

;======================Functions================================================
; Scrolllock:: cuteRun("notepad.exe")	

CuteRun(c) {
    full_command := comspec . " /c """ . c . """"
    msgbox % full_command
    shell := comobjcreate("wscript.shell")
    exec := (shell.exec(comspec full_command))
    stdout := exec.stdout.readall()
    msgbox % stdout
    Return stdout
}

#IfWinActive Chrome
#IfWinActive