GoldenrodMagnetTrain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodMagnetTrainEmployee:
	checkitem MAGNET_PASS
	sif false
		jumptext .no_pass_text
	farjump MagnetTrainScript

.no_pass_text
	ctxt "Hello."

	para "Unfortunately, you"
	line "can't use this"
	para "station without a"
	line "Magnet Pass."

	para "Come back when you"
	line "get one."
	done

GoldenrodMagnetTrainPresident:
	ctxt "I'm the President"
	line "of this railroad."

	para "This train is"
	line "faster than any"
	para "#mon, and it"
	line "will take you to"
	para "Rijon or Naljo"
	line "in a flash!"

	para "If you have a"
	line "special pass, it"
	para "can also take you"
	line "to Kanto."

	para "We have plans to"
	line "expand to other"
	para "regions in the"
	line "future."
	done

GoldenrodMagnetTrain_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $8, 5, GOLDENROD_CITY
	warp_def $11, $9, 6, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodMagnetTrainEmployee, -1
	person_event SPRITE_GENTLEMAN, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodMagnetTrainPresident, -1
