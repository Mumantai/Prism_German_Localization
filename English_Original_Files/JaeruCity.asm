JaeruCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_JAERU_CITY
	return

JaeruCity_GoldToken:
	dw EVENT_JAERU_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

JaeruCityCitySign:
	ctxt "The impossible to"
	next "pronounce city"
	done

JaeruCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Sparky"
	nl   ""
	next "The Trainer that"
	next "shocks everybody!"
	done

JaeruCityNPC1:
	ctxt "Sparky lost his"
	line "edge; see for"
	cont "yourself."
	done

JaeruCityNPC2:
	ctxt "They sell some of"
	line "the best beer"
	cont "right here!"
	done

JaeruCityNPC3:
	ctxt "If you go north,"
	line "you'll end up at"
	cont "the Rijon League."
	done

JaeruCity_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $5, $20, 4, JAERU_GATE
	warp_def $19, $4, 4, ROUTE_60_GATE
	warp_def $1f, $1e, 1, JAERU_GYM
	warp_def $1b, $f, 1, JAERU_POKECENTER
	warp_def $1b, $15, 1, JAERU_MART
	warp_def $1d, $7, 1, JAERU_GOLD_TOKEN_VENDOR

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 23, 27, SIGNPOST_LOAD, JaeruCityCitySign
	signpost 31, 27, SIGNPOST_LOAD, JaeruCityGymSign
	signpost 16, 15, SIGNPOST_ITEM, JaeruCity_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_YOUNGSTER, 26, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, JaeruCityNPC1, -1
	person_event SPRITE_BURGLAR, 30, 21, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, JaeruCityNPC2, -1
	person_event SPRITE_LASS, 25, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, JaeruCityNPC3, -1
