OxalisCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_OXALIS_CITY
	return

OxalisCitySalonSign:
	ctxt "Get some"
	next "clothes that"
	next "are just right"
	next "for you!"
	done

OxalisCityCitySign:
	ctxt "The city for"
	next "young, growing"
	next "trainers"
	done

OxalisCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Josiah"
	next ""
	next "Too hot to"
	next "handle!"
	done

OxalisCityHappinessRaterSign:
	ctxt "Find out how"
	next "happy your"
	next "#mon"
	next "really are"
	done

OxalisCityTrainerHallSign:
	ctxt "Rookie trainer"
	next "hall."
	next "Just the place"
	next "for beginners!"
	done

OxalisCityIslandSign:
	signpostheader 6
	done

OxalisCityNPC1:
	ctxt "There's some real"
	line "arrogant people"
	cont "this day and age."

	para "Josiah is our"
	line "local Gym Leader,"
	para "and he can be"
	line "described with one"
	cont "single word."

	para "<...>"

	para "Idiot."
	done

OxalisCityNPC2:
	ctxt "See my pink dress?"

	para "Rad, isn't it!?"

	para "I got it made for"
	line "me from our local"
	cont "Salon."

	para "It's the most"
	line "stylish Salon in"
	cont "all of Naljo!"

	para "They even do your"
	line "makeup!"

	para "Give it a try!"
	done

OxalisCityNPC3:
	ctxt "There's a woman"
	line "living here."

	para "She can check how"
	line "happy your #mon"
	cont "are."
	done

OxalisCityNPC4:
	ctxt "Hmm<...>"

	para "This town sure has"
	line "grown<...>"
	done

OxalisCityNPC5:
	ctxt "There has to be"
	line "more out there"
	para "than what we're"
	line "told about<...>"
	done

OxalisCityNPC6:
	ctxt "This house has two"
	line "underground"
	cont "passageways."

	para "It was built to"
	line "connect Oxalis"
	para "with the mountains"
	line "on Route 73."

	para "Lately, Trainers"
	line "have started to"
	cont "gather inside."

	para "One guy even gives"
	line "away free #mon"
	cont "from time to time!"
	done

OxalisCityNPC7:
	ctxt "I tell you, this"
	line "place<...>"

	para "Like, if you tryna"
	line "be a nice person"
	cont "<'>round here<...>"

	para "Y'know, like you"
	line "say <``>hello!<''><...>"
	para "<...>or <``>good"
	line "morning!<''><...>"
	para "<...>and it just blows"
	line "up in your face."

	para "<``>Leave me alone!<''>"
	line "<``>Get lost, scrub!<''>"
	cont "<``>Don't touch me!<''>"

	para "I know peeps from"
	line "Johto and Rijon."

	para "Way more chill."

	para "You say <``>yo!<''> and"
	line "they reply <``>ey!<''>"

	para "So, why are Naljo"
	line "people so stuck up"
	cont "all the time?"
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

.BGEvents: db 7
	signpost 9, 15, SIGNPOST_LOAD, OxalisCitySalonSign
	signpost 25, 23, SIGNPOST_LOAD, OxalisCityCitySign
	signpost 17, 21, SIGNPOST_LOAD, OxalisCityGymSign
	signpost 23, 35, SIGNPOST_LOAD, OxalisCityHappinessRaterSign
	signpost 6, 30, SIGNPOST_LOAD, OxalisCityTrainerHallSign
	signpost 7, 19, SIGNPOST_JUMPSTD, qrcode, QR_OXALIS
	signpost 29, 23, SIGNPOST_LOAD, OxalisCityIslandSign

.ObjectEvents: db 7
	person_event SPRITE_GRAMPS, 18, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC1, -1
	person_event SPRITE_TEACHER, 10, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, OxalisCityNPC2, -1
	person_event SPRITE_LASS, 24, 32, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC3, -1
	person_event SPRITE_GRAMPS, 28, 16, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 22, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 6, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC6, -1
	person_event SPRITE_ROCKER, 13, 32, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisCityNPC7, -1
