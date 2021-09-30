BotanHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

BotanHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 1, BOTAN_CITY
	warp_def $7, $3, 1, BOTAN_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
