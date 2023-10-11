Route59_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route59HiddenItem:
	dw EVENT_ROUTE_59_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route59DirectionsSign:
	ctxt "Jaeru Plains"
	next "<UP> Silph Warehouse"
	next "<UP><RIGHT>Botan City"
	next "<LEFT> Jaeru City"
	done

Route59_Trainer_1:
	trainer EVENT_ROUTE_59_TRAINER_1, JUGGLER, 2, .before_battle_text, .battle_won_text

	ctxt "Now that the"
	line "tension in Botan"
	para "city has calmed"
	line "down, everyone"
	para "is free to enter"
	line "and exit at will."
	done

.before_battle_text
	ctxt "Botan City isn't"
	line "quarantined"
	cont "anymore!"
	done

.battle_won_text
	ctxt "Too bad they don't"
	line "have a #mon"
	cont "Center, because"
	para "I could use one"
	line "about now."
	done

Route59_Trainer_2:
	trainer EVENT_ROUTE_59_TRAINER_2, FIREBREATHER, 4, .before_battle_text, .battle_won_text

	ctxt "Time to pack up"
	line "on more corn"
	cont "starch."
	done

.before_battle_text
	ctxt "The middle of this"
	line "grass field is the"
	para "best place to"
	line "practice my fire"
	cont "breathing!"
	done

.battle_won_text
	ctxt "Calm down, you"
	line "beat me."

	para "It's not like"
	line "you're the champ"
	cont "or something."

	para "Oh, wait."
	done

Route59_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 3, 54, 1, SILPH_WAREHOUSE_F1
	warp_def 5, 63, 2, ROUTE_59_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 55, SIGNPOST_LOAD, Route59DirectionsSign
	signpost 12, 17, SIGNPOST_ITEM, Route59HiddenItem

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 11, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWORDS_DANCE, 0, EVENT_ROUTE_59_NPC_1
	person_event SPRITE_JUGGLER, 10, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route59_Trainer_1, -1
	person_event SPRITE_FIREBREATHER, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route59_Trainer_2, -1
