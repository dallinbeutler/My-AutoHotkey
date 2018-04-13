F10::
zelda=
(
463{tab}400{tab}{tab}
344{tab}500{tab}{tab}
463{tab}100{tab}{tab}
463{tab}100{tab}{tab}
512{tab}100{tab}{tab}
576{tab}100{tab}{tab}
612{tab}100{tab}{tab}
689{tab}800{tab}{tab}
689{tab}200{tab}{tab}
689{tab}133{tab}{tab}
732{tab}133{tab}{tab}
823{tab}133{tab}{tab}
926{tab}950{tab}{tab}
926{tab}150{tab}{tab}
926{tab}100{tab}{tab}
926{tab}133{tab}{tab}
823{tab}133{tab}{tab}
732{tab}133{tab}{tab}
823{tab}300{tab}{tab}
732{tab}100{tab}{tab}
689{tab}800{tab}{tab}
689{tab}400{tab}{tab}
612{tab}200{tab}{tab}
612{tab}100{tab}{tab}
689{tab}100{tab}{tab}
732{tab}800{tab}{tab}
698{tab}200{tab}{tab}
612{tab}200{tab}{tab}
544{tab}200{tab}{tab}
544{tab}100{tab}{tab}
612{tab}100{tab}{tab}
689{tab}800{tab}{tab}
)
stringreplace, zelda, zelda, `n,, all
stringreplace, zelda, zelda, `r,, all
sendinput %zelda%
Return


F1::
FormatTime, TimeCheck, , HH

PCBeepHelpText=
(
Thanks to Patrick, PC Beep now supports EasyNote Conversions.
Simply Type in one of the notes below into the Frequency box
and PC Beep will translate it into a matching freqeuncy!

*=a/b/c/d/e/f/g
$=a/b/d/e/g

-2* - Note 2 octaves below C
-* - Note 1 ocatave below C
* - Note in octave C
2* - Note 2 octaves above C
3c - C above high C
-$b - Flat notes an octave below C
$b - Flat notes an octave even with C
2$b - Flat notes 2 octaves above C

)

