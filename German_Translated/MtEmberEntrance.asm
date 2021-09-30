MtEmberEntrance_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MtEmberEntrance_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $2, $2, 3, EMBER_BROOK
	warp_def $f, $11, 1, MT_EMBER_ROOM_1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
