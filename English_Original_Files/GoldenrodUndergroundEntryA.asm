GoldenrodUndergroundEntryA_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodUndergroundEntryANPC:
	ctxt "Be careful"
	line "downstairs."
	done

GoldenrodUndergroundEntryA_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $9, $4, 13, GOLDENROD_CITY
	warp_def $9, $5, 13, GOLDENROD_CITY
	warp_def $5, $5, 1, GOLDENROD_UNDERGROUND

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SUPER_NERD, 7, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodUndergroundEntryANPC, -1
