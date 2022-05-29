SoutherlyAirport_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SoutherlyAirportNPC1:
	ctxt "Es gibt so viele"
	line "#mon auf der"
	cont "Welt."

	para "Ich will so viele"
	line "wie möglich sehen!"

	done

SoutherlyAirportNPC2:
	ctxt "Ich war schon"
	line "überall!"

	para "Nenne mir eine"
	line "Region und ich war"
	cont "schon dort!"

	done

SoutherlyAirportNPC3:
	ctxt "Wenn der Flughafen"
	line "in Dukatia City"
	para "wieder steht,"
	line "können wir nach"
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
	playsound SFX_RAZOR_WIND
	wait 10
	warp MYSTERY_ZONE_AIRPORT, 9, 11
	end

.introduction_text
	ctxt "Hallo hallo!"

	para "Falls du jemals"
	line "irgendwo hin-"
	para "fliegen möchtest,"
	line "komm mit einem"
	cont "Ticket wieder."

	para "Wir bringen dich"
	line "dann überall hin!"

	done

.first_time_mystery_ticket_text
	ctxt "Moment mal!"

	para "<...>"
	line "Lese ich das"
	cont "wirklich?"

	para "<...>"
	line "Ja, tatsächlich!"

	para "Das ist wirklich"
	line "ein Ticket zur"
	cont "Geheimniszone!"

	para "In der"
	line "Geheimniszone"
	para "warten die besten"
	line "Trainer der Welt"
	cont "auf dich!"

	para "Du musst ja echt"
	line "was drauf haben!"

	para "Ich kann dich"
	line "sofort dorthin"
	cont "bringen."

	para "Willst du los?"

	done

.want_to_go_text
	ctxt "Willst du zur"
	line "Geheimniszone?"

	done

.leaving_text
	ctxt "Okay!"

	line "Los geht's!"

	sdone

.declined_text
	ctxt "Schade."

	para "Ich bring selten"
	line "jemanden in die"
	cont "Geheimniszone."

	done 

SoutherlyAirport_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $7, $7, 6, SOUTHERLY_CITY
	warp_def $7, $8, 6, SOUTHERLY_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_YOUNGSTER, 6, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC1, -1
	person_event SPRITE_GRAMPS, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC2, -1
	person_event SPRITE_GENTLEMAN, 3, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyAirportNPC3, -1
	person_event SPRITE_OFFICER, 2, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SoutherlyAirportPilot, -1
	person_event SPRITE_OFFICER, 2, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SoutherlyAirportPilot, -1
