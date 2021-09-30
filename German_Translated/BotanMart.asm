BotanMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

BotanMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 3, BOTAN_CITY
	warp_def $7, $7, 3, BOTAN_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, BOTAN_STANDARD_MART, -1