Gui, 14: Destroy
	{
	Gui, 14:Default
	
	RowsPerPage=25
	PageCount=0
	PagesToStart=2
	PageHeight := (RowsPerPage*25)+20
	TabText :=
	Gui, Add, Button, x5 y2 w60 h20 default vTunerPlay, Play
	Gui, Add, Edit, x75 y5 w20 h20 vTunerLoop, 1
	Gui, Add, Button, x145 y5 w60 h20 vTunerAddRow gTuner_AddPage, Add Page
	
	Gui, Add, Tab2, x5 y35 w230 h%PageHeight% vPCBeepTab -wrap buttons,
	loop, %PagesToStart%
		{
		gosub Tuner_AddPage
		}
	
	Menu, PCBeepFileMenu, Add, Open Composition, PCBeepMenuOpen
	Menu, PCBeepFileMenu, Add, Save Composition, PCBeepMenuSave
	Menu, PCBeepFileMenu, Add, Help, PCBeepMenuHelp
	Menu, PCBeepFileMenu, Add,
	Menu, PCBeepFileMenu, Add, Exit, PCBeepMenuExit
	Menu, PCBeepMenuBar, Add, File, :PCBeepFileMenu
	
	Gui, Menu, PCBeepMenuBar
	Gui, Show, Autosize, PC Beep Composer
	Return
	
	PCBeepMenuOpen:
	FileSelectFile, PCBFileToOpen, 3, %A_MyDocuments%, Select a Composition, PC Beep Composition (*.pcbc)
	if ErrorLevel
		return
	loop, %TunerRowCount% ; clear current contents
		{
		GuiControl,, BeepFreq%A_Index%,
		GuiControl,, BeepDur%A_Index%,
		GuiControl,, BeepTempo%A_Index%,	
		}
	FileRead, PCBOpenedFile, %PCBFileToOpen%
	PCBOpenedFile_RowCount=0
	loop, parse, PCBOpenedFile, `n
		{
		PCBOpenedFile_RowCount++
		loop, parse, A_Loopfield, CSV
			{
			PCBOpenedFile_R%PCBOpenedFile_RowCount%_C%A_Index% := A_Loopfield
			}
		}
	PagesRequired := PCBOpenedFile_RowCount / RowsPerPage
	if (PagesRequired>PageCount)
		{
		PCBOpenedFile_Diff := PagesRequired-PageCount
		while (PCBOpenedFile_Diff>0)
			{
			GoSub, Tuner_AddPage
			PCBOpenedFile_Diff--
			}
		}
		
	loop, %PCBOpenedFile_RowCount%
		{
		BeepFreq := PCBOpenedFile_R%A_Index%_C1
		BeepDur :=  PCBOpenedFile_R%A_Index%_C2
		BeepTempo := PCBOpenedFile_R%A_Index%_C3
		
		GuiControl,, BeepFreq%A_Index%, %BeepFreq%
		GuiControl,, BeepDur%A_Index%, %BeepDur%
		GuiControl,, BeepTempo%A_Index%, %BeepTempo%
		
		}
	Return
	
	PCBeepMenuSave:
	Gui, Submit, NoHide
	FileSelectFile, PCBFileToSave, S 19, %A_MyDocuments%\untitled, Select a Composition, PC Beep Composition (*.pcbc)
	if ErrorLevel
		return
	ifnotinstring, PCBFileToSave, `.pcbc
		PCBFileToSave := PCBFileToSave ".pcbc"
	PCBFileData :=
	
	loop, %TunerRowCount%
		{
		BeepFreq := BeepFreq%A_Index%
		BeepDur :=  BeepDur%A_Index%
		BeepTempo := BeepTempo%A_Index%
		PCBFileData := PCBFileData BeepFreq "," BeepDur "," BeepTempo ",`n"
		}
	StringTrimRight, PCBFileData, PCBFileData, 1
	IfExist, %PCBFileToSave%
		FileDelete, %PCBFileToSave%
	FileAppend, %PCBFileData%, %PCBFileToSave%
	return
	
	PCBeepMenuHelp:
	msgbox, %PCBeepHelpText%
	return
			
	14GuiEscape:
	14GuiClose:
	PCBeepMenuExit:
	Gui, 14:Destroy
	Menu, PCBeepFileMenu, DeleteAll
	Return
	
	14ButtonPlay:
	Gui, Submit, NoHide
	if (TunerLoop>5)
		{
		msgbox, Loop restricted to 5
		TunerLoop=5
		}
	loop, %TunerLoop%
		{
		loop, %TunerRowCount%
			{
			BeepFreq := BeepFreq%A_Index%
			BeepDur :=  BeepDur%A_Index%
			BeepTempo := BeepTempo%A_Index%
			if (BeepFreq="")
				{
				continue
				}
			GoSub Tuner_EasyNoteTranslate
			SoundBeep, %BeepFreq%, %BeepDur%
			Sleep, %BeepTempo%
			}
		}
	Return
	
	Tuner_AddPage:
	Gui, Submit, NoHide
	PageCount++
	if (PageCount=251)
		{
		msgbox, Unable to create more pages, please upgrade your OS.
		PageCount--
		return
		}
	TabText .= "Page " PageCount "`|"
	GuiControl, , PCBeepTab, |%TabText%
	GuiControl, Choose, PCBeepTab, %PCBeepTab%
	Gui, Tab, %PageCount%
	Gui, Add, Text, x+5 y+5 w60 h20 section, Frequency:
	Gui, Add, Text, xp+75 ys w60 h20, Duration:
	Gui, Add, Text, xp+75 ys w60 h20, Tempo:
	loop, %RowsPerPage%
		{
		TunerRowCount := (PageCount-1) * RowsPerPage + A_Index
		Gui, Add, Edit, xs yp+25 w60 h20 vBeepFreq%TunerRowCount%, 
		Gui, Add, Edit, xp+75 yp w60 h20 vBeepDur%TunerRowCount%, 
		Gui, Add, Edit, xp+75 yp w60 h20 vBeepTempo%TunerRowCount%,
		}
	Return
	
	Tuner_EasyNoteTranslate:
	if (BeepFreq="-2c")
		BeepFreq=64
	else if (BeepFreq="-2d")
		BeepFreq=72
	else if (BeepFreq="-2e")
		BeepFreq=81
	else if (BeepFreq="-2f")
		BeepFreq=86
	else if (BeepFreq="-2g")
		BeepFreq=97
	else if (BeepFreq="-2a")
		BeepFreq=109
	else if (BeepFreq="-2b")
		BeepFreq=123
	else if (BeepFreq="-c")
		BeepFreq=128
	else if (BeepFreq="-d")
		BeepFreq=144
	else if (BeepFreq="-e")
		BeepFreq=162
	else if (BeepFreq="-f")
		BeepFreq=172
	else if (BeepFreq="-g")
		BeepFreq=193
	else if (BeepFreq="-a")
		BeepFreq=217
	else if (BeepFreq="-b")
		BeepFreq=245
	else if (BeepFreq="c")
		BeepFreq=256
	else if (BeepFreq="d")
		BeepFreq=288
	else if (BeepFreq="e")
		BeepFreq=324
	else if (BeepFreq="f")
		BeepFreq=344
	else if (BeepFreq="g")
		BeepFreq=387
	else if (BeepFreq="a")
		BeepFreq=436
	else if (BeepFreq="b")
		BeepFreq=490
	else if (BeepFreq="2c")
		BeepFreq=512
	else if (BeepFreq="2d")
		BeepFreq=576
	else if (BeepFreq="2e")
		BeepFreq=648
	else if (BeepFreq="2f")
		BeepFreq=689
	else if (BeepFreq="2g")
		BeepFreq=775
	else if (BeepFreq="2a")
		BeepFreq=871
	else if (BeepFreq="2b")
		BeepFreq=980
	else if (BeepFreq="3c")
		BeepFreq=1024
	else if (BeepFreq="-Db")
		BeepFreq=136
	else if (BeepFreq="-Eb")
		BeepFreq=153
	else if (BeepFreq="-Gb")
		BeepFreq=183
	else if (BeepFreq="-Ab")
		BeepFreq=208
	else if (BeepFreq="-Bb")
		BeepFreq=231
	else if (BeepFreq="Db")
		BeepFreq=272
	else if (BeepFreq="Eb")
		BeepFreq=306
	else if (BeepFreq="Gb")
		BeepFreq=366
	else if (BeepFreq="Ab")
		BeepFreq=411
	else if (BeepFreq="Bb")
		BeepFreq=463
	else if (BeepFreq="2Db")
		BeepFreq=544
	else if (BeepFreq="2Eb")
		BeepFreq=612
	else if (BeepFreq="2Gb")
		BeepFreq=732
	else if (BeepFreq="2Ab")
		BeepFreq=823
	else if (BeepFreq="2Bb")
		BeepFreq=926
	Return
	}