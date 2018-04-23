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

}
else{
    Menu, MainMenu, Add
    Menu, MainMenu, deleteAll
    Menu, MainMenu, Add, Google, menuGoogle
    Menu, MainMenu, Add, Google with prefix, menuGoogle2      
    Menu, AppMenu, Add, Calculator, menuCalculator
    Menu, MainMenu, Add, Apps, :AppMenu
    ; Menu, MainMenu, Add, Item1, MainMenu_Item1
    ; Menu, MainMenu, Add, Item2, MainMenu_Item2
}

; return
; ControlFocus, MainMenu, menuGoogle, MainMenu
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