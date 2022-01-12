#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Mouse start on item
;Numpad Divide - Regular EE
;Numpad Mult - AEE
;Numpad Sub - Spam Enter and Wiggle
;Numpad Add - Restore Traced
;Numpad Enter - Stop enhance spam

total_traced = 0

use_shield = 1
shield_scroll_available = 1

delay = 100
restore_delay = 200

numpad_flag = 1
sell_available = 0


NumpadSub::
	
	Loop
	{
	
	Gosub, ClickSell	
	if (sell_available = 1){
		
		Gosub, GreenSell
				}
		Gosub, Refuse
		sleep, delay
	else {
		Gosub, ClickBuy
		Gosub, YellowBuy
		sleep, delay
		}
	}
	return

NumpadEnter::
	pause
	suspend
	return
	
ClickSell:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, ClickSell.png
	MouseMove, OutputVarX, OutputVarY
	if (OutputVarX > 0){
		sell_available = 1
	} else {
		sell_available = 0
	}
	MouseClick, left
	sleep, restore_delay
	return

GreenSell:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, GreenSell.png
	MouseMove, OutputVarX, OutputVarY
	MouseClick, left
	sleep, restore_delay
	return

Refuse:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Refuse.png
	MouseMove, OutputVarX, OutputVarY
	MouseClick, left
	sleep, restore_delay
	return

ClickBuy:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, ClickBuy.png
	MouseMove, OutputVarX, OutputVarY
	MouseClick, left
	sleep, restore_delay
	return

YellowBuy:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, YellowBuy.png
	MouseMove, OutputVarX, OutputVarY
	MouseClick, left
	sleep, restore_delay
	return

