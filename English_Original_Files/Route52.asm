Route52_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route52HiddenItem:
	dw EVENT_ROUTE_52_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route52DirectionsSign:
	ctxt "Hayward Docks"
	next "<UP> Dock Underpass"
	next "<RIGHT> Hayward City"
	done

Route52_Trainer:
	trainer EVENT_ROUTE_52_TRAINER_1, FISHER, 7, .before_battle_text, .battle_won_text

	ctxt "I'm fishing to"
	line "see what I can"
	cont "get next."
	done

.before_battle_text
	ctxt "Check out my epic"
	line "catch!"
	done

.battle_won_text
	ctxt "Guess I can do"
	line "better."
	done

Route52_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 8, 2, ROUTE_52_GATE
	warp_def 43, 3, 2, ROUTE_52_GATE_UNDERGROUND
	warp_def 19, 15, 1, ROUTE_52_HOUSE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 47, 5, SIGNPOST_LOAD, Route52DirectionsSign
	signpost 61, 4, SIGNPOST_ITEM, Route52HiddenItem

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 64, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, FIRE_RING, EVENT_ROUTE_52_ITEM_FIRE_RING
	person_event SPRITE_FISHING_GURU, 31, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route52_Trainer, -1
	person_event SPRITE_ROCK, 64, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_FRUIT_TREE, 17, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, RED_APRICORN_TREE_1, -1
