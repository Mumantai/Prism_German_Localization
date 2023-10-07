Route61_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route61Sign:
	ctxt "Yuva Mila Lake"
	next "The path to many"
	next "cities!"
	done

Route61MagnetTrainSign:
	signpostheader 8
	done

Route61_Trainer_1:
	trainer EVENT_ROUTE_61_TRAINER_1, FISHER, 8, .before_battle_text, .battle_won_text

	ctxt "The fish are"
	line "always biting"
	cont "here."
	done

.before_battle_text
	ctxt "This is my secret"
	line "fishing spot."
	done

.battle_won_text
	ctxt "Don't tell anyone!"
	done

Route61_Trainer_2:
	trainer EVENT_ROUTE_61_TRAINER_2, FISHER, 9, .before_battle_text, .battle_won_text

	ctxt "Maybe I should let"
	line "them dangle around"
	para "the hook a bit"
	line "before I decide"
	para "that they should"
	line "go to town with"
	cont "me."
	done

.before_battle_text
	ctxt "I have a rod that's"
	line "super."
	done

.battle_won_text
	ctxt "That's how I caught"
	line "these #mon!"
	done

Route61_Trainer_3:
	trainer EVENT_ROUTE_61_TRAINER_3, FISHER, 10, .before_battle_text, .battle_won_text

	ctxt "It'd be a good idea"
	line "to sleep with the"
	cont "fishes."

	para "Still wrong?"
	done

.before_battle_text
	ctxt "Hook, line and"
	line "sinker!"
	done

.battle_won_text
	ctxt "What, that idiom"
	line "doesn't apply"
	cont "here?"
	done

Route61_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 33, 13, 1, ROUTE_61_HOUSE2
	warp_def 31, 6, 2, ROUTE_61_GATE_SOUTH
	warp_def 65, 8, 1, ROUTE_61_GATE_NORTH
	warp_def 29, 13, 1, ROUTE_61_HOUSE
	warp_def 65, 9, 1, ROUTE_61_GATE_NORTH

.CoordEvents: db 0

.BGEvents: db 2
	signpost 55, 13, SIGNPOST_LOAD, Route61Sign
	signpost 60,  9, SIGNPOST_LOAD, Route61MagnetTrainSign

.ObjectEvents: db 5
	person_event SPRITE_FISHER, 97, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 8, Route61_Trainer_1, -1
	person_event SPRITE_FISHER, 49, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route61_Trainer_2, -1
	person_event SPRITE_FISHER, 37, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route61_Trainer_3, -1
	person_event SPRITE_POKE_BALL, 103, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_ROUTE_61_ITEM_CAGE_KEY
	person_event SPRITE_FRUIT_TREE, 57, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, WHITE_APRICORN_TREE_1, -1
