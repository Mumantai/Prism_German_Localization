OlcanDockExit_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_OLCAN_ISLE
	return

OlcanDockExitShoelaces:
	ctxt "Ich muss meine"
	line "Schnürsenkel genau"
	para "hier, an diesem"
	line "Ort, zu binden."
	para "Irgendwas sagt"
	line "mir, dass sonst"
	para "etwas schlimmes"
	line "passieren würde."
	done

OlcanDockExit_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def  7,  4, 3, OLCAN_ISLE
	warp_def  7,  5, 4, OLCAN_ISLE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_LASS,  2,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OlcanDockExitShoelaces, -1