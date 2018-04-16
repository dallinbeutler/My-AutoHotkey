
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
} 




;=============== Other's window dragging operations ==========================================

#SingleInstance, Force
TrayminOpen:
SetWinDelay, 0
SetFormat, Integer, D
CoordMode, Mouse, Screen
DetectHiddenWindows On
hAHK := WinExist("ahk_class AutoHotkey ahk_pid " . DllCall("GetCurrentProcessId"))
ShellHook := DllCall("RegisterWindowMessage", "str", "SHELLHOOK")
DllCall("RegisterShellHookWindow", "Uint", hAHK)
OnExit, TrayminClose
Return
TrayminClose:
DllCall("DeregisterShellHookWindow", "Uint", hAHK)
WinTraymin(0, -1)
OnExit
ExitApp

F14::
If	h := WM_NCHITTEST()
	WinTraymin(h)
Else
	Click, % SubStr(A_ThisHotkey, 1, 1)	; for hotkey: LButton/MButton/RButton
Return

WM_NCHITTEST()
{
	MouseGetPos, x, y, z
	SendMessage, 0x84, 0, (x & 0xFFFF) | (y & 0xFFFF) << 16,, ahk_id %z%
	Return	ErrorLevel = 8 ? z : ""
}

WM_SHELLHOOKMESSAGE(wParam, lParam, nMsg)
{
	Critical
	If nMsg = 1028
	{
		If wParam = 1028
			Return
		Else If (lParam = 0x201 || lParam = 0x205 || lParam = 0x207)
			WinTraymin(wParam, 3)
	}
	Else If (wParam = 1 || wParam = 2)
		WinTraymin(lParam, wParam)
	Return 0
}

WinTraymin(hWnd = "", nFlags = "")
{
	Local h, ni, fi, uid, pid, hProc, sClass
	Static nMsg, nIcons :=0
	nMsg ? "" : OnMessage(nMsg := 1028, "WM_SHELLHOOKMESSAGE")
	NumPut(hAHK, NumPut(VarSetCapacity(ni, 444, 0), ni))
	If !nFlags
	{
		If !((hWnd += 0) || hWnd := DllCall("GetForegroundWindow")) || ((h := DllCall("GetWindow", "Uint", hWnd, "Uint", 4)) && DllCall("IsWindowVisible", "Uint", h) && !hWnd := h) || !(VarSetCapacity(sClass, 15), DllCall("GetClassNameA", "Uint", hWnd, "str", sClass, "Uint", VarSetCapacity(sClass) + 1)) || sClass == "Shell_TrayWnd" || sClass == "Progman"
		Return
		OnMessage(ShellHook, "")
		WinMinimize, ahk_id %hWnd%
		WinHide, ahk_id %hWnd%
		Sleep, 100
		OnMessage(ShellHook, "WM_SHELLHOOKMESSAGE")
		uID := uID_%hWnd%, uID ? "" : (uID_%hWnd% := uID := ++nIcons = nMsg ? ++nIcons : nIcons)
		If !hIcon_%uID%
		{
			If !hIcon_%uID% := DllCall("user32\SendMessage", "Uint", hWnd, "Uint", 127, "Uint", 2, "Uint", 0, "Uint")
				If !hIcon_%uID% := DllCall("user32\SendMessage", "Uint", hWnd, "Uint", 127, "Uint", 0, "Uint", 0, "Uint")
					hIcon_%uID% := DllCall("user32\SendMessage", "Uint", hWnd, "Uint", 127, "Uint", 1, "Uint", 0, "Uint")
			VarSetCapacity(fi, 352, 0), DllCall("GetWindowThreadProcessId", "Uint", hWnd, "UintP", pid), DllCall("psapi\GetModuleFileNameExA", "Uint", hProc := DllCall("kernel32\OpenProcess", "Uint", 0x410, "int", 0, "Uint", pid), "Uint", 0, "Uint", &fi + 12, "Uint", 260), DllCall("kernel32\CloseHandle", "Uint", hProc)
		}
		hIcon_%uID% ? "" : (DllCall("shell32\SHGetFileInfoA", "Uint", &fi + 12,"Uint", 0, "Uint", &fi, "Uint", 352, "Uint", 0x101), hIcon_%uID% := NumGet(fi))
		DllCall("GetWindowTextA", "Uint", hWnd, "Uint", NumPut(hIcon_%uID%, NumPut(nMsg, NumPut(1|2|4, NumPut(uID, ni, 8)))),  "int", 64)
		Return hWnd_%uID% := DllCall("shell32\Shell_NotifyIconA", "Uint", hWnd_%uID% ? 1 : 0, "Uint", &ni) ? hWnd : DllCall("ShowWindow", "Uint", hWnd, "int", 5) * 0
	}
	Else If nFlags > 0
	{
		If (nFlags = 3 && uID := hWnd)
			If WinExist("ahk_id " . hWnd := hWnd_%uID%)
			{
				WinShow, ahk_id %hWnd%
				WinRestore, ahk_id %hWnd%
			}
			Else
				nFlags := 2
		Else
			uID := uID_%hWnd%
		Return uID ? (hWnd_%uID% ? (DllCall("shell32\Shell_NotifyIconA", "Uint", 2, "Uint", NumPut(uID, ni, 8) -12), hWnd_%uID% := "") : "", nFlags == 2 && hIcon_%uID% ? (DllCall("DestroyIcon", "Uint", hIcon_%uID%), hIcon_%uID% := "") : "") : ""
	}
	Else
		Loop, % nIcons
			hWnd_%A_Index% ? (DllCall("shell32\Shell_NotifyIconA", "Uint", 2, "Uint", NumPut(A_Index, ni, 8) - 12), DllCall("ShowWindow", "Uint", hWnd_%A_Index%, "int", 5), hWnd_%A_Index% := "") : "", hIcon_%A_Index% ? (DllCall("DestroyIcon", "Uint", hIcon_%A_Index%), hIcon_%A_Index% := "") : ""
}



; Drag the right mouse over a window to drag it.

dragMoveWindow(){
	CoordMode, Mouse  ; Switch to screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
	WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
	if EWD_WinState = 0  ; Only if the window isn't maximized
		SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
	return

	EWD_WatchMouse:
	GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U  ; Button has been released, so drag is complete.
	{
		SetTimer, EWD_WatchMouse, Off
		return
	}
	GetKeyState, EWD_EscapeState, Escape, P
	if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
	{
		SetTimer, EWD_WatchMouse, Off
		WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
		return
	}
	; Otherwise, reposition the window to match the change in mouse coordinates
	; caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1   ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
	return
}