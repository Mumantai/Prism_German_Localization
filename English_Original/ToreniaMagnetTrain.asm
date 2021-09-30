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
	ctxt "I'm stuck in Naljo."

	para "Botan City is"
	line "quarantined and"
	para "I don't have a"
	line "pass to get to"
	cont "Johto or Kanto."
	done

.botan_unquarantined
	ctxt "Botan City isn't"
	line "quarantined"
	cont "anymore."

	para "I should head"
	line "back, but<...> I think"
	para "I'm getting used to"
	line "this place."
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
