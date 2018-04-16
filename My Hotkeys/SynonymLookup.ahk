/*
This modification of the original SynonymLookup.ahk script no longer merely opens the Web 
page targeted with the selected word but rather downloads the source code text directly 
from the site. Since AutoHotkey does not need to render the Web page, it's fast while 
capturing the code in a variable.

Next, using the RegExMatch() function to extract synonyms from the code, the script inserts 
each word into a pop-up menu. After selecting a word from the menu, the script replaces the
original selected word in the editing field.

You will find a number of useful AutoHotkey tricks described in the script below. These 
techniques may apply equally as well to other applications where you want to extract data from
a Web page. The script requires an Internet connection to work.

After selecting a word in your document, the Hotkey combination CTRL+ALT+L downloads the source 
code from the Web site Thesaurus.com to parse synonyms for the selected word.

Find more free AutoHotkey scripts and apps at:
http://www.computoredge.com/AutoHotkey/Free_AutoHotkey_Scripts_and_Apps_for_Learning_and_Generating_Ideas.html
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!l::

/*
The script begins with the standard Clipboard routine where the user first selects
a word in any text or editing field.
*/
                                                      
  OldClipboard:= ClipboardAll
  Clipboard:= ""
  Send, ^c ;copies selected text
  ClipWait 0
  If ErrorLevel
    {
      MsgBox, No Text Selected!
      Return
    }

SynonymList := Clipboard
	
	; The GetWebPage() function loads source code from the target Web into the variable SynPage.

  SynPage := GetWebPage("http://www.thesaurus.com/browse/" . Clipboard)
  
  
; The variable NewSynPos tracks the location of each synonym as AutoHotkey looks through the Web page.
; This allows the Loop to jump to the next synonym.
 
  NewSynPos := 1 
  
; The variable ItemCount increments as each synonym is added to the menu for starting new columns.
; This prevents the list from becoming too long.

  ItemCount := 1
  
; The next four lines assign the first menu items as a title highlighting the selected work in all caps, 
; with a bullet, and as a non-functioning default

   StringUpper, KeyWord, Clipboard
   Menu, Synonym, add, %KeyWord%, LoadPage, +Radio
   Menu, Synonym, check, %KeyWord%
   Menu, Synonym, default, %KeyWord%

 ; The beginning of the loop which increments through the Web page variable while extracting synonyms.
   
  Loop
  {
  
; The RegExMatch function  extracts each synonym based upon unique surrounding HTML code.

  SynPos := RegExMatch(SynPage,"<span class=""text"">(.*?)(</span>)(.*?)<span class=",Synonym,NewSynPos)

; When AutoHotkey no longer finds a synonym, the script exits the Loop.

  If SynPos = 0
     Break

; By incrementing the position in the RegExMatch() function, AutoHotkey jumps to the next synonym.

  NewSynPos := SynPos+1
  
; Synonym1 represents the first subpattern (the synonym). AutoHotkey checks the SynonymList variable for redundancy.
; If found, the Loop skips to the next iteration. (No need to add it again, thus keeping the columns even.)
	 
    If InStr(SynonymList,Synonym1)
       Continue
	   
; When the number of menu items reaches 20, the script starts a new menu column and resets the counter.
; In both cases, the script adds new menu item.
	 
	If ItemCount = 20
	{
      Menu, Synonym, add, %Synonym1%, SynonymAction, +BarBreak
	  ItemCount := 1
	}  
	Else
	{
      Menu, Synonym, add, %Synonym1%, SynonymAction

	  ItemCount++
	}
	
; To prevent AutoHotkey from processing redundant words in the menu, the script adds each new synonym to a list of included words.

	SynonymList := SynonymList . "," . Synonym1

  }

; Display the menu.

  Menu, Synonym, Show
  
; After selection or cancelation, the script deletes the menu.

  Menu, Synonym, DeleteAll
  
; Restore the old Clipboard contents.

  Clipboard := OldClipboard

Return

; Subroutine inserts the new synonym in place of the selected word.

SynonymAction:
   SendInput %A_ThisMenuItem%{raw}
Return

; Subroutine loads the Web page into the default browser.

LoadPage:
  Run http://www.thesaurus.com/browse/%Clipboard%
Return

; The GetWebPage() function downloads the code from a Web page and returns the source code.

GetWebPage(WebPage)
{
   whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")   
   whr.Open("GET", WebPage, true)
   whr.Send()
   ; Using 'true' above and the call below allows the script to remain responsive.
   whr.WaitForResponse()
   RefSource := whr.ResponseText
   Return RefSource
}