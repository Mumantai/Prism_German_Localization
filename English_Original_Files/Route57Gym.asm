Route57Gym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route57GymInsideSign:
	ctxt "Equality River Gym"

	para "Leader: Joe"
	done

Route57GymLeader:
	faceplayer
	opentext
	checkflag ENGINE_WHITEBADGE
	sif true
		jumptext .already_defeated_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL ;no pun intended
	loadtrainer JOE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	setflag ENGINE_WHITEBADGE
	playmusic MUSIC_JOHTO_GYM
	writetext .after_badge_text
	givetm TM_HYPER_BEAM + RECEIVED_TM
	jumptext .after_TM_text

.before_battle_text
	ctxt "Hello there, my"
	line "name is Joe, the"
	para "Normal Gym leader"
	line "of Rijon!"

	para "I am so normal,"
	line "that all of the"
	para "abnormal people"
	line "left my Gym."

	para "This place is now"
	line "all mine and very"
	cont "normal."

	para "Well, are you"
	line "ready for a Normal"
	cont "Battle?"
	sdone

.battle_won_text
	ctxt "This is abnormal!"

	para "You are killing my"
	line "normal vibes!"

	para "Please, take this"
	line "badge and leave!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "White Badge."
	done

.after_badge_text
	ctxt "Take some of the"
	line "normal home with"
	cont "you!"
	sdone

.after_TM_text
	ctxt "TM15 is Hyper"
	line "Beam!"

	para "A strong, but"
	line "normal attack!"
	done

.already_defeated_text
	ctxt "I'm being normal!"
	done

Route57Gym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $13, $a, 2, ROUTE_57
	warp_def $13, $b, 2, ROUTE_57

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 17, 8, SIGNPOST_TEXT, Route57GymInsideSign
	signpost 17, 13, SIGNPOST_TEXT, Route57GymInsideSign

	;people-events
	db 1
	person_event SPRITE_JOE, 16, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route57GymLeader, -1
