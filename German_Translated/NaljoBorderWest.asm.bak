NaljoBorderWest_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

NaljoBorderWestNPC1:
	ctxt "Viele Trainer"
	line "versuchen, sich"
	para "hier reinzu-"
	line "schleichen <...>"

	para "Daher mussten wir"
	line "die Sicherheits-"
	para "maßnahmen hier"
	line "deutlich erhöhen."
	done

NaljoBorderWestNPC2:
	ctxt "Nur die Besten der"
	line "Besten haben die"
	para "Chance, sich in der"
	line "Rijon-Liga zu"
	cont "behaupten!"

	para "Nimm es nicht als"
	line "selbstredend hin,"
	cont "dass du hier bist."
	done

NaljoBorderWestBadgeCheck:
	checkevent EVENT_BADGE_CHECKER
	sif true
		end
	opentext
	writetext .initial_call_text
	spriteface PLAYER, LEFT
	writetext .badge_check_description_text
	checkcode VAR_BADGES
	sif <, 8, then
		writetext .not_enough_badges_text
		playwaitsfx SFX_WRONG
		waitbutton
		writetext .come_back_text
		closetext
		applymovement PLAYER, .move_back
		end
	sendif
	setevent EVENT_BADGE_CHECKER
	writetext .got_all_badges_text
	playwaitsfx SFX_DEX_FANFARE_50_79
	jumptext .allowed_to_enter_text

.move_back
	step_down
	step_end

.initial_call_text
	ctxt "Stehen geblieben."
	sdone

.badge_check_description_text
	ctxt "Du darfst nur zur"
	line "Rijon-Liga, wenn"
	para "du mindestens 8"
	line "Orden hast!"
	sdone

.got_all_badges_text
	ctxt "Spektakulär!"

	para "Du hast all die"
	line "Naljo-Orden"
	cont "gesammelt."
	done

.allowed_to_enter_text
	ctxt "Lass mich diese"
	line "Orden bitte noch"
	para "auf Echtheit"
	line "prüfen <...>"
	para "LOS ROTOM,"
	line "SCANN DIE ORDEN!"
	para "ROTOM: ROOTOOM"
	line "Rootoom, rootoom"
	para "<...>"
	para "<...>"
	para "<...>"
	para "OK, sie sind echt!"
	line "Du darfst"
	cont "passieren!"
	done

.not_enough_badges_text
	ctxt "Sorry, du hast"
	line "leider nicht"
	cont "genug Orden."
	done

.come_back_text
	ctxt "Komm zurück, wenn"
	line "du alle 8 Orden"
	cont "gewonnen hast."
	sdone

NaljoBorderWest_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $13, $4, 1, ROUTE_68
	warp_def $13, $5, 1, ROUTE_68
	warp_def $2, $5, 1, NALJO_BORDER_WARPROOM
	warp_def $c, $11, 1, NALJO_BORDER_EAST

	;xy triggers
	db 2
	xy_trigger 0, $f, $4, NaljoBorderWestBadgeCheck
	xy_trigger 0, $f, $5, NaljoBorderWestBadgeCheck

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 15, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, NaljoBorderWestNPC1, -1
	person_event SPRITE_OFFICER, 13, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, NaljoBorderWestNPC2, EVENT_ROUTE_63_TRAINER_2
