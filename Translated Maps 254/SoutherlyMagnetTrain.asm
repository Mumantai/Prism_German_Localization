SoutherlyMagnetTrain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyMagnetTrainEmployee:
	opentext
	writetext .greeting
	checkevent EVENT_REGISTERED_SOUTHERLY
	sif false, then
		writetext .branch_line_open
		setevent EVENT_REGISTERED_SOUTHERLY
	sendif
	writetext .want_to_travel
	yesorno
	closetext
	sif false
		end
	special FadeOutPalettes
	playwaitsfx SFX_WING_ATTACK
	playwaitsfx SFX_TRAIN_ARRIVED
	warp TORENIA_MAGNET_TRAIN, 1, 14
	end

.greeting
	ctxt "Willkommen!"
	sdone

.branch_line_open
	ctxt "Wir haben gerade"
	line "unsere neue"
	para "Erweiterung"
	line "eröffnet."
	para "Du kannst jetzt im"
	line "Handumdrehen"
	para "zurück nach Naljo"
	line "reisen!"
	para "Bitte beachte,"
	line "dass du in Torenia"
	para "umsteigen musst,"
	line "um andere Ziele zu"
	cont "erreichen."
	sdone

.want_to_travel
	ctxt "Möchtest du mit"
	line "unserer neuen"
	para "Erweiterungslinie"
	line "nach Naljo fahren?"
	sdone

SoutherlyMagnetTrainNPC:
	ctxt "Unsere Regierung"
	line "hat eine"
	para "Verbindung zum"
	line "Magnetbahn-Netz"
	para "für Tunod"
	line "ausgehandelt."
	para "Der Flughafen war"
	line "nicht allzu"
	para "glücklich darüber,"
	line "das Gebäude mit"
	para "einem Konkurrenten"
	line "zu teilen."
	para "Ich?"
	para "Ich denke, es"
	line "zeigt, wie"
	para "engagiert wir"
	line "sind, unsere"
	para "Umwelt zu"
	line "schützen."
	para "Im Gegensatz zu"
	line "Naljo respektieren"
	para "wir die Natur,"
	line "anstatt sie"
	cont "niederzureißen."
	done

SoutherlyMagnetTrain_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $11, $8, 3, SOUTHERLY_AIRPORT
	warp_def $11, $9, 4, SOUTHERLY_AIRPORT

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SoutherlyMagnetTrainEmployee, -1
	person_event SPRITE_PICNICKER, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyMagnetTrainNPC, -1