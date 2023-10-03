Route71West_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route71WestHiddenItem:
	dw EVENT_ROUTE_71_WEST_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route71WestDirectionsSign1:
	ctxt "<LEFT> Capparia City"
	next "<RIGHT><UP>Oxalia City"
	next "<RIGHT> Klathrat-"
	next "  Tunnel"
	done

Route71WestDirectionsSign2:
	ctxt "<UP> Oxalia City"
	next "<LEFT> Capparia City"
	next "<RIGHT> Klathrat-"
	next "  Tunnel"
	done

Route71WestNPC1:
	ctxt "Ich kann Promis"
	line "nicht leiden."
	para "Die kriegen viel"
	line "Aufmerksamkeit für"
	cont "nichts!"
	para "Ich meine, selbst"
	line "der Champion der"
	para "Rijon-Liga hat"
	line "jetzt seine eigene"
	cont "Fernsehsendung!"
	para "Das ist verrückt!"
	done

Route71WestNPC2:
	ctxt "War Capparia City"
	line "zu kalt für dich?"
	para "Du hast Glück!"
	para "Von hier an, wird"
	line "es immer wärmer!"
	done

Route71WestNPC3:
	ctxt "Hier zu stehen,"
	line "macht mir Angst."
	para "Was, wenn ich"
	line "herunter falle?"
	para "Vielleicht, kann"
	line "ich ja einfach"
	cont "runter kriechen<...>"
	done

Route71WestNPC4:
	checktime 1 << NITE
	sif true
		jumptextfaceplayer .night_text
	jumptextfaceplayer .regular_text

.regular_text
	ctxt "Schlüssel,"
	line "Arena,"
	cont "Psycho."
	para "Verstanden?"
	done

.night_text
	ctxt "Kristallseide"
	para "Verstanden?"
	done

Route71West_Trainer_1:
	trainer EVENT_ROUTE_71_WEST_TRAINER_1, BUG_CATCHER, 1, .before_battle_text, .battle_won_text
	ctxt "Unterschätze nicht"
	line "die Kraft von"
	cont "Käfer-#mon!"
	done

.before_battle_text
	ctxt "Meine Käfer werden"
	line "immer stärker!"
	done

.battle_won_text
	ctxt "Argh! Nicht fair!"
	done

Route71West_Trainer_2:
	trainer EVENT_ROUTE_71_WEST_TRAINER_2, HIKER, 1, .before_battle_text, .battle_won_text
	ctxt "Pah!"
	para "Wisch dir das"
	line "blöde Grinsen von"
	cont "deinem Gesicht!"
	done

.before_battle_text
	ctxt "Los, Wiesor!"
	done

.battle_won_text
	ctxt "Nein, Wiesor!"
	done

Route71West_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $5, $33, 3, ROUTE_72_GATE

	;xy triggers
	db 0

	;signposts
	db 3
	signpost 5, 15, SIGNPOST_LOAD, Route71WestDirectionsSign1
	signpost 7, 52, SIGNPOST_LOAD, Route71WestDirectionsSign2
	signpost 5, 30, SIGNPOST_ITEM, Route71WestHiddenItem

	;people-events
	db 7
	person_event SPRITE_YOUNGSTER, 10, 40, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route71WestNPC1, -1
	person_event SPRITE_TEACHER, 5, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route71WestNPC2, -1
	person_event SPRITE_FISHER, 4, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, Route71WestNPC3, -1
	person_event SPRITE_COOLTRAINER_M, 12, 51, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route71WestNPC4, -1
	person_event SPRITE_FRUIT_TREE, 4, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, ORAN_TREE_1, -1
	person_event SPRITE_BUG_CATCHER, 12, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route71West_Trainer_1, -1
	person_event SPRITE_HIKER, 10, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route71West_Trainer_2, -1