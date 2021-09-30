Route77_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route77HiddenItem:
	dw EVENT_ROUTE_77_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route77QRCode:
	opentext
	qrcode 4
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text
	ctxt "Gold-Ei - Haus"
	line "im Westen des"
	cont "Hayward-Markts"
	done

Route77Guard_AfterIlk:
	faceplayer
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .give_HM_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .regular_text

.regular_text
	ctxt "Oh, Hallo nochmal!"

	para "Prof. Ilk hat mir"
	line "alles erzählt."

	para "Viel Glück auf"
	line "deinem Weg!"
	done

.give_HM_text
	ctxt "Sieht so aus als"
	line "hättest du nun die"
	cont "Freigabe erhalten."

	para "Nutze nächstesmal"
	line "diese VM um flott"
	para "nach Kaper City"
	line "zu gelangen!"
	sdone

Route77Guard_BeforeIlk:
	faceplayer
	checkflag ENGINE_ELECTRONBADGE
	sif false
		jumptext .no_badge_text
	checkevent EVENT_GOT_HM02
	sif false, then
		opentext
		writetext .no_clearance_text
		givetm HM_FLY + RECEIVED_TM
		setevent EVENT_GOT_HM02
	sendif
	jumptext .after_HM_text

.no_clearance_text
	ctxt "Ohne eine gültige"
	line "Freigabe, kann ich"
	para "dich leider nicht"
	line "passieren lassen."

	para "Ein schweres Erd-"
	line "beben wütete hier."

	para "Wenn es doch nur"
	line "Experten gäbe, die"
	para "uns unterstützen"
	line "könnten<...>"

	para "Wie'Prof. Silk'!"

	para "<...>"

	para "Was? Oh, sein name"
	line "ist Prof. Ilk?"

	para "Du kennst Ihn?"

	para "Vieleicht kann er"
	line "uns helfen?"

	para "Er kennt diese "
	line "Region wie seine"
	cont "Westentasche."

	para "<...>"

	para "Perfekt, wir haben"
	line "nun einen Deal."

	para "Diese VM bringt"
	line "dich schneller"
	cont "nach Kaper City."
	sdone

.after_HM_text
	ctxt "VM02 ist Fliegen."

	para "deine #mon "
	line "fliegen dich hier-"
	para "mit an Orte, die"
	line "du bereits "
	cont "besucht hast!"

	para "Sprich nun mit"
	line "Prof. Ilk und ich"
	para "erteile dir die"
	line "Freigabe."
	done

.no_badge_text
	ctxt "Mir wurde befohlen"
	line "fürs erste diese"
	cont "Brücke zu bewachen"

	para "Wenn du doch nur"
	line "mehr Orden hättest"
	para "könnte ich dich"
	line "ohne sorgen "
	cont "passieren lassen."
	done

Route77_Trainer_1:
	trainer EVENT_ROUTE_77_TRAINER_1, FISHER, 2, .before_battle_text, .battle_won_text

	ctxt "Ich brauche mehr"
	line "Wasser #mon."
	done

.before_battle_text
	ctxt "Ich liebe Wasser"
	line "#mon!"
	done

.battle_won_text
	ctxt "Sploosh!"
	done

Route77_Trainer_2:
	trainer EVENT_ROUTE_77_TRAINER_2, FISHER, 3, .before_battle_text, .battle_won_text

	ctxt "Nicht groß genug?"
	done

.before_battle_text
	ctxt "Ein großer Fang!"

	para "Schau es dir an!"
	done

.battle_won_text
	ctxt "Uh<...> Was?"
	done

Route77_Trainer_3:
	trainer EVENT_ROUTE_77_TRAINER_3, FISHER, 4, .before_battle_text, .battle_won_text

	ctxt "Ich trainiere nie,"
	line "Ich fange einfach"
	cont "starke #mon!"
	done

.before_battle_text
	ctxt "2 Große #mon"
	line "gefangen!"
	done

.battle_won_text
	text "OW!"
	done

Route77_Trainer_4:
	trainer EVENT_ROUTE_77_TRAINER_4, YOUNGSTER, 4, .before_battle_text, .battle_won_text

	ctxt "Ich habe sie"
	line "freigelassen."
	done

.before_battle_text
	ctxt "Ich musste sie"
	line "einfach fangen<...>"
	done

.battle_won_text
	ctxt "Ugh, nicht fair."
	done

Route77_Trainer_5:
	trainer EVENT_ROUTE_77_TRAINER_5, CAMPER, 4, .before_battle_text, .battle_won_text

	ctxt "Hmm<...> mir wird"
	line "kalt ohne meine"
	cont "#mon."

	para "<...>"

	para "Ich sollte dann zu"
	line "einem #mon"
	cont "Center gehen?"

	para "Nein! Solch eine"
	line "Heilung ist von"
	para "der Natur nicht"
	line "vorgesehen!"
	done

.before_battle_text
	ctxt "Camping in der"
	line "Wildnis ist toll!"
	done

.battle_won_text
	ctxt "Wer wärmt mich"
	line "denn jetzt?"
	done

Route77_Trainer_6:
	trainer EVENT_ROUTE_77_TRAINER_6, PICNICKER, 4, .before_battle_text, .battle_won_text

	ctxt "Ich hätte Sie mehr"
	line "trainieren sollen<...>"
	done

.before_battle_text
	ctxt "Ich habe nun Drei"
	line "#mon gefangen!"

	para "Zeit sie"
	line "auszuprobieren!"
	done

.battle_won_text
	ctxt "Wenigstens hat es"
	line "Spass gemacht."
	done

Route77_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 73, 10, 1, MILOS_F1
	warp_def 21, 13, 1, ROUTE_77_JEWELERS
	warp_def 51, 7, 3, ROUTE_77_DAYCARE_HOUSE
	warp_def 69, 5, 1, ROUTE_77_POKECENTER
	warp_def 73, 9, 1, MILOS_F1
	warp_def 5, 11, 3, TORENIA_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 9, 13, SIGNPOST_READ, Route77QRCode
	signpost 25, 4, SIGNPOST_ITEM, Route77HiddenItem
	signpost 69, 6, SIGNPOST_JUMPSTD, pokecentersign

.ObjectEvents: db 13
	person_event SPRITE_FISHER, 30, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route77_Trainer_1, -1
	person_event SPRITE_FISHER, 37, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_2, -1
	person_event SPRITE_FISHER, 44, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_3, -1
	person_event SPRITE_YOUNGSTER, 63, 1, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route77_Trainer_4, -1
	person_event SPRITE_YOUNGSTER, 23, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route77_Trainer_5, -1
	person_event SPRITE_PICNICKER, 57, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, Route77_Trainer_6, -1
	person_event SPRITE_BOULDER, 69, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 50, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 3, Route77Guard_AfterIlk, -1
	person_event SPRITE_OFFICER, 40, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route77Guard_BeforeIlk, EVENT_ILK_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 73, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_CURSE, 0, EVENT_ROUTE_77_TM03
	person_event SPRITE_FRUIT_TREE, 15, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 17, -1
	person_event SPRITE_POKE_BALL, 13, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TWISTEDSPOON, EVENT_ROUTE_77_ITEM_TWISTEDSPOON
	person_event SPRITE_POKE_BALL, 7, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HYPER_POTION, EVENT_ROUTE_77_ITEM_HYPER_POTION
