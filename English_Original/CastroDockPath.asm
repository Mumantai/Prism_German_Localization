CastroDockPath_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CastroDockPath_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def $2, $5, 3, CASTRO_DOCK_PATH
	warp_def $2a, $5, 1, CASTRO_DOCK
	warp_def $37, $5, 1, CASTRO_DOCK_PATH
	warp_def $32, $4, 6, CASTRO_VALLEY
	warp_def $32, $5, 7, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
