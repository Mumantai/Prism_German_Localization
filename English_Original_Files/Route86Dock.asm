Route86Dock_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route86DockNPC1:
	ctxt "If you go north"
	line "you'll end up to"
	cont "the Battle Arcade."
	done

Route86DockNPC2:
	ctxt "The Battle Arcade"
	line "has an interesting"
	cont "concept."

	para "Good luck!"
	done

Route86DockSailor:
	faceplayer
	opentext
	farwritetext BattleArcadeFerrySailor_Text_Welcome
	checkitem FERRY_TICKET
	sif false
		farjumptext BattleArcadeFerrySailor_Text_NoTicket
	writetext .want_to_go_text
	yesorno
	sif false
		closetextend
	farwritetext BattleArcadeFerrySailor_Text_Departing
	closetext
	spriteface 2, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear 2
	waitsfx
	applymovement PLAYER, .step_in
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	waitsfx
	playsound SFX_BOAT
	waitsfx
	warp CASTRO_DOCK, 9, 14
	end

.step_in
	step_down
	step_end

.want_to_go_text
	ctxt "Wonderful!"

	para "Would you like to"
	line "board and head"
	cont "to Castro Valley?"
	done

Route86Dock_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $3, $9, 5, ROUTE_86_DOCK_EXIT

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_SAILOR, 23, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route86DockSailor, -1
	person_event SPRITE_YOUNGSTER, 11, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route86DockNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 13, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route86DockNPC2, -1
