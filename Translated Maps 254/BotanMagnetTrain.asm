BotanMagnetTrain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

BotanMagnetTrainEmployee:
	farjump MagnetTrainScript

BotanMagnetTrainNPC:
	ctxt "Hier war mal eine"
	line "Höhle, aber sie"
	para "wurde abgerissen,"
	line "um Platz für den"
	para "Magnetzug zu"
	line "machen."
	done

BotanMagnetTrain_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $8, 7, BOTAN_CITY
	warp_def $11, $9, 8, BOTAN_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BotanMagnetTrainEmployee, -1
	person_event SPRITE_GENTLEMAN, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanMagnetTrainNPC, -1