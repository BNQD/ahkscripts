no_longer_selling = 0;
gold_coin_on_screen_flag = 1;
item_sold = 0;
item_bought = 0;
surcharged = 0;
smalltalked = 0;
item_suggested = 0;

item_background_found = 0;

action_delay = 500;
sell_delay = 900;

NumpadSub::
	Loop {
		Gosub, SellItems
		sleep, action_delay
	}
	

NumpadEnter::
	pause
	suspend
	return

SellItems:
	no_longer_selling = 0;
	Gosub, ClickItemBackground
	sleep sell_delay
	Loop
	{
		Gosub, ResetFlags
		Gosub, Surcharge
		Gosub, SmallTalk
		Gosub, Surcharge
		sleep, action_delay
		Gosub, Sell
		if (item_sold = 0){
			Gosub, Buy
			if (item_bought = 0){
				sleep, action_delay
				Gosub, Suggest
				if (item_sold = 0){
					Gosub, Refuse
				}
			}
		} 
		Gosub, CheckIfFlagsUnchanged
		if (no_longer_selling = 1){
			break
		}
		sleep sell_delay
	}
	return

SellItemsOneTime:
	Gosub, Surcharge
	Gosub, Sell
	sleep sell_delay
	return

Surcharge:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Surcharge.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		sleep, action_delay
	} 
	return

SmallTalk:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, SmallTalk.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		sleep, action_delay
		smalltalked := 1
	} 
	return
	
Sell:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Sell.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		item_sold := 1
		sleep, action_delay
	} 
	return

Refuse:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Refuse.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		refused := 1
		sleep, action_delay
	} 
	return
	
Buy:
	ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, Buy.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		item_bought := 1
		sleep, action_delay
	} 
	return
	
ClickItemBackground:
	ImageSearch, OutputVarX, OutputVarY, 500, 500, %A_ScreenWidth%, %A_ScreenHeight%, ItemBackground.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		item_background_found := 1
		sleep, action_delay
	} 
	return
	
Suggest:
	ImageSearch, OutputVarX, OutputVarY, 500, 500, %A_ScreenWidth%, %A_ScreenHeight%, Suggest.png
	if (OutputVarX > 0){
		MouseMove, OutputVarX, OutputVarY
		MouseClick, left
		item_suggested := 1
		sleep, action_delay
		Gosub, SellItemsOneTime
		sleep, action_delay
	} 
	return

ResetFlags:
	gold_coin_on_screen_flag = 1
	item_sold = 0
	surcharged = 0
	smalltalked = 0
	item_bought = 0
	refused = 0
	item_suggested = 0
	return
	
CheckIfFlagsUnchanged:
	if (gold_coin_on_screen_flag = 1 and item_sold = 0 and surcharged = 0 and smalltalked = 0 and item_bought = 0 and refused = 0 and item_suggested = 0)
		no_longer_selling = 1
	return
		

