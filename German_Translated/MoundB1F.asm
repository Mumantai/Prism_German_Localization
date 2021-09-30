MoundB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MoundB1F_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $5, $6, 7, MOUND_F1
	warp_def $10, $18, 1, MOUND_B2F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 11, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MOON_STONE, EVENT_MOUND_B1F_ITEM_MOON_STONE
