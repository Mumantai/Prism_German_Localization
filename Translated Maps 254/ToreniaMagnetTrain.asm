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
	ctxt "Ich stecke in der"
	line "Naljo-Region fest."
	para "Jeder kann zwar"
	line "ohne Fahrschein in"
	para "die Rijon-Region"
	line "fahren, aber"
	para "Botania City ist"
	line "aktuell unter"
	para "Quarantäne,"
	line "weshalb man die"
	para "restliche"
	line "Rijon-Region nicht"
	cont "besuchen kann."
	para "Für die Kanto-"
	line "oder Johto-Region"
	para "fehlt mir leider"
	line "der Fahrschein."
	done

.botan_unquarantined
	ctxt "Botania City ist"
	line "nicht mehr unter"
	cont "Quarantäne."
	para "Ich sollte zurück"
	line "gehen, aber <...>"
	para "Ich glaube, ich"
	line "gewöhne mich an"
	cont "diesen Ort."
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
	ctxt "Wir erweitern"
	line "unser Netzwerk"
	cont "nach Norden."
	para "Es ist noch nicht"
	line "fertig."
	para "Bitte kommen Sie"
	line "zu einem späteren"
	cont "Zeitpunkt zurück."
	done

.want_to_travel
	ctxt "Willkommen!"
	para "Möchten Sie mit"
	line "unserer neuen"
	para "Erweiterungslinie"
	line "in die Tunod"
	cont "Region fahren?"
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