BotanCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_BOTAN_CITY
	return

BotanCity_GoldToken:
	dw EVENT_BOTAN_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

BotanCityCitySign:
	ctxt "Die Stadt"
	next "der Nostalgie!"
	done

BotanCityStationSign:
	ctxt "Botania City"
	next "Hauptbahnhof"
	done

BotanCityQRCode:
	opentext
	qrcode 1
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text
	ctxt "Saphir Ei -"
	line "Route 75"
	cont "Graß Fleck"
	done

BotanCityNPC1:
	ctxt "Die Geister etwas"
	line "nördlich von hier"
	para "erschrecken immer"
	line "wieder Menschen."

	para "Denen fehlt es an"
	line "Manieren!"
	done

BotanCityNPC2:
	ctxt "Ich hoffe, du bist"
	line "nicht aus Naljo."
	done

BotanCityNPC3:
	ctxt "#mon Center"
	line "dürfen hier nicht"
	cont "existieren <...>"

	para "Man glaubt, dass <...>"

	para "<...> <'>Sie<'> <...>"

	para "es nicht mögen,"
	line "wenn #mon auf"
	cont "diese Weise"
	cont "geheilt werden."
	done

BotanCityNPC4:
	ctxt "Wir sind das"
	line "einzige Dorf mit"
	cont "einer Farm."
	done

BotanCityNPC5:
	ctxt "Ich war der"
	line "Architekt für"
	cont "<'>dieses<'>Gebäude <...>"

	para "Nun bereue ich es <...>"
	done

BotanCityNPC6:
	ctxt "In Quarantäne,"
	line "wieder einmal."

	para "Seufz <...>"
	done

BotanCityNPC7:
	ctxt "Erzähle niemandem"
	line "von diesem Ort."
	done

BotanCityNPC8:
	ctxt "Diese Stadt ist"
	line "wohl Rijons"
	cont "seltsamste Stadt."

	para "Nirgendwo sonst"
	line "erlebt man"
	para "Überraschungen wie"
	line "hier."
	done

BotanCity_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def 5, 15, 1, BOTAN_HOUSE
	warp_def 9, 6, 4, ROUTE_59_GATE
	warp_def 17, 19, 1, BOTAN_MART
	warp_def 13, 36, 1, BOTAN_PACHISI
	warp_def 19, 37, 1, BOTAN_POKECENTER
	warp_def 3, 22, 3, HAUNTED_FOREST_GATE
	warp_def 25, 6, 1, BOTAN_MAGNET_TRAIN

.CoordEvents
	db 0

.BGEvents
	db 6
	signpost 11, 25, SIGNPOST_LOAD, BotanCityCitySign
	signpost 27, 9, SIGNPOST_LOAD, BotanCityStationSign
	signpost 19, 38, SIGNPOST_JUMPSTD, pokecentersign
	signpost 8, 18, SIGNPOST_ITEM, BotanCity_GoldToken
	signpost 11, 17, SIGNPOST_READ, BotanCityQRCode
	signpost 17, 20, SIGNPOST_JUMPSTD, martsign

.ObjectEvents
	db 8
	person_event SPRITE_POKEFAN_F, 20, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanCityNPC1, -1
	person_event SPRITE_FISHING_GURU, 29, 11, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, BotanCityNPC2, -1
	person_event SPRITE_ROCKER, 12, 23, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, BotanCityNPC3, -1
	person_event SPRITE_POKEFAN_F, 11, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, BotanCityNPC4, -1
	person_event SPRITE_FISHER, 12, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, BotanCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 28, 3, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanCityNPC6, -1
	person_event SPRITE_YOUNGSTER, 22, 38, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, BotanCityNPC7, -1
	person_event SPRITE_SAGE, 8, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, BotanCityNPC8, -1
