AcquaLowTide_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcquaMinesLibabeelLow:
	farjump AcquaMinesLibabeel

AcquaLowTide_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def 3, 15, 1, ACQUA_PHLOXENTRANCE
	warp_def 17, 23, 4, ACQUA_ROOM
	warp_def 17, 13, 3, ACQUA_ROOM
	warp_def 3, 19, 1, ACQUA_LABBASEMENTPATH

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_LIBABEEL, 11, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcquaMinesLibabeelLow, EVENT_LIBABEEL
	person_event SPRITE_POKE_BALL, 10, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_ACQUA_LOWTIDE_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 13, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BLUE_FLUTE, EVENT_ACQUA_LOWTIDE_ITEM_BLUE_FLUTE
