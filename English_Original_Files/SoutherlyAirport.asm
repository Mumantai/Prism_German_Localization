SoutherlyAirport_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyAirportNPC1:
	ctxt "Being on a plane"
	line "is exciting!"

	para "There's all sorts"
	line "of #mon around"
	cont "the world."

	para "And I want to see"
	line "as many as I can!"
	done

SoutherlyAirportNPC2:
	ctxt "Hello, young one!"

	para "I've been every-"
	line "where!"

	para "Name a region and"
	line "I've been there!"
	done

SoutherlyAirportNPC3:
	ctxt "Once they rebuild"
	line "the Goldenrod"
	para "Airport, we'll be"
	line "able to fly all"
	cont "the way to Johto!"

	para "Personally, I hate"
	line "taking the train."

	para "It has no sense of"
	line "class!"
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
	ctxt "Hello, hello!"

	para "If you ever want"
	line "to fly somewhere,"
	para "come back with a"
	line "plane ticket."

	para "We'll take you"
	line "anywhere in no"
	cont "time!"
	done

.first_time_mystery_ticket_text
	ctxt "Wait a second."

	para "<...>"

	para "Am I reading this"
	line "right?"

	para "<...>"

	para "Nope, it's genuine."

	para "This is indeed a"
	line "ticket to the"
	cont "Mystery Zone."

	para "The Mystery Zone"
	line "is home to some of"
	para "the best #mon"
	line "Trainers in the"
	cont "world!"

	para "You must be a very"
	line "skilled #mon"
	cont "Trainer!"

	para "Well, I can take"
	line "you there right"
	cont "now."

	para "Want to go?"
	done

.want_to_go_text
	ctxt "Want to fly to the"
	line "Mystery Zone?"
	done

.leaving_text
	ctxt "Alright, let's get"
	line "going!"
	sdone

.declined_text
	ctxt "That's a shame."

	para "I don't get to take"
	line "many people to the"
	cont "Mystery Zone!"
	done

SoutherlyCityAirportCheckInSign:
	ctxt "Airport"
	nl   ""
	next "Check-in and"
	next "boarding gate"
	done

SoutherlyCityAirportWarningSign:
	ctxt "Keep your bags"
	next "with you at all"
	next "times. Report any"
	next "suspicious action"
	next "immediately!"
	done

SoutherlyCityAirportGuard:
	ctxt "Sorry, I can't let"
	line "you pass without"
	cont "checking in first."

	para "Please speak to my"
	line "colleague at the"
	para "desk to check in"
	line "and board your"
	cont "flight."
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
