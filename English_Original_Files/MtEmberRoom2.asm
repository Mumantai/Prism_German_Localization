MtEmberRoom2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberRoom2_Trainer:
	trainer EVENT_MT_EMBER_ROOM2_TRAINER, FIREBREATHER, 1, .before_battle_text, .battle_won_text

	ctxt "Fire types also"
	line "recover well with"
	para "a local source of"
	line "heat."

	para "That's another"
	line "reason to train in"
	cont "this volcano."

	para "You should try it!"
	done

.before_battle_text
	ctxt "I train in the"
	line "volcano here to"
	para "keep my #mon"
	line "happy."

	para "They like it hot!"
	done

.battle_won_text
	ctxt "Hot hot HOT!"
	done

MtEmberRoom2_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $c, 2, MT_EMBER
	warp_def $b, $d, 2, MT_EMBER

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_POKE_BALL, 4, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HEAT_ROCK, EVENT_MT_EMBER_ROOM_2_ITEM_HEAT_ROCK
	person_event SPRITE_FIREBREATHER, 2,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, MtEmberRoom2_Trainer, -1
