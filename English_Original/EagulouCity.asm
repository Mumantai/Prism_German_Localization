EagulouCity_MapScriptHeader;trigger count
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
	ctxt "Self proclaimed"
	next "under rated"
	done

EagulouCity_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 5, 6, 3, MT_BOULDER_B1F
	warp_def 3, 18, 1, EAGULOU_GYM_F1
	warp_def 11, 15, 1, EAGULOU_POKECENTER
	warp_def 5, 10, 3, EAGULOU_PARK_GATE
	warp_def 11, 5, 1, EAGULOU_MART

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 7, 11, SIGNPOST_LOAD, EagulouCityParkDirectionsSign
	signpost 5, 17, SIGNPOST_LOAD, EagulouCityCitySign
	signpost 11, 6, SIGNPOST_JUMPSTD, martsign
	signpost 11, 16, SIGNPOST_JUMPSTD, pokecentersign
	signpost 14, 7, SIGNPOST_ITEM, EagulouCity_GoldToken

.ObjectEvents
	db 0
