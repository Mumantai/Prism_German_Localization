AzaleaTown_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_AZALEA_TOWN
	return

AzaleaTownKurtSign:
	ctxt "Kurt's Hütte"
	done

AzaleaTownGymSign:
	ctxt "#mon Arena"
	next "Leiter: Kai"
	nl   ""
	next "Die lebende"
	next "#mon Enzyklo-"
	next "pädie"
	done

AzaleaTownTownSign:
	ctxt "Wo Trainer und"
	next "#mon in voller"
	next "Harmonie leben."
	done

AzaleaTownKilnSign:
	ctxt "Holzkohle-Ofen"
	done

AzaleaTownRoute33Sign:
	ctxt "<RIGHT> Route 33"
	next "  Geschlossen wg."
	next "  Erdrutsch."
	done

AzaleaTownIlexForestSign:
	ctxt "<LEFT> Steineichenwald"
	done

AzaleaTownNPC1:
	ctxt "Die Flegmons"
	line "faulenzen irgendwo"
	cont "rum."

	para "Aber wo nur?"
	done

AzaleaTownNPC2:
	ctxt "Es gab vor einpaar"
	line "Jahren einen Beben"
	cont "in der Nähe."

	para "Unsere Stadt hat"
	line "es nur gestriffen,"
	para "aber Dukkatia"
	line "City hat es"
	cont "hart erwischt."

	para "Wenigstens gab es"
	line "keine verletzten."
	done

AzaleaTownNPC3:
	ctxt "Im Steineichenwald"
	line "gibt es einen"
	para "Schrein der böse"
	line "Geister vertreibt"
	cont "und Glück bringt."
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
	db 8
	signpost 9, 10, SIGNPOST_LOAD, AzaleaTownKurtSign
	signpost 15, 14, SIGNPOST_LOAD, AzaleaTownGymSign
	signpost 9, 19, SIGNPOST_LOAD, AzaleaTownTownSign
	signpost 13, 19, SIGNPOST_LOAD, AzaleaTownKilnSign
	signpost 7, 29, SIGNPOST_LOAD, AzaleaTownRoute33Sign
	signpost 9, 16, SIGNPOST_JUMPSTD, pokecentersign
	signpost 5, 22, SIGNPOST_JUMPSTD, martsign
	signpost 9, 5, SIGNPOST_LOAD, AzaleaTownIlexForestSign

.ObjectEvents
	db 4
	person_event SPRITE_FRUIT_TREE, 2, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_FRUITTREE, 0, 11, -1
	person_event SPRITE_GRAMPS, 9, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC1, -1
	person_event SPRITE_TEACHER, 12, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC2, -1
	person_event SPRITE_YOUNGSTER, 16, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, AzaleaTownNPC3, -1
