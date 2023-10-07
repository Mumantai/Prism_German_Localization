EagulouCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag:
	setflag ENGINE_FLYPOINT_EAGULOU_CITY
	return

EagulouCity_GoldToken:
	dw EVENT_EAGULOU_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

EagulouCityParkDirectionsSign:
	ctxt "<UP> Eagulou Park"
	done

EagulouCityCitySign:
	ctxt "Self-proclaimed"
	next "underrated"
	done

EagulouCityExpansionSign:
	ctxt "Expansion Project"
	nl   ""
	next "Currently under"
	next "construction."
	done

EagulouCityHousePlotSign:
	ctxt "FOR SALE"
	nl   ""
	next "Beachfront plot."
	next "For those who"
	next "love the water!"
	done

EagulouCity_NPC_1:
	ctxt "We are hoping that"
	line "this construction"
	para "project will"
	line "attract new people"
	cont "to our city."

	para "Everyone moved out"
	line "when they built"
	cont "the prison<...>"
	done

EagulouCity_NPC_2:
	ctxt "I'm trying to sell"
	line "this choice plot,"
	para "but nobody seems"
	line "to want it<...>"

	para "Do you know anyone"
	line "who would like to"
	cont "live by the sea?"

	para "<...>"

	para "<...>tch, as if you'd"
	line "know."

	para "Beat it, kid."
	done

EagulouCity_NPC_3:
	ctxt "Have you been to"
	line "the Battle Tower?"

	para "I'm hoping to"
	line "build my own here!"

	para "Though getting the"
	line "money together is"
	cont "proving tricky<...>"

	para "Perhaps I could"
	line "start an Internet"
	cont "crowd fund!"

	para "<...>Nah, that will"
	line "never work."

	para "No one on the web"
	line "has any money<...>"
	done

EagulouCity_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def  7, 46, 3, MT_BOULDER_B1F
	warp_def  5, 58, 1, EAGULOU_GYM_F1
	warp_def 13, 55, 1, EAGULOU_POKECENTER
	warp_def  7, 50, 3, EAGULOU_PARK_GATE
	warp_def 13, 45, 1, EAGULOU_MART

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost  9, 51, SIGNPOST_LOAD, EagulouCityParkDirectionsSign
	signpost  7, 57, SIGNPOST_LOAD, EagulouCityCitySign
	signpost 16, 47, SIGNPOST_ITEM, EagulouCity_GoldToken
	signpost 13, 39, SIGNPOST_LOAD, EagulouCityExpansionSign
	signpost 19, 21, SIGNPOST_LOAD, EagulouCityHousePlotSign

.ObjectEvents
	db 4
	person_event SPRITE_OFFICER, 11, 33, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EagulouCity_NPC_1, -1
	person_event SPRITE_GENTLEMAN, 19, 19, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, EagulouCity_NPC_2, -1
	person_event SPRITE_COOLTRAINER_M,  8, 11, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, EagulouCity_NPC_3, -1
