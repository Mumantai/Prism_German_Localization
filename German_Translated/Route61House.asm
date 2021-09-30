Route61House_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0
	
Route61House_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 4, ROUTE_61
	warp_def $7, $3, 4, ROUTE_61

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_ROCKER, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_JUMPSTD, 0, trade, 4, -1
