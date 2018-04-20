; Reminder 1.7.ahk
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Jack Dunning <ceeditor@computoredge.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Menu, Tray, Add,Set Reminder,SetReminder

IfExist, %A_AppData%\Reminder\Reminder.ini
  {
    GoSub, ReadIni
    If(RemTime > A_Now)
      {
        MyTime := RemTime
	MyNote := RemMemo
	
        GoSub, ButtonSubmit
	
      }
     Else
      {
        MyTime := A_Now
	MyNote := "Remind Me!"
      }
  }
Else
  {
    FileCreateDir, %A_AppData%\Reminder\
    MyNote := "Remind Me!"
  }
Hotkey, ^#R, SetReminder, On

Return

SetReminder:

HotKey, ^#R, Off
Menu, Tray, Disable, Set Reminder

Gui, Font, s12, Arial
Gui, Add, Text,, 1. Select time`n2. Add note`n3. Submit`n4. Close popup
Gui, Add, DateTime, vMyTime w350 1 Range%A_Now% Choose%MyTime%,dddd MMMMd, yyyy hh:mm tt
Gui, Add, Edit, vMyNote w350, %MyNote%
Gui, Add, Button, Default, Submit
IfExist, %A_WinDir%\nircmd.exe
  {
   Gui, Font, s10
   If(SetSpeak = 1)
     Gui, Add, Text, cGreen X+150 yp+10 vSpeak gSpeakToggle, Speaking On
   Else
     Gui, Add, Text, cRed X+150 yp+10 vSpeak gSpeakToggle, Speaking Off
  }
Else
  {
   Gui, Font, underline s10
   Gui, Add, Text, cRed x+150 yp+10 gNircmd, Speaking Not Available
  }

IDC_HAND := 32649
hCursor:=DllCall("LoadCursor", "UInt", NULL,"Int", IDC_HAND, "UInt")
OnMessage(0x200,"WM_MOUSEMOVE")



Gui, Show,  , Reminder
Return


ButtonSubmit:
Gui, Submit, NoHide
NewTime := MyTime

If (MyTime > A_Now)

  {
    EnvSub, NewTime, A_Now, s

    FormatTime, Schedule, %MyTime%
    MsgBox,4160,Your Reminder, "%MyNote%" is scheduled for`n%Schedule%

    #Persistent
    RemMessage := "Better get going!"
    GoSub, WriteIni
    SetTimer, ShowReminder, % NewTime*1000
  }
Else
  {
    MsgBox, The time must be later than right now!
    GuiControl,,MyTime, %A_Now%
  }


Return

GuiClose:
  Gui, Destroy
  HotKey, ^#R, ON
  Menu, Tray, Enable, Set Reminder
  DllCall("DestroyCursor","Uint", hCursor)
Return

WM_MOUSEMOVE(wParam, lParam) {

global hCursor

MouseGetPos,,,, ctrl

if (ctrl == "Static2")

  DllCall("SetCursor","UInt",hCursor) ; To set the cursor

}

ShowReminder:
FormatTime, RightNow
#persistent
OnMessage(0x53, "WM_HELP")

IfExist, %A_WinDir%\nircmd.exe
  {
    If SetSpeak = 1     ;new line
     SetTimer, TalkToMe, 15000
  }

Hotkey, IfWinActive, Your Reminder!
Hotkey, Esc, StopEscape

SetTimer, ChangeButtonNames, 50

Gui +OwnDialogs
MsgBox,20800,Your Reminder!, %MyNote% %RemMessage%`n%Rightnow%
MyNote := "New Reminder!"
SetTimer, ShowReminder, Off
 
IfMsgBox, OK
   SetTimer, TalkToMe, Off
   Hotkey, IfWinActive
return

WM_HELP()
{
    MsgBox,4096, Info!, You thought you'd see some info here!
}

ChangeButtonNames: 
  IfWinNotExist, Your Reminder!
    return  ; Keep waiting.
  SetTimer, ChangeButtonNames, off 
  WinActivate 
  ControlSetText, Button2, Info,Your Reminder!
return

TalkToMe:
run, nircmd.exe speak text "%MyNote%"
Return

StopEscape:
  Return

WriteIni:
	IniWrite, %MyTime%, %A_AppData%\Reminder\Reminder.ini, Settings, Time
	IniWrite, %MyNote%, %A_AppData%\Reminder\Reminder.ini, Settings, Memo
	IniWrite, %SetSpeak%, %A_AppData%\Reminder\Reminder.ini, Settings, SetSpeak
Return

ReadIni:
	IniRead, RemTime, %A_AppData%\Reminder\Reminder.ini, Settings, Time
	IniRead, RemMemo, %A_AppData%\Reminder\Reminder.ini, Settings, Memo
	IniRead, SetSpeak, %A_AppData%\Reminder\Reminder.ini, Settings, SetSpeak
Return

Nircmd:
  MsgBox, 4,Download Nircmd.exe?,You don't have Nircmd.exe utility
        ,`nfor activating speech, installed
	.`nWould you like to download it?
  IfMsgBox Yes
	Run http://www.nirsoft.net/utils/nircmd.html
Return

SpeakToggle:
 If(SetSpeak = 1)
 {
  SetSpeak := 0
  Gui,Font,Cred
  GuiControl,Font,Speak
  GuiControl,,Speak, Speaking Off
  IniWrite, %SetSpeak%, %A_AppData%\Reminder\Reminder.ini, Settings, SetSpeak
 }
 Else
 {
  SetSpeak := 1
  Gui,Font,Cgreen
  GuiControl,Font,Speak
  GuiControl,,Speak, Speaking On  ;Alt 0160 hard space before On
  IniWrite, %SetSpeak%, %A_AppData%\Reminder\Reminder.ini, Settings, SetSpeak
 } 
Return