OxalisCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_OXALIS_CITY
	return

OxalisCitySalonSign:
	ctxt "Klamotten wie"
	next "maßgeschneidert!"
	next "Sei auch du cool!"
	done

OxalisCityCitySign:
	ctxt "Die Stadt für"
	next "junge, heran-"
	next "wachsende Trainer"
	done

OxalisCityGymSign:
	ctxt "#mon-Arena"
	next "Leiter: Josiah"
	next ""
	next "Zu heiß zum"
	next "Anfassen!"
	done

OxalisCityHappinessRaterSign:
	ctxt "Komm und erfahre"
	next "die Zuneigung"
	next "deiner #mon"
	next "zu dir!"
	done

OxalisCityTrainerHallSign:
	ctxt "Die Beginner-"
	next "Trainerhalle."
	next "Der richtige Ort"
	next "für Anfänger!"
	done

OxalisCityQRCode:
	opentext
	qrcode 0
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text
	ctxt "Saphir-Ei -"
	line "Route 75, kleine"
	cont "Grasfläche"
	done

OxalisCityNPC1:
	ctxt "Heutzutage gibt es"
	line "schon richtig"
	cont "arrogante Leute."

	para "Josiah ist unser"
	line "Arenaleiter und"
	para "man kan ihn nur"
	line "mit einem Wort"
	cont "beschreiben."

	para "<...>"

	para "Idiot."
	done

OxalisCityNPC2:
	ctxt "Siehst du mein"
    line "pinkes Kleid?"
	
	para "Ist es nicht irre?"

	para "Ich habe dies von"
	line "dem Klamotten-"
	cont "Laden erworben."
	
	para "Direkt hier in der"
	line "Stadt!"

	para "Es ist der"
	line "modischste"
	cont "Klamottenladen"
	cont "in ganz Naljo!"

	para "Sogar Schminke"
	line "machen sie dir!"

	para "Versuch es mal!"
	done

OxalisCityNPC3:
	ctxt "Hier lebt"
	line "eine Frau."

	para "Sie überprüft,"
	line "wie glücklich"
	cont "deine #mon"
	cont "wirklich sind."
	done

OxalisCityNPC4:
	ctxt "Hmm <...>"

	para "Mann, ist diese"
	line "Stadt gewachsen <...>"
	done

OxalisCityNPC5:
	ctxt "Da draußen muss es"
	line "mehr geben als"
	para "das, was uns"
	line "erzählt wird <...>"
	done

OxalisCityNPC6:
	ctxt "Dieses Haus hat"
	line "2 Untergrundgänge."

	para "Dies wurde gebaut,"
	line "um Oxalis mit den"
	para "Bergen auf Route"
	line "73 zu verbinden."

	para "Später wurde dies"
	line "zum Treffpunkt"
	cont "unter Trainern."

	para "Einer dieser Typen"
	line "verschenkt ab und"
	cont "zu #mon!"
	done

OxalisCityNPC7:
	ctxt "Ick sags dir, Bro,"
	line "dieser Ort <...>"

	para "Is wie, wenn de"
	line "versuchst, ne nette"
	cont "Person zu sein <...>"

	para "Weißt schon, sowat"
	line "wie <'>Hallo!<'> <...>"
	para "<...> oder <'>Jutn"
	line "Morgen!<'> <...>"
	para "<...> und dir fliegt"
	line "nur sowat um" 
	cont "die Ohrn:"

	para "<'>Lass mich allein<'>"
	line "<'>Verschwinde," 
	cont "Abschaum!<'>"
	cont "<'>Nicht anfassen!<'>"

	para "Ick weeß noch, die"
	line "Leute aus Johto"
    cont "und Rijon <...>"

	para "<...> warn jechillter."

	para "Haste <'>Yo!<'>"
	line "jesacht, kam n"
    cont "<'>Ey!<'> zurüch."

	para "Warum sindse in"
	line "Naljo die janze"
	cont "Zeit so"
    cont "festjefahrn?"
	done

OxalisCity_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 7, 12, 1, OXALIS_SALON
	warp_def 23, 27, 1, ROUTE_73_GATE
	warp_def 21, 33, 1, HAPPINESS_RATER
	warp_def 31, 23, 5, ROUTE_72_GATE
	warp_def 15, 22, 1, OXALIS_GYM
	warp_def 1, 21, 3, ROUTE_73_GATE
	warp_def 13, 37, 1, OXALIS_POKECENTER
	warp_def 5, 37, 8, TRAINER_HOUSE
	warp_def 5, 29, 1, TRAINER_HOUSE
	warp_def 31, 24, 6, ROUTE_72_GATE
	warp_def 19, 12, 2, OXALIS_MART

.CoordEvents: db 0

.BGEvents: db 8
	signpost 9, 15, SIGNPOST_LOAD, OxalisCitySalonSign
	signpost 25, 23, SIGNPOST_LOAD, OxalisCityCitySign
	signpost 17, 21, SIGNPOST_LOAD, OxalisCityGymSign
	signpost 23, 35, SIGNPOST_LOAD, OxalisCityHappinessRaterSign
	signpost 6, 30, SIGNPOST_LOAD, OxalisCityTrainerHallSign
	signpost 7, 19, SIGNPOST_READ, OxalisCityQRCode
	signpost 19, 13, SIGNPOST_JUMPSTD, martsign
	signpost 13, 38, SIGNPOST_JUMPSTD, pokecentersign

.ObjectEvents: db 7
	person_event SPRITE_GRAMPS, 18, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC1, -1
	person_event SPRITE_TEACHER, 10, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, OxalisCityNPC2, -1
	person_event SPRITE_LASS, 24, 32, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC3, -1
	person_event SPRITE_GRAMPS, 28, 16, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 22, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 6, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC6, -1
	person_event SPRITE_ROCKER, 13, 32, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC7, -1
