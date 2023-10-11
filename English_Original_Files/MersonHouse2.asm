MersonHouse2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonHouse2NPC:
	ctxt "Who said you"
	line "could come in?"

	para "SCRAM!"
	done

MersonHouse2_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 6, MERSON_CITY
	warp_def $7, $3, 6, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MersonHouse2NPC, -1
