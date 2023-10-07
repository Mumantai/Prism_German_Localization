NaljoBorderWest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

NaljoBorderWestNPC1:
	ctxt "Many Trainers try"
	line "to sneak by."

	para "We've really had"
	line "to beef up"
	cont "security here."
	done

NaljoBorderWestNPC2:
	ctxt "Only the best of"
	line "the best have a"
	para "chance to compete"
	line "in Rijon's League!"

	para "Don't take it for"
	line "granted!"
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
	ctxt "Hang on there."
	sdone

.badge_check_description_text
	ctxt "I can only allow"
	line "you to use the"
	para "warp to the Rijon"
	line "League if you have"
	para "at least eight"
	line "badges."
	sdone

.got_all_badges_text
	ctxt "Spectacular!"

	para "You've collected"
	line "all of the Naljo"
	cont "Badges."
	done

.allowed_to_enter_text
	ctxt "You are permitted"
	line "to enter."
	done

.not_enough_badges_text
	ctxt "Sorry, looks like"
	line "you don't have"
	cont "enough."
	done

.come_back_text
	ctxt "Come back when"
	line "you've collected"
	cont "eight of them."
	sdone

NaljoBorderWest_MapEventHeader:
	;filler
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
