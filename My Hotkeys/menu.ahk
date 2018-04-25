OptionsMenu(){
; #persistent
Menu, MainMenu, Add
if WinActive("ahk_class CabinetWClass"){
    Menu, MainMenu, Add, Copy Folder Path, menucfolderpath
    Menu, MainMenu, Add, copy file path,  menucfilepath,
    Menu, MainMenu, Add, Elevated Cmd Here, menuecmdhere,
    Menu, GitMenu, Add, Initialize Repo, menugitinitrepo,
    Menu, GitMenu, Add, Add all files`, commit`, and push,  menugitaddcommitpushall,
    Menu, MainMenu, Add, GitMenu, :GitMenu
    ;Menu, Submenu1, Add, Item1, Submenu1_Item1
    ;Menu, Submenu1, Add, Item2, Submenu1_Item2
    ;Menu, MainMenu, Add, Submenu1, :Submenu1
    Menu, foldersMenu, Add, Temp, atempdir
    Menu, foldersMenu, Add, Temp, awindir
    Menu, foldersMenu, Add, Temp, awindir
    Menu, foldersMenu, Add, Program Files x64, aprog64dir
    Menu, foldersMenu, Add, Program Files x86, aprogx86dir
    Menu, foldersMenu, Add, App Data, aappdatadir
    Menu, foldersMenu, Add, App Data Common, aappdatacommondir
    Menu, foldersMenu, Add, Desktop, adesktopdir
    Menu, foldersMenu, Add, Startup, astartupdir
    
    Menu, foldersMenu, Add, My Documents, adocumentsdir
    Menu, foldersMenu, Add, User folder, auserdir
    Menu, foldersMenu, Add, Downloads, adownloadsdir
    
    
    
    
    Menu, MainMenu, Add, Folder Shortcuts, :foldersMenu
}
else{
    Menu, MainMenu, Add
    Menu, MainMenu, deleteAll
    Menu, MainMenu, Add, Google, menuGoogle
    Menu, MainMenu, Add, Google with prefix, menuGoogle2      
    Menu, MainMenu, Add, Find Replace, findReplace
    Menu, AppMenu, Add, Calculator, menuCalculator
    Menu, MainMenu, Add, Apps, :AppMenu
    ; Menu, MainMenu, Add, Item1, MainMenu_Item1
    ; Menu, MainMenu, Add, Item2, MainMenu_Item2
    if (IfSelection())
    {
    }
}

return
adocumentsdir:     
    Run, %A_MyDocuments%
    return
auserdir:     
    Run, %A_MyDocuments% \..\..
    return
adownloadsdir:     
    Run, %A_MyDocuments% \..\Downloads
    return
astartupdir:     
    Run, %A_Startup%
    return
    
adesktopdir:     
    Run, %A_Desktop%
    return

aappdatacommondir:     
    Run, %A_AppDataCommon%
    return
aappdatadir:     
    Run, %A_AppData%
    return
aprog64dir:     
    Run, %ProgramFiles%
    return
aprogx86dir:     
    Run, %Program6432%
    return
atempdir:
    Run, %A_Temp%
    return
awindir:
    Run, %A_WinDir%
    return
; return
; ControlFocus, MainMenu, menuGoogle, MainMenu
return
findReplace:
    findReplace()
    return
MainMenu_Item1:
    Run, notepad.exe
    return
MainMenu_Item2:
    send, !d
    send, ^c    
    return
Submenu1_Item1:
Submenu1_Item2:
welabel:
return  
menucfolderpath:
    send, !d
    send, ^c    
    return
menucfilepath:
    Clipboard := Explorer_GetSelected()
    return
menugitinitrepo:
menugitaddcommitpushall:
menuGitMenu:
menuecmdhere:
    openCMDinFolder()
return
menuGoogle:
    Google1()
    return
menuGoogle2:
    Google2(clip())
    return
menuCalculator:
    Run, Calc.exe
    return
}






; OptionsMenu(){
; Gui,+AlwaysOnTop +Disabled -SysMenu +Owner
; Gui, Add, Text,, First name:
;    Menu, MainMenu, Add
; if WinActive("ahk_class CabinetWClass"){
;     Menu, MainMenu, Add, Copy Folder Path, menucfolderpath
;     Menu, MainMenu, Add, copy file path,  menucfilepath,
;     Menu, MainMenu, Add, Elevated Cmd Here, menuecmdhere,
;     Menu, GitMenu, Add, Initialize Repo, menugitinitrepo,
;     Menu, GitMenu, Add, Add all files`, commit`, and push,  menugitaddcommitpushall,
;     Menu, MainMenu, Add, GitMenu, :GitMenu
;     ;Menu, Submenu1, Add, Item1, Submenu1_Item1
;     ;Menu, Submenu1, Add, Item2, Submenu1_Item2
;     ;Menu, MainMenu, Add, Submenu1, :Submenu1

; }
; else{
;     Menu, MainMenu, Add
;     Menu, MainMenu, deleteAll
;     Menu, MainMenu, Add, Google, menuGoogle
;     Menu, MainMenu, Add, Google with prefix, menuGoogle2      
;     Menu, AppMenu, Add, Calculator, menuCalculator
;     Menu, MainMenu, Add, Apps, :AppMenu
;     ; Menu, MainMenu, Add, Item1, MainMenu_Item1
;     ; Menu, MainMenu, Add, Item2, MainMenu_Item2
; }
; Gui, Menu, MainMenu
; Gui,Show
; ; Menu, MainMenu, Show
; return
; ControlFocus, MainMenu, menuGoogle, MainMenu
; return
; MainMenu_Item1:
;     Run, notepad.exe
;     return
; MainMenu_Item2:
;     send, !d
;     send, ^c    
;     return
; Submenu1_Item1:
; Submenu1_Item2:
; welabel:
; return  
; menucfolderpath:
;     send, !d
;     send, ^c    
;     return
; menucfilepath:
;     Clipboard := Explorer_GetSelected()
;     return
; menugitinitrepo:
; menugitaddcommitpushall:
; menuGitMenu:
; menuecmdhere:
;     openCMDinFolder()
; return
; menuGoogle:
;     Google1()
;     return
; menuGoogle2:
;     Google2(clip())
;     return
; menuCalculator:
;     Run, Calc.exe
;     return
; }