HaywardMartF6_MapScriptHeader;trigger count
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
	db "Tafelwasser@"
	db "Sprudel@"
	db "Limonade@"

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
	ctxt "Ein "
	line "Verkaufsautomat!"

	cont "Hier ist das Menü."

	done

.no_money_text
	ctxt "Oops, nicht genug"
	line "Geld dabei<...>"
	sdone

.no_room_text
	ctxt "Da ist kein Platz "
	line "mehr für Sachen<...> "
	sdone

.got_item_text
	ctxt "Pam!"

	para "<STRBF1>"
	line "viel raus."


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
	ctxt "Oh, hallo."

	para "Ich suche nach ein"
	line "paar besonderen "
	cont "Eiern."

	para "Keine "
	line "#Mon-Eier, "
	para "sondern geheime "
	line "Eier."

	para "Die sind schwer zu"
	line "finden."

	para "Wenn Sie eines "
	line "finden, das ich "
	para "suche, gebe ich "
	line "Ihnen eine "
	para "Schiller-Kugel, "
	line "die ich vor fünf "
	para "Jahren von einem "
	line "Trainer erhalten "
	cont "habe."

	para "Der Trainer wurde "
	line "später der "
	para "Rijon-Champion<...> "
	line "<...>aber er "
	para "verschwand ein "
	line "Jahr später."

	sdone

.have_ruby_egg_text
	ctxt "Sie haben ein "
	line "Rubin-Ei!"

	para "Ich tausche es "
	line "gegen meine Rote "
	cont "Kugel!"

	para "Einverstanden?"

	done

.have_sapphire_egg_text
	ctxt "Sie haben ein "
	line "Saphir-Ei!"

	para "Ich tausche es "
	line "gegen meine Blaue "
	cont "Kugel!"

	para "Einverstanden?"

	done

.have_emerald_egg_text
	ctxt "Sie haben ein "
	line "glänzendes "
	cont "Smaragd-Ei!"

	para "Ich tausche es "
	line "gegen meinen "
	cont "grünen Kugel!"

	para "Einverstanden?"

	done

.receive_red_orb_text
	ctxt "Toll, hier ist "
	line "Ihre rote Kugel!"

	sdone

.receive_blue_orb_text
	ctxt "Toll, hier ist "
	line "Ihre blaue Kugel!"

	sdone

.receive_green_orb_text
	ctxt "Toll, hier ist "
	line "Ihre grüne Kugel!"

	sdone

.refused_to_give_egg_text
	ctxt "Ach komm!"

	para "Das Ei selbst "
	line "nützt dir nichts!"

	sdone

.dont_have_eggs_text
	ctxt "Sie haben nicht "
	line "die Eier, die ich "
	cont "will."

	para "Komm wieder, wenn "
	line "du diese hast."

	done

.come_back_text
	ctxt "Kommen Sie gerne "
	line "wieder, wenn Sie "
	para "mehr spezielle "
	line "Eier haben."

	done

.already_gave_all_eggs_text
	ctxt "Was?"

	para "Ich habe keine "
	line "Kugeln mehr."

	para "Ich habe schon "
	line "alle Eier, die es "
	cont "gibt."

	done

HaywardMartF6NPC:
	ctxt "Das Mädchen dort "
	line "versucht, ihre "
	para "Kugeln "
	line "loszuwerden."

	para "Wenn ich sie wäre,"
	line "würde ich sie "
	cont "behalten."

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
