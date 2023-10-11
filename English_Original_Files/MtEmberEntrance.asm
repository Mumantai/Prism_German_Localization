MtEmberEntrance_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberEntrance_Trainer_1:
	trainer EVENT_MT_EMBER_ENTRANCE_TRAINER_1, MINER, 2, .before_battle_text, .battle_won_text

	ctxt "Ever since the"
	line "protected status"
	para "was lifted from"
	line "this place, many"
	para "of us have come"
	line "here to reap the"
	cont "rewards!"
	done

.before_battle_text
	ctxt "Hey! Back off!"
	line "This is my claim!"
	done

.battle_won_text
	ctxt "Fine, I guess I"
	line "could share<...>"
	done

MtEmberEntrance_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $2, $2, 3, EMBER_BROOK
	warp_def $f, $11, 1, MT_EMBER_ROOM_1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_MINER, 14, 14, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmberEntrance_Trainer_1, -1
