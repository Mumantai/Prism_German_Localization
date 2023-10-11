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
	ctxt "I'm stuck in Naljo."

	para "Botan City is"
	line "quarantined and I"
	para "don't have a pass"
	line "to get to Johto or"
	cont "Kanto."
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
	ctxt "We are expanding"
	line "our network to the"
	cont "north."

	para "It's not ready yet."

	para "Please come back"
	line "at a later time."
	done

.want_to_travel
	ctxt "Greetings!"

	para "Would you like to"
	line "travel on our new"
	para "expansion line to"
	line "Tunod?"
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
