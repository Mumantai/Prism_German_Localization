AzaleaKurt_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .open_basement

.open_basement
	checkevent EVENT_UNLOCK_KURT_CHAMBER
	sif true
		changeblock 14, 4, $1e
	return

AzaleaKurtBallMakingTools:
	farjump BallMakingScript

AzaleaKurtKurt:
	ctxt "Hello, I'm Kurt."

	para "Back in the days,"
	line "I was making"
	para "#balls day and"
	line "night."

	para "Now, however<...>"

	para "You can make one"
	line "yourself, though."

	para "The tools are on"
	line "the table to your"
	para "right. I'm sure"
	line "you'll figure"
	cont "it out."
	done

AzaleaKurtGranddaughter:
	faceplayer
	opentext
	copybytetovar wBallMakingLevel
	sif <, 35
		jumptext .low_level_text
	checkevent EVENT_UNLOCK_KURT_CHAMBER
	sif true
		jumptext .already_unlocked_basement_text
	writetext .before_unlocking_basement_text
	follow 2, PLAYER
	closetext
	checkcode VAR_FACING
	sif =, UP, then
		applymovement 2, .movement_facing_up
	selse
		applymovement 2, .movement_not_facing_up
	sendif
	stopfollow
	playsound SFX_ENTER_DOOR
	changeblock 14, 4, $1e
	setevent EVENT_UNLOCK_KURT_CHAMBER
	jumptext .unlocked_basement_text

.movement_facing_up
	slow_step_right
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	turn_head_left
	step_end

.movement_not_facing_up
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	turn_head_left
	step_end

.low_level_text
	ctxt "Grandpa used to"
	line "make #balls for"
	para "people, until he"
	line "got the arthritis."

	para "Now he teaches"
	line "people how to"
	cont "make them."
	done

.before_unlocking_basement_text
	ctxt "Wow, you're able"
	line "to make Friend"
	cont "Balls?"

	para "I shouldn't show"
	line "you this<...> but"
	cont "follow me."
	sdone

.unlocked_basement_text
	ctxt "In the basement,"
	line "there's tools that"
	para "will allow you to"
	line "make some of the"
	cont "rarest balls."

	para "They're very hard"
	line "to make, so you"
	para "won't always"
	line "succeed."

	para "But, the more"
	line "levels you gain,"
	para "the easier it gets"
	line "to make them."
	done

.already_unlocked_basement_text
	ctxt "Maybe you can"
	line "continue my"
	cont "Grandpa's legacy."

	para "I believe in you!"
	done

AzaleaKurt_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $3, 3, AZALEA_TOWN
	warp_def $7, $4, 3, AZALEA_TOWN
	warp_def $5, $f, 1, AZALEA_KURT_BASEMENT

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 2, 14, SIGNPOST_READ, AzaleaKurtBallMakingTools

.ObjectEvents
	db 2
	person_event SPRITE_LASS, 4, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AzaleaKurtGranddaughter, -1
	person_event SPRITE_KURT, 2, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaKurtKurt, -1
