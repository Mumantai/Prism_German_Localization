CastroGate_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CastroGate_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $0, $5, 1, CASTRO_FOREST
	warp_def $7, $4, 4, CASTRO_VALLEY
	warp_def $7, $5, 4, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
