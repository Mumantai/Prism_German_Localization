Route71_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route71HiddenItem:
	dw EVENT_ROUTE_71_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route71DirectionsSign1:
	ctxt "<LEFT> Capparia City"
	next "<RIGHT><UP>Oxalia City"
	next "<RIGHT> Klathrat-"
	next "  Tunnel"
	done

Route71DirectionsSign2:
	ctxt "<UP> Oxalia City"
	next "<LEFT> Capparia City"
	next "<RIGHT> Klathrat-"
	next "  Tunnel"
	done

Route71NPC1:
	ctxt "Ich hasse diese"
	line "Promis."
	
	para "Die kriegen viel"
	line "Aufmerksamkeit für"
	cont "nichts!"
	
	para "Ich meine sogar"
	line "der Champ der"
	para "Rijon Liga hat"
	line "seine eigene"
	cont "TV-Show!"
	
	para "Das ist verrückt!"
	done

Route71NPC2:
	ctxt "War Capparia City"
	line "zu kalt für dich?"

	para "Du hast glück!"

	para "von hier an wird"
	line "es immer wärmer!"
	done

Route71NPC3:
	ctxt "Ich habe Angst"
	line "hier zu stehen."

	para "vieleicht könnte"
	line "ich runter fallen."

	para "Wenn ich nach"
	line "unten krieche, wär"
	cont "ich evt. sicher."
	done

Route71NPC4:
	checktime 4
	sif true
		jumptextfaceplayer .night_text
	jumptextfaceplayer .regular_text

.regular_text
	ctxt "Schlüssel,"
	line "Arena,"
	cont "Psycho."

	para "Kapiert?"
	done

.night_text
	ctxt "Kristallseide"

	para "Kapiert?"
	done

Route71_Trainer_1:
	trainer EVENT_ROUTE_71_TRAINER_1, BUG_CATCHER, 1, .before_battle_text, .battle_won_text

	ctxt "Unterschätz nicht"
	line "die Kraft von"
	cont "Käfer #mon!"
	done

.before_battle_text
	ctxt "Meine Käfer werden"
	line "immer Stärker!"
	done

.battle_won_text
	ctxt "Argh! Nicht fair!"
	done

Route71_Trainer_2:
	trainer EVENT_ROUTE_71_TRAINER_2, HIKER, 1, .before_battle_text, .battle_won_text

	ctxt "Gah!"

	para "Wisch dir das"
	line "Grinsen von"
	cont "deinem Gesicht!"
	done

.before_battle_text
	ctxt "Los, Wiesor!"
	done

.battle_won_text
	ctxt "Nein, Wiesor!"
	done

Route71_MapEventHeader ;filler
	db 0, 0

;warps
	db 1
	warp_def $5, $33, 3, ROUTE_72_GATE

	;xy triggers
	db 0

	;signposts
	db 3
	signpost 5, 15, SIGNPOST_LOAD, Route71DirectionsSign1
	signpost 7, 52, SIGNPOST_LOAD, Route71DirectionsSign2
	signpost 5, 30, SIGNPOST_ITEM, Route71HiddenItem

	;people-events
	db 7
	person_event SPRITE_YOUNGSTER, 10, 40, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route71NPC1, -1
	person_event SPRITE_TEACHER, 5, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route71NPC2, -1
	person_event SPRITE_FISHER, 4, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, Route71NPC3, -1
	person_event SPRITE_COOLTRAINER_M, 12, 51, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route71NPC4, -1
	person_event SPRITE_FRUIT_TREE, 4, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, 15, -1
	person_event SPRITE_BUG_CATCHER, 12, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route71_Trainer_1, -1
	person_event SPRITE_HIKER, 10, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route71_Trainer_2, -1
