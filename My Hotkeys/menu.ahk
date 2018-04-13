OptionsMenu(){

Menu, MainMenu, Add
Menu, MainMenu, deleteAll

Menu, MainMenu, Add, Item1, MainMenu_Item1
Menu, MainMenu, Add, Item2, MainMenu_Item2

Menu, MainMenu, Add
if WinActive("ahk_class CabinetWClass"){
Menu, MainMenu, Add, Win Explorer, welabel    
Menu, MainMenu, disable, welabel
Menu, Submenu1, Add, Item1, Submenu1_Item1
Menu, Submenu1, Add, Item2, Submenu1_Item2
Menu, MainMenu, Add, Submenu1, :Submenu1

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
}