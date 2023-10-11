GoldenrodUndergroundEntryB_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodUndergroundEntryBNPC:
	ctxt "Those Trainers"
	line "down there can be"
	cont "unruly."
	done

GoldenrodUndergroundEntryB_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $9, $4, 14, GOLDENROD_CITY
	warp_def $9, $5, 14, GOLDENROD_CITY
	warp_def $5, $5, 2, GOLDENROD_UNDERGROUND

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_COOLTRAINER_F, 7, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, GoldenrodUndergroundEntryBNPC, -1
