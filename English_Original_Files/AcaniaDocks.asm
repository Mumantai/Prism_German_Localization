AcaniaDocks_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, AcaniaDocks_SetFlyFlag

AcaniaDocks_SetFlyFlag:
	setflag ENGINE_FLYPOINT_ACANIA_DOCKS
	return

AcaniaDocksTownSign:
	ctxt "Dock byway to the"
	next "world"
	done

AcaniaDocksLighthouseSign:
	ctxt "Fire"
	next "Lighthouse"
	done

AcaniaDocksGymSign:
	ctxt "Acania Gym"
	next "Leader: Ayaka"
	nl   ""
	next "The toxic"
	next "trainer!"
	done

AcaniaDocksNPC1:
	ctxt "My Eevee evolved"
	line "into a Glaceon"
	para "while training"
	line "it hard in the"
	cont "Clathrite Tunnel."

	para "However, my wife's"
	line "Eevee evolved into"
	cont "a Leafeon instead!"

	para "I'm not sure why,"
	line "but the theory I"
	para "have is that we"
	line "were in vastly"
	cont "different areas."
	done

AcaniaDocksNPC2:
	ctxt "Do you see the"
	line "lighthouse there?"

	para "The Guardians dis-"
	line "allowed building"
	cont "it, way back then."

	para "Who knows where"
	line "they are now, or"
	para "if they're even"
	line "still alive<...>"
	done

AcaniaDocksNPC3:
	ctxt "It's crazy!"

	para "This used to be"
	line "nothing but sea!"

	para "Who knows where"
	line "they'll build the"
	cont "next Naljo town?"
	done

AcaniaDocksNPC4:
	faceplayer
	checkevent EVENT_ACANIA_TM_44
	sif false, then
		opentext
		writetext .giveTM
		givetm TM_REST + RECEIVED_TM
		setevent EVENT_ACANIA_TM_44
	sendif
	jumptext .describeTM

.giveTM
	ctxt "The calm sea is"
	line "so relaxing."

	para "I can fall asleep"
	line "just standing here"
	cont "and staring at it."

	para "Your #mon can"
	line "fall asleep too,"
	cont "with this."
	sdone

.describeTM
	ctxt "TM44 is Rest."

	para "Your #mon will"
	line "fall asleep and"
	para "recover all of"
	line "its health!"
	done

AcaniaDocks_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def 15, 7, 1, ACANIA_POKECENTER
	warp_def 9, 3, 1, ACANIA_MART
	warp_def 19, 7, 1, ROUTE_81_NORTHGATE
	warp_def 19, 8, 2, ROUTE_81_NORTHGATE
	warp_def 9, 16, 1, ACANIA_GYM
	warp_def 5, 28, 1, ACANIA_LIGHTHOUSE_F1
	warp_def 15, 13, 1, ACANIA_HOUSE
	warp_def 11, 23, 1, ACANIA_TM63

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 8, 10, SIGNPOST_LOAD, AcaniaDocksTownSign
	signpost 10, 30, SIGNPOST_LOAD, AcaniaDocksLighthouseSign
	signpost 10, 18, SIGNPOST_LOAD, AcaniaDocksGymSign

.ObjectEvents
	db 4
	person_event SPRITE_POKEFAN_M, 16, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AcaniaDocksNPC1, EVENT_ACANIA_DOCKS_NPC_1
	person_event SPRITE_GRAMPS, 14, 30, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AcaniaDocksNPC2, -1
	person_event SPRITE_FISHER, 13, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8, PERSONTYPE_TEXTFP, 0, AcaniaDocksNPC3, EVENT_ACANIA_DOCKS_NPC_3
	person_event SPRITE_LASS, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AcaniaDocksNPC4, -1
