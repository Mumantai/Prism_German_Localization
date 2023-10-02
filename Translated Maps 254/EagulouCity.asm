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
	ctxt "<UP> Aegolia-Park"
	done

EagulouCityCitySign:
	ctxt "Angeblich äußerst"
	next "unterbewertet!"
	done

EagulouCityExpansionSign:
	ctxt "Ausbau-Project"
	nl   ""
	next "Derzeit im"
	next "Bau."
	done

EagulouCityHousePlotSign:
	ctxt "ZUM VERKAUF"
	nl   ""
	next "Grundstück am"
	next "Strand. Für die"
	next "Surfer unter euch!"
	done

EagulouCity_NPC_1:
	ctxt "Wir hoffen, dass"
	line "dieses Bauprojekt"
	para "neue Leute in"
	line "diese Stadt zieht!"
	para "Beim Bau des"
	line "Gefängnisses"
	para "zogen viele leute"
	line "weg<...>"
	done

EagulouCity_NPC_2:
	ctxt "Ich versuche, das"
	line "Grundstück hier zu"
	para "verkaufen, doch"
	line "keiner scheint es"
	cont "zu wollen<...>"
	para "Kennst du wen der"
	line "gerne am Meer"
	cont "wohnen möchte?"
	para "<...>"
	para "<...> Jetzt frage ich"
	line "ja schon ein Kind."
	para "Zieh leine."
	done

EagulouCity_NPC_3:
	ctxt "Warst du schon im"
	line "Kampfturm?"
	para "Ich möchte hier"
	line "mein eigenes"
	para "bauen, aber das"
	line "Geld zusammen zu"
	para "bekommen ist sehr"
	cont "schwierig<...>"
	para "Ob eine Kick-"
	line "starter Kampagne"
	cont "helfen würde?"
	para "<...>Ne, denke nicht."
	para "Im Internet hat"
	line "keiner Geld<...>"
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