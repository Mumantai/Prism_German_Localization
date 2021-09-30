CastroForestGateSouth_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CastroForestGateSouth_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $5, 4, CASTRO_FOREST
	warp_def $7, $4, 4, ROUTE_57
	warp_def $7, $5, 4, ROUTE_57

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
