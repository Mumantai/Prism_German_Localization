CastroValley_MapScriptHeader:
 ;trigger count
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
	ctxt "The courtly"
	next "little port town"
	done

CastroValleyForestSign:
	ctxt "Castro Forest"
	next "Entrance"
	done

CastroValleyGymSign:
	ctxt "#mon Gym"
	next "Leader: Koji"
	nl   ""
	next "The tough and"
	next "brute Trainer!"
	done

CastroValleyUnderConstructionSign:
	ctxt "Under"
	next "construction"
	done

CastroValleyNPC1:
	ctxt "I caught a"
	line "Relicanth!"

	para "What luck!"
	done

CastroValleyNPC2:
	ctxt "There's a couple of"
	line "sages in the"
	cont "Castro Forest."

	para "I wonder what they"
	line "are doing?"
	done

CastroValleyNPC3:
	ctxt "Koji loves his"
	line "martial arts!"

	para "He's amazing!"
	done

CastroValleyNPC4:
	ctxt "I heard they're"
	line "converting the"
	para "mansion into an"
	line "apartment complex."

	para "I hope the rent's"
	line "cheap."
	done

CastroValleyNPC5:
	ctxt "This isn't much"
	line "of a valley."
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
	db 5
	signpost 7, 21, SIGNPOST_LOAD, CastroValleyTownSign
	signpost 31, 5, SIGNPOST_LOAD, CastroValleyForestSign
	signpost 29, 23, SIGNPOST_LOAD, CastroValleyGymSign
	signpost 29, 31, SIGNPOST_LOAD, CastroValleyUnderConstructionSign
	signpost 17, 26, SIGNPOST_ITEM, CastroValley_GoldToken

.ObjectEvents
	db 5
	person_event SPRITE_FISHING_GURU, 19, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC1, -1
	person_event SPRITE_SAGE, 28, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC2, -1
	person_event SPRITE_YOUNGSTER, 8, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC3, -1
	person_event SPRITE_POKEFAN_F, 16, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC4, -1
	person_event SPRITE_ROCKER, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CastroValleyNPC5, -1
