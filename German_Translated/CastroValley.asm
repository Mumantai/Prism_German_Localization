CastroValley_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag:
	setflag ENGINE_FLYPOINT_CASTRO_VALLEY
	return

CastroValley_GoldToken:
	dw EVENT_CASTRO_VALLEY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

CastroValleyTownSign:
	ctxt "Die nette"
	line "Hafenstadt."
	done

CastroValleyForestSign:
	ctxt "Castro Wald"
	line "Eingang "
	done

CastroValleyGymSign:
	ctxt "#mon Arena"
	line "Leiter: Koji"
	para "Der gnadenlose"
	line "Trainer!"
	done

CastroValleyUnderConstructionSign:
	ctxt "Im Bau "
	done

CastroValleyNPC1:
	ctxt "Ich habe ein"
	line "Relicanth"
	para "gefangen! "
	line "HAMMER! "
	done

CastroValleyNPC2:
	ctxt "Es sind ein paar"
	line "Weise im"
	cont "Castrowald."

	para "Ich frage mich,"
	line "was sie vorhaben."

	done

CastroValleyNPC3:
	ctxt "Koji liebt die"
	line "Kampfkunst! Er"
	para "ist unglaublich!"
	done

CastroValleyNPC4:
	ctxt "Sie wollen die"
	line "Villa in einen"
	para "Wohnkomplex"
	line "umbauen."
	done

CastroValleyNPC5:
	ctxt "Das ist nicht"
	line "wirklich ein Tal."

	done

CastroValley_MapEventHeader:: db 0, 0

.Warps
	db 9
	warp_def $1b, $16, 1, CASTRO_GYM
	warp_def $1b, $1c, 1, CASTRO_MANSION
	warp_def $5, $1d, 1, CASTRO_MART
	warp_def $1d, $4, 2, CASTRO_GATE
	warp_def $f, $15, 1, CASTRO_POKECENTER
	warp_def $1f, $12, 4, CASTRO_DOCK_PATH
	warp_def $1f, $13, 5, CASTRO_DOCK_PATH
	warp_def $f, $b, 1, CASTRO_SUPER_ROD
	warp_def $9, $7, 1, CASTRO_TYROGUE_TRADE

.CoordEvents
	db 0

.BGEvents
	db 7
	signpost 7, 21, SIGNPOST_LOAD, CastroValleyTownSign
	signpost 15, 22, SIGNPOST_JUMPSTD, pokecentersign
	signpost 31, 5, SIGNPOST_LOAD, CastroValleyForestSign
	signpost 29, 23, SIGNPOST_LOAD, CastroValleyGymSign
	signpost 5, 30, SIGNPOST_JUMPSTD, martsign
	signpost 29, 31, SIGNPOST_LOAD, CastroValleyUnderConstructionSign
	signpost 17, 26, SIGNPOST_ITEM, CastroValley_GoldToken

.ObjectEvents
	db 5
	person_event SPRITE_FISHING_GURU, 19, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC1, -1
	person_event SPRITE_SAGE, 28, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC2, -1
	person_event SPRITE_YOUNGSTER, 8, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC3, -1
	person_event SPRITE_POKEFAN_F, 16, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC4, -1
	person_event SPRITE_ROCKER, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC5, -1
