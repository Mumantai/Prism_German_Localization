MersonCaveB2F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MersonCaveB2F_GoldToken:
	dw EVENT_MERSON_CAVE_B2F_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

MersonCaveB2F_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def $11, $9, 1, MERSON_CAVE_B3F
	warp_def $3, $19, 1, GRAVEL_TOWN
	warp_def $9, $19, 2, SEASHORE_CITY
	warp_def $e, $18, 1, MERSON_CAVE_B1F
	warp_def $18, $c, 3, MERSON_CAVE_B1F

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 12, 20, SIGNPOST_ITEM, MersonCaveB2F_GoldToken

.ObjectEvents
	db 0
