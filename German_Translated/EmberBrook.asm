EmberBrook_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

EmberBrook_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $8, $6, 3, EMBER_BROOK_GATE
	warp_def $9, $6, 4, EMBER_BROOK_GATE
	warp_def $7, $31, 1, MT_EMBER_ENTRANCE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
