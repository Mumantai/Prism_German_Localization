ApartmentsF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ApartmentsF1_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $13, $8, 2, SPURGE_CITY
	warp_def $13, $9, 2, SPURGE_CITY
	warp_def $2, $3, 1, APARTMENTS_F2
	warp_def $2, $11, 2, APARTMENTS_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
