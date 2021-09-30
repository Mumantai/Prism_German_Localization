CastroDock_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CastroDockNPC:
	ctxt "Für die Fähre"
	line "brauchen Sie ein"
	para "spezielles Ticket."
	para "Gibt es die noch?"
	done

CastroDockSailor:
	faceplayer
	opentext
	writetext BattleArcadeFerrySailor_Text_Welcome
	checkitem FERRY_TICKET
	sif false
		jumptext BattleArcadeFerrySailor_Text_NoTicket
	writetext .want_to_go_text
	yesorno
	sif false
		closetextend
	writetext BattleArcadeFerrySailor_Text_Departing
	closetext
	spriteface 3, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear 3
	waitsfx
	applymovement PLAYER, .step_in
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	waitsfx
	playsound SFX_BOAT 
	waitsfx
	warp ROUTE_86_DOCK, 9, 22
	end

.step_in
	step_down
	step_end

.want_to_go_text:
	ctxt "Wunderbar!"

	para "Wollen Sie an"
	line "Bord bzw. in die"
	para "Kampfarena?"
	done

BattleArcadeFerrySailor_Text_Welcome:
	ctxt "Willkommen auf der"
	line "Arcade-Fähre!"

	para "Haben Sie eine"
	line "Fahrkarte?"

	sdone

BattleArcadeFerrySailor_Text_Departing:
	ctxt "Super!"

	para "Wir fahren sofort"
	line "los! "
	sdone

BattleArcadeFerrySailor_Text_NoTicket:
	ctxt "Sry. Kein Ticket,"
	line "kein Zutritt!"

	done

CastroDock_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $5, $9, 2, CASTRO_DOCK_PATH

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SAILOR, 8, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, CastroDockNPC, -1
	person_event SPRITE_SAILOR, 15, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroDockSailor, -1
