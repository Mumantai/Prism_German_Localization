ToreniaMagnetTrain_MapScriptHeader:
 ;trigger count
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
	ctxt "Weil Botania City"
	line "unter Quarantäne"
	para "steht und ich"
	line "nicht die richtige"
	para "Fahrkarte habe, um"
	line "nach Kanto oder"
	para "Johto zu kommen,"
	line "stecke ich jetzt"
	cont "in Naljo fest."
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

ToreniaMagnetTrainBranchLineEmployee:
	opentext
	checkevent EVENT_REGISTERED_SOUTHERLY
	sif false
		jumptext .branch_line_not_open
	writetext .want_to_travel
	yesorno
	closetext
	sif true, then
		special FadeOutPalettes
		playwaitsfx SFX_WING_ATTACK
		playwaitsfx SFX_TRAIN_ARRIVED
		warp SOUTHERLY_MAGNET_TRAIN, 9, 10
	sendif
	end

.branch_line_not_open
	ctxt "Wer erweitern"
	line "unser Schienennetz"
	cont "nach Norden."
	para "Wir sind aber noch"
	line "nicht fertig."
	para "Komm bitte später"
	line "zurück."
	done

.want_to_travel
	ctxt "Willkommen!"
	para "Möchten Sie mit"
	line "unserer neuen"
	para "Erweiterungslinie"
	line "nach Tunod fahren?"
	sdone

ToreniaMagnetTrain_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $11, $8, 4, TORENIA_CITY
	warp_def $11, $9, 5, TORENIA_CITY

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 14,  2, SIGNPOST_JUMPSTD, magnettrainsign
	signpost 14,  3, SIGNPOST_JUMPSTD, magnettrainsign
	signpost 14,  4, SIGNPOST_JUMPSTD, magnettrainsign
	signpost 14,  5, SIGNPOST_JUMPSTD, magnettrainsign

	;people-events
	db 3
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ToreniaMagnetTrainEmployee, -1
	person_event SPRITE_GENTLEMAN, 14, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ToreniaMagnetTrainNPC, -1
	person_event SPRITE_OFFICER, 13, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ToreniaMagnetTrainBranchLineEmployee, -1