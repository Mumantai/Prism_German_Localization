HeathGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGateGuard:
	ctxt "We put in more"
	line "route gates for"
	cont "higher security."

	para "Some freaks have"
	line "been running"
	para "around vandalizing"
	line "everything."
	done

HeathGateTrigger:
	checkevent EVENT_GOT_HM01
	sif true
		end
	setevent EVENT_GOT_HM01
	showtext .initial_text
	checkcode VAR_YCOORD
	sif =, 5, then
		applymovement PLAYER, .walk_up
	selse
		spriteface PLAYER, UP
	sendif
	opentext
	writetext .before_HM_text
	givetm HM_CUT + RECEIVED_TM
	jumptext .after_HM_text

.walk_up
	step_up
	step_end

.initial_text
	ctxt "Hey, I need to"
	line "talk to you."
	sdone

.before_HM_text
	ctxt "Please keep quiet"
	line "about me ignoring"
	cont "that battle."

	para "Huh? Why I didn't"
	line "stop Mr. Spandex"
	cont "that you fought?"

	para "He yelled at me"
	line "when I called his"
	cont "outfit spandex."

	para "My hurt feelings"
	line "made me decide to"
	cont "take a break."

	para "If you keep quiet,"
	line "I'll give you this"
	cont "nifty HM."
	sdone

.after_HM_text
	ctxt "HM01 is Cut!"

	para "You'll be able to"
	line "clear small bushes"
	cont "blocking your way."

	para "Such as the bush"
	line "east of here."

	para "You'll need the"
	line "Nature Badge in"

	para "order to use it,"
	line "though."
	done

HeathGate_PatrollerRed:
	trainer EVENT_HEATH_GATE_BEAT_RED_PATROLLER, PATROLLER, 15, .before_battle_text, .battle_won_text

	ctxt "I don't like you."

	para "None of us do."

	para "Just<...> make"
	line "everything in the"
	para "world right, and"
	line "surrender."
	done

.before_battle_text
	ctxt "Oh great, it's you."

	para "I heard all about"
	line "what you did from"
	para "that<...> annoying<...>"
	line "Pink Patroller."

	para "You have no right"
	line "to mess with my"
	cont "group like that."

	para "Guess I'll just"
	line "have to teach you"
	cont "a lesson or two."
	done

.battle_won_text
	ctxt "What is it with"
	line "everyone!?"

	para "I, once one of the"
	line "greatest Trainers"
	para "in the world, was"
	line "beaten by a mere"
	cont "child!"

	para "No matter, I have"
	line "big plans that'll"
	para "make everything in"
	line "Naljo right again."

	para "You got lucky this"
	line "time, but I'll be"
	cont "back. Count on it."
	done

HeathGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 7, HEATH_VILLAGE
	warp_def $5, $0, 8, HEATH_VILLAGE
	warp_def $4, $9, 1, ROUTE_74
	warp_def $5, $9, 2, ROUTE_74

.CoordEvents
	db 2
	xy_trigger 0, 4, 5, HeathGateTrigger
	xy_trigger 0, 5, 5, HeathGateTrigger

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, HeathGateGuard, -1
	person_event SPRITE_PALETTE_PATROLLER, 3, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, HeathGate_PatrollerRed, EVENT_HEATH_GATE_BEAT_RED_PATROLLER
