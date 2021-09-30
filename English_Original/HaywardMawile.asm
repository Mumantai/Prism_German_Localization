HaywardMawile_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HaywardMawile_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 4, HAYWARD_CITY
	warp_def $7, $3, 4, HAYWARD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_DAISY, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, trade, 3, -1
