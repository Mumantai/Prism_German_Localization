MersonHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MersonHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 4, SEASHORE_CITY
	warp_def $7, $3, 4, SEASHORE_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
