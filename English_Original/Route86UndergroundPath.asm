Route86UndergroundPath_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route86UndergroundPath_MapEventHeader:: db 0, 0

.Warps: db 8
	warp_def 7, 4, 5, ROUTE_86
	warp_def 7, 5, 5, ROUTE_86
	warp_def 5, 5, 4, ROUTE_86_UNDERGROUND_PATH
	warp_def 14, 5, 3, ROUTE_86_UNDERGROUND_PATH
	warp_def 36, 5, 6, ROUTE_86_UNDERGROUND_PATH
	warp_def 49, 5, 5, ROUTE_86_UNDERGROUND_PATH
	warp_def 51, 4, 1, FARAWAY_ISLAND_OUTSIDE
	warp_def 51, 5, 1, FARAWAY_ISLAND_OUTSIDE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
