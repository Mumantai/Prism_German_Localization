Route72Gate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route72GateNPC1:
	ctxt "Route 72 is ahead."

	para "It is full of"
	line "eager Trainers"
	cont "waiting to battle."

	para "Frankly<...>"

	para "What losers."
	done

Route72GateNPC2:
	ctxt "I need to do some"
	line "thinking<...>"

	para "My #mon hates"
	line "me, and I don't"
	cont "know why<...>"
	done

Route72GateNPC3:
	ctxt "The stairs lead"
	line "down to a cave, so"
	cont "be careful."
	done

Route72GateOldMan:
	faceplayer
	checkevent EVENT_BIG_SHINY_BALL_REWARD
	sif true
		jumptext .after_giving_shiny_balls_text
	checkevent EVENT_ROUTE_72_GATE_POKEBALLS
	sif false, then
		opentext
		writetext .before_giving_pokeballs_text
		setevent EVENT_ROUTE_72_GATE_POKEBALLS
		verbosegiveitem POKE_BALL, 5
		waitbutton
	sendif
	checkcode VAR_DEXCAUGHT
	sif <, 253
		jumptext .after_giving_pokeballs_text
	opentext
	writetext .show_all_pokemon_text
	verbosegiveitem SHINY_BALL, 20
	waitbutton
	setevent EVENT_BIG_SHINY_BALL_REWARD
	jumptext .gave_shiny_balls_text

.gave_shiny_balls_text
	ctxt "These special"
	line "balls make any"
	cont "#mon shiny!"

	para "They have a weird"
	line "side effect on"
	cont "certain species."

	para "But I've never seen"
	line "it happen myself."

	para "Make sure you use"
	line "these wisely!"
	done

.before_giving_pokeballs_text
	ctxt "Hello there."

	para "You're interested"
	line "in completing the"
	cont "#dex someday?"

	para "If so, perhaps I"
	line "can help you out!"

	para "This isn't much,"
	line "but it will be of"
	cont "some assistance."
	prompt

.after_giving_pokeballs_text
	ctxt "I'm eager to see a"
	line "complete Naljo"
	cont "region #dex."

	para "Come back when"
	line "you're done!"
	done

.show_all_pokemon_text
	ctxt "What's this?!"

	para "253 #mon!"

	para "Simply amazing!"

	para "An impressive deed"
	line "such as this must"
	cont "be rewarded!"

	para "Oh, I know!"

	para "Please take good"
	line "care of these."
	sdone

.after_giving_shiny_balls_text
	ctxt "You should be very"
	line "proud of what you"
	cont "accomplished."

	para "Completing the"
	line "Naljo Dex is no"
	cont "easy feat!"
	done

Route72Gate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 9
	warp_def $0, $4, 1, ROUTE_72
	warp_def $0, $5, 2, ROUTE_72
	warp_def $7, $4, 1, ROUTE_71_WEST
	warp_def $7, $5, 1, ROUTE_71_WEST
	warp_def $e, $4, 4, OXALIS_CITY
	warp_def $e, $5, 10, OXALIS_CITY
	warp_def $15, $4, 3, ROUTE_72
	warp_def $15, $5, 3, ROUTE_72
	warp_def $7, $8, 6, CLATHRITE_1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_OFFICER, 4, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route72GateNPC1, -1
	person_event SPRITE_OFFICER, 17, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route72GateNPC2, -1
	person_event SPRITE_GRAMPS, 3, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route72GateNPC3, -1
	person_event SPRITE_POKEFAN_M, 6, 0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route72GateOldMan, -1
