
gold_coin_on_screen_flag = 1;
item_sold = 0;
surcharged = 0;
smalltalked = 0;

action_delay = 500;
sell_delay = 1000;

NumpadSub::
	Loop
	{
		Gosub, ResetFlags
		Gosub, Surcharge
		Gosub, SmallTalk
		Gosub, Sell
		if (item_sold = 0){
			Gosub, Refuse
		} else {
			break
		}
		sleep sell_delay
	}
	MsgBox % "End"
	return

NumpadEnter::
	pause
	suspend
	return

CheckForGoldCoin:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, GoldCoin.png
	if (OutputVarX > 0){
		gold_coin_on_screen_flag := 1
		MsgBox % "Gold Coin Found"
	} else {
		gold_coin_on_screen_flag := 0
		MsgBox % "Gold not found"
	}
	return

Surcharge:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Surcharge.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		sleep, action_delay
	} else {
		gold_coin_on_screen_flag := 0
	}
	return

SmallTalk:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, SmallTalk.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		sleep, action_delay
	} else {
		gold_coin_on_screen_flag := 0
	}
	return
	
Sell:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Sell.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		item_sold := 1
		sleep, action_delay
	} else {
		item_sold := 0
	}
	return

Refuse:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Refuse.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		sleep, action_delay
	} 
	return

ResetFlags:
	gold_coin_on_screen_flag = 1
	item_sold = 0
	surcharged = 0
	smalltalked = 0
	return

