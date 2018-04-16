OptionsMenu(){

Menu, MainMenu, Add
if WinActive("ahk_class CabinetWClass"){
    Menu, MainMenu, Add, Copy Folder Path, cfolderpath
    Menu, MainMenu, Add, copy file path,  cfilepath,
    Menu, MainMenu, Add, Elevated Cmd Here, ecmdhere,
    Menu, GitMenu, Add, Initialize Repo, gitinitrepo,
    Menu, GitMenu, Add, Add all files`, commit`, and push,  gitaddcommitpushall,
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
    ; Menu, MainMenu, Add, Item1, MainMenu_Item1
    ; Menu, MainMenu, Add, Item2, MainMenu_Item2
}

Menu, MainMenu, Show

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
cfolderpath:
    send, !d
    send, ^c    
    return
cfilepath:
gitinitrepo:
gitaddcommitpushall:
GitMenu:
ecmdhere:
    openCMDinFolder()
return
menuGoogle:
    Google1()
    return
menuGoogle2:
    Google2(clip())
    return
}