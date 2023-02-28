ToreniaMagnetTrain_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ToreniaMagnetTrainEmployee:
	farjump MagnetTrainScript

ToreniaMagnetTrainNPC:
	checkevent EVENT_ROUTE_59_TRAINER_1
	sif false
		jumptextfaceplayer .stuck
	jumptextfaceplayer .botan_unquarantined

.stuck
	ctxt "Ich stecke in"
	line "Naljo fest."

	para "Botania City ist"
	line "unter Quarantäne"
	para "und Ich habe"
	line "keinen Pass um"
	cont "nach Johto oder"
	cont "Kanto zu kommen."
	done

.botan_unquarantined
	ctxt "Botania City ist"
	line "nicht mehr unter"
	cont "Quarantäne."

	para "Ich sollte zurück"
	line "gehen, aber<...> Ich"
	para "glaube Ich gewöhne"
	line "mich an diesen"
	cont "Ort."
	done

ToreniaMagnetTrain_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $11, $8, 4, TORENIA_CITY
	warp_def $11, $9, 4, TORENIA_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ToreniaMagnetTrainEmployee, -1
	person_event SPRITE_GENTLEMAN, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ToreniaMagnetTrainNPC, -1
