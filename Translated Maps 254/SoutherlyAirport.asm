SoutherlyAirport_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyAirportNPC1:
	ctxt "Es gibt so viele "
	line "#mon auf der "
	cont "Welt."
	para "Ich will so viele "
	line "wie möglich sehen!"
	done

SoutherlyAirportNPC2:
	ctxt "Ich war schon "
	line "überall!"
	para "Nenne mir eine "
	line "Region und ich war"
	cont "schon dort!"
	done

SoutherlyAirportNPC3:
	ctxt "Wenn der Flughafen"
	line "in Dukatia City "
	para "wieder steht, "
	line "können wir nach "
	cont "Johto fliegen!"
	done

SoutherlyAirportPilot:
	opentext
	checkitem MYSTERY_TCKT
	sif false
		jumptext .introduction_text
	checkevent EVENT_PRESENTED_MYSTERY_TICKET
	sif false, then
		setevent EVENT_PRESENTED_MYSTERY_TICKET
		writetext .first_time_mystery_ticket_text
	selse
		writetext .want_to_go_text
	sendif
	yesorno
	sif false
		jumptext .declined_text
	writetext .leaving_text
	special FadeOutPalettes
	playwaitsfx SFX_SWORDS_DANCE
	playwaitsfx SFX_THUNDER
	wait 5
	warp MYSTERY_ZONE_AIRPORT, 3, 9
	end

.introduction_text
	ctxt "Hallo hallo!"
	para "Falls du jemals "
	line "irgendwo hin "
	para "fliegen möchtest, "
	line "komm mit einem "
	cont "Ticket wieder."
	para "Wir bringen dich "
	line "dann überall hin!"
	done

.first_time_mystery_ticket_text
	ctxt "Moment mal!"
	para "<...>"
	line "Lese ich das "
	cont "richtig?"
	para "<...>"
	line "Ja, tatsächlich!"
	para "Das ist wirklich "
	line "ein Ticket zur"
	cont "Mysteriösen Zone!"
	para "In der "
	line "Mysteriösen Zone"
	para "warten die besten "
	line "Trainer der Welt "
	cont "auf dich!"
	para "Du musst ja echt "
	line "was drauf haben!"
	para "Ich kann dich "
	line "sofort dort hin "
	cont "bringen."
	para "Willst du los?"
	done

.want_to_go_text
	ctxt "Willst du zur"
	line "Mysteriösen Zone?"
	done

.leaving_text
	ctxt "Okay!"
	line "Los geht's!"
	sdone

.declined_text
	ctxt "Schade."
	para "Ich bring selten "
	line "jemanden in die"
	cont "Mysteriöse Zone."
	done

SoutherlyCityAirportCheckInSign:
	ctxt "Flughafen"
	nl   ""
	next "Check-in und"
	next "Boarding Gate"
	done

SoutherlyCityAirportWarningSign:
	ctxt "Behalte dein"
	next "Koffer immer im"
	next "Auge. Melde alles"
	next "was dir verdächtig"
	next "vorkommt!"
	done

SoutherlyCityAirportGuard:
	ctxt "Sorry, Ich kann"
	line "dich nicht vorbei"
	para "lassen, ohne dass"
	line "du eingecheckt"
	cont "hast."
	para "Sprich mit meinen"
	line "Kollegen am"
	para "Schalter um einzu-"
	line "checken."
	done

SoutherlyAirport_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $7, $7, 6, SOUTHERLY_CITY
	warp_def $7, $8, 6, SOUTHERLY_CITY
	warp_def $0, $7, 1, SOUTHERLY_MAGNET_TRAIN
	warp_def $0, $8, 2, SOUTHERLY_MAGNET_TRAIN

	;xy triggers
	db 0

	;signposts
	db 3
	signpost  0,  9, SIGNPOST_JUMPSTD, magnettrainsign
	signpost  2,  4, SIGNPOST_LOAD, SoutherlyCityAirportCheckInSign
	signpost  2, 14, SIGNPOST_LOAD, SoutherlyCityAirportWarningSign

	;people-events
	db 5
	person_event SPRITE_YOUNGSTER,  6, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC1, -1
	person_event SPRITE_GRAMPS,  4, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC2, -1
	person_event SPRITE_GENTLEMAN,  4,  7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC3, -1
	person_event SPRITE_OFFICER,  6,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SoutherlyAirportPilot, -1
	person_event SPRITE_OFFICER,  3,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SoutherlyCityAirportGuard, -1