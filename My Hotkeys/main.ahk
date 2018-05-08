#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, force
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global SearchSite = "www.Github.com"
global SearchTags = "bats"
global text_selected := false

ClipMemory := []
ClipIt := 0

Run, basicNavigation.ahk
; No more global things can be claimed after this, because there is a return 
; statement 
#Include, menu.ahk
#Include, WinExplorerFuncs.ahk
#Include, selectionFuncs.ahk
; #Include, windowFuncs.ahk
; #Include, miscFuncs.ahk
; #Include, MoveResizeWindow.ahk
; #Include, SynonymLookup.ahk
return
RWin::  
	OptionsMenu()
	Menu, MainMenu, Show ; OptionsMenu()
	return
; RAlt::F13

; F2:: ifClip()

;  LAlt & LButton:: dragMoveWindow()


F1:: 
	foo := IfSelection() ; HasSelection()
	; foo := "forget"
	if (foo)
	{
		MsgBox, %foo% 		
	}
	else
	{
		MsgBox, issues!
	}
	return


return


#if GetKeyState("LButton")
RButton::  
	OptionsMenu()
	Menu, MainMenu, Show ; OptionsMenu()
	return
	
	
#if GetKeyState("F13")	

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

x:: specialCutCopy(True)
c:: specialCutCopy(False)
v:: specialPaste()

#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

#if

CapsLock & c:: Run calc.exe

:*:emailz::dallinbeutler@gmail.com
:*:namez::Dallin{space}Beutler
:*:tmz::™
:*:pz::public
:*:printz::System.Console.WriteLine("
:*:getz:: 
	clip("{ get; set; }")
		return
:*:shrugz::¯\_(ツ)_/¯
:*:flipz::(╯°□°)╯︵ ┻━┻
:*:tablez::┬─┬﻿ ノ( ゜-゜ノ)
:*:flipmanz::(╯°Д°）╯︵ /(.□ . \)
:*:googlez::
	Google2("")
	return
	 	
PrintScreen:: Run SnippingTool.exe
RETURN


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

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
} 

#IfWinActive Chrome
#IfWinActive