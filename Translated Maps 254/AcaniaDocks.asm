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
	ctxt "Hafen in die"
	next "Welt!"
	done

AcaniaDocksLighthouseSign:
	ctxt "Feuer-Leuchtturm"
	done

AcaniaDocksGymSign:
	ctxt "Akania Arena"
	next "Leiterin: Ayaka"
	nl	 ""
	next "Die giftige"
	next "Trainerin!"
	done

AcaniaDocksNPC1:
	ctxt "Mein Evoli ent-"
	line "wickelte sich beim"
	para "harten Training im"
	line "Klathrattunnel zu"
	cont "Glaziola."
	para "Jedoch entwickelte"
	line "sich das Evoli"
	cont "meiner Frau in ein"
	cont "Folipurba <...>"
	para "Ich bin mir nicht"
	line "sicher, aber etwas"
	para "sagt mir, dass es"
	line "an der unter-"
	cont "schiedlichen"
	cont "Umgebung lag."
	done

AcaniaDocksNPC2:
	ctxt "Siehst du den"
	line "Leuchtturm da?"
	para "Damals verboten"
	line "die Wächter den"
	cont "Bau des Turms."
	para "Ich frage mich, wo"
	line "die Wächter sind"
	para "oder ob sie über-"
	line "haupt noch leben <...>"
	done

AcaniaDocksNPC3:
	ctxt "Verrückt!"
	para "Hier war früher"
	line "nichts als Meer!"
	para "Wo wohl die"
	line "nächste Stadt in"
	cont "Naljo erbaut wird?"
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
	ctxt "Die stille See"
	line "ist so beruhigend."
	para "Bei diesem An-"
	line "blick könnte ich"
	para "sofort ein-"
	line "schlafen."
	para "So schlafen selbst"
	line "deine #mon ein!"
	sdone

.describeTM
	ctxt "TM44 enthält"
	line "Erholung."
	para "Dein #mon"
	line "schläft ein und"
	para "stellt alle KP"
	line "wieder her!"
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