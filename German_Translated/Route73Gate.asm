Route73Gate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route73Gate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 1, ROUTE_73
	warp_def 0, 5, 2, ROUTE_73
	warp_def 7, 4, 6, OXALIS_CITY
	warp_def 7, 5, 6, OXALIS_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
