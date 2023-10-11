HaywardMartF6_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardMartVendingMachine:
	opentext
.loop
	writetext .vending_machine_text
	special PlaceMoneyTopRight
	menuanonjumptable .VendingMachineMenu
	dw .quit
	dw .fresh_water
	dw .soda_pop
	dw .lemonade

.quit
	closetextend

.VendingMachineMenu
	db $40 ; flags
	db 03, 00 ; start coords
	db 10, 13 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10000000 ; flags
	db 3
	db "Fresh Water@"
	db "Soda Pop@"
	db "Lemonade@"

.fresh_water
	checkmoney 0, 200
	sif <, 2, then
		giveitem FRESH_WATER, 1
		sif true, then
			takemoney 0, 200
			itemtotext FRESH_WATER, 0
			writebyte 1
		sendif
	sendif
	jump .processed_selection

.soda_pop
	checkmoney 0, 300
	sif <, 2, then
		giveitem SODA_POP, 1
		sif true, then
			takemoney 0, 300
			itemtotext SODA_POP, 0
			writebyte 1
		sendif
	sendif
	jump .processed_selection

.lemonade
	checkmoney 0, 350
	sif <, 2, then
		giveitem LEMONADE, 1
		sif true, then
			takemoney 0, 350
			itemtotext LEMONADE, 0
			writebyte 1
		sendif
	sendif

.processed_selection
	anonjumptable
	dw .no_room
	dw .item_OK
	dw .no_money

.no_money
	writetext .no_money_text
	jump .loop

.no_room
	writetext .no_room_text
	jump .loop

.item_OK
	pause 10
	playsound SFX_ENTER_DOOR
	writetext .got_item_text
	buttonsound
	itemnotify
	waitbutton
	jump .loop

.vending_machine_text
	ctxt "A vending machine!"
	line "Here's the menu."
	done

.no_money_text
	ctxt "Oops, not enough"
	line "money<...>"
	sdone

.no_room_text
	ctxt "There's no more"
	line "room for stuff<...>"
	sdone

.got_item_text
	ctxt "Clang!"

	para "<STRBF1>"
	line "popped out."
	done

HaywardMartF6OrbGirl:
	faceplayer
	opentext
	clearevent EVENT_0
	checkevent EVENT_EXPLAIN_EGGS
	sif false, then
		writetext .introduction_text
		setevent EVENT_EXPLAIN_EGGS
	sendif
	checkitem RUBY_EGG
	sif true, then
		writetext .have_ruby_egg_text
		yesorno
		sif true, then
			setevent EVENT_0
			takeitem RUBY_EGG, 1
			giveitem RED_ORB, 1
			writetext .receive_red_orb_text
			setevent EVENT_GAVE_RUBY_EGG
			playwaitsfx SFX_DEX_FANFARE_200_229
		selse
			writetext .refused_to_give_egg_text
		sendif
	sendif
	checkitem SAPPHIRE_EGG
	sif true, then
		writetext .have_sapphire_egg_text
		yesorno
		sif true, then
			setevent EVENT_0
			takeitem SAPPHIRE_EGG, 1
			giveitem BLUE_ORB, 1
			writetext .receive_blue_orb_text
			setevent EVENT_GAVE_SAPPHIRE_EGG
			playwaitsfx SFX_DEX_FANFARE_200_229
		selse
			writetext .refused_to_give_egg_text
		sendif
	sendif
	checkitem EMERALD_EGG
	sif true, then
		writetext .have_emerald_egg_text
		yesorno
		sif true, then
			setevent EVENT_0
			takeitem EMERALD_EGG, 1
			giveitem GREEN_ORB, 1
			writetext .receive_green_orb_text
			setevent EVENT_GAVE_EMERALD_EGG
			playwaitsfx SFX_DEX_FANFARE_200_229
		selse
			writetext .refused_to_give_egg_text
		sendif
	sendif
	checkevent EVENT_GAVE_RUBY_EGG
	iffalse .didntGetAll
	checkevent EVENT_GAVE_SAPPHIRE_EGG
	iffalse .didntGetAll
	checkevent EVENT_GAVE_EMERALD_EGG
	iffalse .didntGetAll
	jumptext .already_gave_all_eggs_text

.didntGetAll
	checkevent EVENT_0
	sif true
		jumptext .come_back_text
	jumptext .dont_have_eggs_text

.introduction_text
	ctxt "Oh, hello."

	para "I'm looking for"
	line "some special eggs."

	para "Not #mon eggs,"
	line "but secret eggs."

	para "They're difficult"
	line "to find."

	para "If you find one"
	line "that I want, I'll"
	para "give you a shiny"
	line "orb I received"
	para "five years ago"
	line "from some Trainer."

	para "The Trainer later"
	line "became the Rijon"
	cont "Champion<...>"

	para "<...>but he vanished"
	line "a year later."
	sdone

.have_ruby_egg_text
	ctxt "You have a"
	line "luxurious Ruby"
	cont "Egg!"

	para "I'll trade you it"
	line "for my Red Orb!"

	para "Will you trade?"
	done

.have_sapphire_egg_text
	ctxt "You have a"
	line "beautiful"
	cont "Sapphire Egg!"

	para "I'll trade you it"
	line "for my Blue Orb!"

	para "Want to trade?"
	done

.have_emerald_egg_text
	ctxt "You have a shiny"
	line "Emerald Egg!"

	para "I'll trade you it"
	line "for my Green"
	cont "Orb!"

	para "Want to trade?"
	done

.receive_red_orb_text
	ctxt "Great, here's"
	line "your Red Orb!"
	sdone

.receive_blue_orb_text
	ctxt "Wonderful, here's"
	line "your Blue Orb!"
	sdone

.receive_green_orb_text
	ctxt "Nice, here's your"
	line "Green Orb!"
	sdone

.refused_to_give_egg_text
	ctxt "Come on, that egg"
	line "isn't any use to"
	cont "you!"
	sdone

.dont_have_eggs_text
	ctxt "You don't have"
	line "any eggs that I"
	cont "want."

	para "Come back when you"
	line "do."
	done

.come_back_text
	ctxt "Come back when"
	line "you have more"
	cont "special eggs."
	done

.already_gave_all_eggs_text
	ctxt "What? I'm all out"
	line "of orbs."

	para "I already have all"
	line "the eggs that I"
	cont "want."
	done

HaywardMartF6NPC:
	ctxt "That girl there"
	line "is trying to get"
	cont "rid of her orbs."

	para "If I were her, I'd"
	line "hold onto them."
	done

HaywardMartF6_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $0, $10, 2, HAYWARD_MART_F5
	warp_def $0, $2, 2, HAYWARD_MART_ELEVATOR

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 1, 12, SIGNPOST_UP, HaywardMartVendingMachine
	signpost 1, 13, SIGNPOST_UP, HaywardMartVendingMachine
	signpost 1, 14, SIGNPOST_UP, HaywardMartVendingMachine
	signpost 1, 15, SIGNPOST_UP, HaywardMartVendingMachine

.ObjectEvents
	db 2
	person_event SPRITE_LASS, 4, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HaywardMartF6OrbGirl, -1
	person_event SPRITE_YOUNGSTER, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HaywardMartF6NPC, -1
