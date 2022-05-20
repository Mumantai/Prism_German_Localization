GoldenrodCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag:
	setflag ENGINE_FLYPOINT_GOLDENROD_CITY
	return

GoldenrodCity_GoldToken:
	dw EVENT_GOLDENROD_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

GoldenrodCity_MagnetTrainSign:
	ctxt "Magnet Bahn"
	next "Station"
	done

GoldenrodCity_QRCode:
	opentext
	qrcode 2
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text:
	ctxt "Smaragd Ei -"
	line "Felsen in kleinem"
	cont "teich."

	done

GoldenrodCity_GymSign:
	ctxt "#mon Arena"
	next "Leiterin: Bianca"
	nl " "
	next "Das huebsche"
	next "Mädchen!"

	done

GoldenrodCity_CitySign:
	ctxt "Die festliche"
	next "Stadt mit Charme "
	done

GoldenrodCity_CapeSign:
	ctxt "<LEFT> Dukatia Kap"
	done

GoldenrodCity_GameCornerSign:
	ctxt "Dukatia Spielhalle"
	nl " "
	next "Dein Spielplatz!"

	done

GoldenrodCity_UndergroundSign:
	ctxt "Untergrund"
	next "Eingang"
	done

GoldenrodCityNPC1:
	ctxt "Dieser Magnetzug "
	line "ist erstaunlich!"

	para "Er fährt Berge "
	line "hoch, unter dem "
	para "Meer und überall "
	line "dazwischen!"

	done

GoldenrodCityNPC2:
	ctxt "Ich war traurig, "
	line "als das Kaufhaus "
	cont "zerstört wurde."

	para "Aber sie bauen ein"
	line "neues!"

	para "Das Untergeschoss "
	line "sollte in Ordnung "
	para "sein, aber seit "
	line "Jahren ist niemand"
	para "mehr dort unten "
	line "gewesen."

	done

GoldenrodCityNPC3:
	ctxt "Wenn dein #mon "
	line "sehr glücklich "
	para "ist, wird ihm eine"
	line "Frau eine spezial-"
	cont "Attacke lehren."

	done

GoldenrodCityNPC4:
	ctxt "Dort stand früher "
	line "der Radioturm."

	para "DJ Ben war der "
	line "coolste!"

	para "Ich habe gehört, "
	line "er wird eine neue "
	para "Show starten, wenn"
	line "sie den Radioturm "
	cont "wieder aufbauen."

	para "Ich kann's kaum "
	line "erwarten!"

	done

GoldenrodCityNPC5:
	ctxt "Ich erinnere mich,"
	line "als Team Rocket "
	para "versuchte, die "
	line "Stadt einzunehmen."

	para "Ein Kind namens "
	line "Gold rettete alle."

	done

GoldenrodCityNPC6:
	ctxt "Nicht einmal ein "
	line "Erdbeben kann uns "
	cont "aufhalten."

	para "Ganz gleich, was "
	line "passiert, wir "
	para "werden immer "
	line "standaft bleiben."

	done

GoldenrodCityNPC7:
	ctxt "Ich habe gehört, "
	line "dass weit weg ein "
	para "spezieller Ring "
	line "ein Portal in eine"
	para "andere Dimension "
	line "öffnen wird."

	para "Da will ich hin!"

	done

GoldenrodCityGuard:
	ctxt "Es tut mir leid, "
	line "ich kann Sie nur "
	para "als Johto-Bürger "
	line "passieren lassen."

	para "Wir mussten harte "
	line "Maßnahmen "
	para "ergreifen, denn es"
	line "geht das Gerücht "
	para "um, dass sich hier"
	line "ein Krimineller "
	para "aus einer weit "
	line "entfernten Region "
	cont "versteckt."

	done

GoldenrodCity_MapEventHeader:: db 0, 0

.Warps
	db 13
	warp_def $7, $8, 1, GOLDENROD_GYM
	warp_def $17, $17, 1, GOLDENROD_MART
	warp_def $17, $f, 1, GOLDENROD_POKECENTER
	warp_def $5, $21, 1, GOLDENROD_BILL
	warp_def $d, $9, 1, GOLDENROD_MAGNET_TRAIN
	warp_def $10, $4, 3, GOLDENROD_CAPE_GATE
	warp_def $11, $4, 4, GOLDENROD_CAPE_GATE
	warp_def $17, $1f, 1, GOLDENROD_HAPPINESS_MOVE_TEACHER
	warp_def $23, $9, 9, SAXIFRAGE_POKECENTER
	warp_def $23, $18, 1, GOLDENROD_MAGNET_TRAIN
	warp_def $17, $7, 1, GOLDENROD_GAME_CORNER
	warp_def $5, $d, 1, GOLDENROD_UNDERGROUND_ENTRY_A
	warp_def $1d, $b, 1, GOLDENROD_UNDERGROUND_ENTRY_B

.CoordEvents
	db 0

.BGEvents
	db 10
	signpost 14, 8, SIGNPOST_LOAD, GoldenrodCity_MagnetTrainSign
	signpost 26, 26, SIGNPOST_READ, GoldenrodCity_QRCode
	signpost 10, 33, SIGNPOST_ITEM, GoldenrodCity_GoldToken
	signpost 8, 10, SIGNPOST_LOAD, GoldenrodCity_GymSign
	signpost 18, 22, SIGNPOST_LOAD, GoldenrodCity_CitySign
	signpost 18, 6, SIGNPOST_LOAD, GoldenrodCity_CapeSign
	signpost 24, 6, SIGNPOST_LOAD, GoldenrodCity_GameCornerSign
	signpost 6, 14, SIGNPOST_LOAD, GoldenrodCity_UndergroundSign
	signpost 30, 12, SIGNPOST_LOAD, GoldenrodCity_UndergroundSign
	signpost 23, 16, SIGNPOST_JUMPSTD, pokecentersign

.ObjectEvents
	db 8
	person_event SPRITE_POKEFAN_M, 10, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC1, -1
	person_event SPRITE_YOUNGSTER, 16, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC2, -1
	person_event SPRITE_COOLTRAINER_F, 18, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 26, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 28, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC5, -1
	person_event SPRITE_LASS, 8, 18, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC6, -1
	person_event SPRITE_GRAMPS, 25, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC7, -1
	person_event SPRITE_OFFICER, 4, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, GoldenrodCityGuard, -1
