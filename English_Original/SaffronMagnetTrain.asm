SaffronMagnetTrain_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaffronMagnetTrainEmployee:
	farjump MagnetTrainScript

SaffronMagnetTrainNPC:
	ctxt "Just riding on"
	line "the train is a"
	cont "nice way to relax."
	done

SaffronMagnetTrain_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $11, $8, 6, SAFFRON_CITY
	warp_def $11, $9, 6, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronMagnetTrainEmployee, -1
	person_event SPRITE_ROCKER, 14, 11, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SaffronMagnetTrainNPC, -1
