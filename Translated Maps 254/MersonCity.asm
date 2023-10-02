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
	ctxt "#mon-Arena"
	next "Leiter: Karpman"
	done

MersonCityCitySign:
	ctxt "Die kleine"
	next "Felsspalte."
	done

MersonCityNPC1:
	ctxt "Kapman ist über"
	line "die Jahre immer"
	cont "stärker geworden."
	done

MersonCityNPC2:
	ctxt "Ich habe vor dem"
	line "#mon-Center"
	para "einen Baum"
	line "gepflanzt."
	para "Ich bin sicher,"
	line "dass niemand etwas"
	cont "dagegen hat."
	done

MersonCityNPC3:
	ctxt "Diese Stadt wird"
	line "als das Tor nach"
	para "Süd-Rijon bekannt"
	line "sein, sobald der"
	para "Weg im Süden"
	line "wieder frei ist."
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