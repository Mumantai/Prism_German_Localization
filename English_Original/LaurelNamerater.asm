LaurelNamerater_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

LaurelNameraterNPC:
	faceplayer
	opentext
	special NameRater
	endtext

LaurelNamerater_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 11, LAUREL_CITY
	warp_def $7, $3, 11, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_GENTLEMAN, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelNameraterNPC, -1
