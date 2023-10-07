MersonCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_MERSON_CITY
	return

MersonCity_GoldToken:
	dw EVENT_MERSON_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

MersonCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Karpman"
	done

MersonCityCitySign:
	ctxt "The little rocky"
	next "crevice"
	done

MersonCityNPC1:
	ctxt "Karpman's been"
	line "getting stronger"
	cont "over the years."
	done

MersonCityNPC2:
	ctxt "I planted a tree"
	line "in front of the"
	cont "#mon Center."

	para "I'm sure nobody"
	line "will mind."
	done

MersonCityNPC3:
	ctxt "This town is known"
	line "as the gateway to"
	cont "South Rijon."

	para "Or at least it"
	line "would be, if they"
	para "opened the gate at"
	line "the border<...>"

	para "We've lost so much"
	line "tourism."

	para "They'd better open"
	line "it soon<...>"
	done

MersonCity_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $21, $f, 1, MERSON_POKECENTER
	warp_def $1d, $b, 1, MERSON_GOLD_TOKEN_EXCHANGE
	warp_def $5, $2, 1, MERSON_GYM
	warp_def $d, $f, 1, MERSON_MART
	warp_def $19, $5, 1, MERSON_BIRD_HOUSE
	warp_def $11, $d, 1, MERSON_HOUSE2

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 7, 1, SIGNPOST_LOAD, MersonCityGymSign
	signpost 7, 11, SIGNPOST_LOAD, MersonCityCitySign
	signpost 35, 16, SIGNPOST_ITEM, MersonCity_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_BLACK_BELT, 9, 12, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MersonCityNPC1, -1
	person_event SPRITE_FISHING_GURU, 30, 4, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MersonCityNPC2, -1
	person_event SPRITE_LASS, 21, 7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MersonCityNPC3, -1
