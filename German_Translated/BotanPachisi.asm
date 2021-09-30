BotanPachisi_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

BotanPachisiGameAttendant:
	farjump PachisiGameBotan

BotanPachisi_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $2b, $e, 4, BOTAN_CITY
	warp_def $2b, $f, 4, BOTAN_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 38, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BotanPachisiGameAttendant, -1
