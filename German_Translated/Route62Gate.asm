Route62Gate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route62Gate_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 3, 0, 1, ROUTE_62
	warp_def 3, 19, 6, CASTRO_FOREST
	warp_def 1, 8, 6, CASTRO_FOREST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
