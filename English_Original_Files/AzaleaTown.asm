AzaleaTown_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_AZALEA_TOWN
	return

AzaleaTownKurtSign:
	ctxt "Kurt's House"
	done

AzaleaTownGymSign:
	ctxt "#mon Gym"
	next "Leader: Bugsy"
	nl   ""
	next "The walking Bug"
	next "#mon Encyclo-"
	next "pedia"
	done

AzaleaTownTownSign:
	ctxt "Where People and"
	next "#mon Live in"
	next "Happy Harmony"
	done

AzaleaTownKilnSign:
	ctxt "Charcoal Kiln"
	done

AzaleaTownRoute33Sign:
	ctxt "<RIGHT> Route 33"
	next "  Closed due to"
	next "  landslide."
	done

AzaleaTownIlexForestSign:
	ctxt "<LEFT> Ilex Forest"
	done

AzaleaTownNPC1:
	ctxt "The Slowpoke are"
	line "goofing off"
	cont "somewhere."

	para "But where?"
	done

AzaleaTownNPC2:
	ctxt "There was a quake"
	line "close to here a"
	para "couple of years"
	line "ago."

	para "Our town got a"
	line "bit ruffled, but"
	para "Goldenrod wasn't"
	line "so lucky."

	para "Thankfully no one"
	line "was hurt."
	done

AzaleaTownNPC3:
	ctxt "Ilex Forest has a"
	line "shrine that wards"
	para "off evil spirits"
	line "and is a symbol"
	cont "of good luck."
	done

AzaleaTown_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def $a, $4, 3, ILEX_FOREST_GATE
	warp_def $b, $4, 4, ILEX_FOREST_GATE
	warp_def $5, $9, 1, AZALEA_KURT
	warp_def $f, $a, 1, AZALEA_GYM
	warp_def $9, $f, 1, AZALEA_POKECENTER
	warp_def $5, $15, 1, AZALEA_MART
	warp_def $d, $15, 1, AZALEA_CHARCOAL

.CoordEvents
	db 0

.BGEvents
	db 6
	signpost 9, 10, SIGNPOST_LOAD, AzaleaTownKurtSign
	signpost 15, 14, SIGNPOST_LOAD, AzaleaTownGymSign
	signpost 9, 19, SIGNPOST_LOAD, AzaleaTownTownSign
	signpost 13, 19, SIGNPOST_LOAD, AzaleaTownKilnSign
	signpost 7, 29, SIGNPOST_LOAD, AzaleaTownRoute33Sign
	signpost 9, 5, SIGNPOST_LOAD, AzaleaTownIlexForestSign

.ObjectEvents
	db 4
	person_event SPRITE_FRUIT_TREE, 2, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_FRUITTREE, 0, GREY_APRICORN_TREE_1, -1
	person_event SPRITE_GRAMPS, 9, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC1, -1
	person_event SPRITE_TEACHER, 12, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC2, -1
	person_event SPRITE_YOUNGSTER, 16, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC3, -1
