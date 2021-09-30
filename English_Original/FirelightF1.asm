FirelightF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

FirelightF1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $21, $19, 3, ROUTE_85
	warp_def $d, $15, 3, FIRELIGHT_ROOMS
	warp_def $9, $25, 1, FIRELIGHT_ITEMROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_BOULDER, 6, 20, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_POKE_BALL, 6, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CALCIUM, EVENT_FIRELIGHT_F1_ITEM_CALCIUM
