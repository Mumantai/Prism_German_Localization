MtEmberEntrance_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberEntrance_Trainer_1:
	trainer EVENT_MT_EMBER_ENTRANCE_TRAINER_1, MINER, 2, .before_battle_text, .battle_won_text
	ctxt "Seitdem dieser Ort"
	line "seinen"
	para "Schutzstatus"
	line "verloren hat, sind"
	para "viele von uns"
	line "hierher gekommen,"
	para "um die Schätze"
	line "auszugraben!"
	done

.before_battle_text
	ctxt "Hey! Verzieh dich!"
	line "Das ist meins!"
	done

.battle_won_text
	ctxt "Dann teile ich mal"
	line "mit dir <...>"
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