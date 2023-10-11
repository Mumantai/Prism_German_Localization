SilphCo_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilphCoWorker:
	ctxt "Slacking off is"
	line "bad. I love work!"
	done

SilphCoSecurityOfficer:
	ctxt "Sorry, I can't let"
	line "you up here."
	done

SilphCoBasementGuard:
	ctxt "You're not allowed"
	line "down here."
	done

SilphCoReceptionist:
	checkevent EVENT_MET_BLUE
	sif true
		jumptext .generic_welcome_text
	setevent EVENT_SILPH_WORKER_NOT_UPSTAIRS
	setevent EVENT_MET_BLUE
	showtext .first_welcome_text
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 32
	appear 6
	applymovement 6, .blue_appears
	spriteface 6, LEFT
	showtext .blue_introduction_text
	disappear 7
	follow 6, PLAYER
	applymovement 6, .blue_chases_after_employee
	stopfollow
	warpfacing UP, SILPH_CO, 7, 39
	showtext .master_ball_project_explanation_text
	showemote EMOTE_QUESTION, 4, 32
	setevent EVENT_BLUE_NOT_ON_FIRST_FLOOR
	setevent EVENT_SEEKING_OUT_SILPH_WORKER
	spriteface PLAYER, LEFT
	spriteface 4, RIGHT
	jumptext .after_employee_runs_away_text

.blue_appears
	step_left
	step_left
	step_down
	step_left
	step_left
	step_end

.blue_chases_after_employee
	step_right
	step_right
	step_right
	step_up
	rept 7
		step_right
	endr
	step_up
	step_up
	step_up
	step_end

.generic_welcome_text
	ctxt "Welcome to Silph"
	line "Co."
	done

.first_welcome_text
	ctxt "Welcome to Silph"
	line "Co."

	para "I'm afraid we don't"
	line "offer tours, so I'm"
	para "going to have to"
	line "ask you to<...>"

	para "???: Wait, don't"
	line "leave just yet!"
	sdone

.blue_introduction_text
	ctxt "Allow me to intro-"
	line "duce myself<...>"

	para "My name's Mr. Oak."

	para "I've heard about"
	line "you before<...>"

	para "Lance is your"
	line "father, right?"

	para "After I fought"
	line "him, I became the"
	para "Champion for a"
	line "short time, until"
	para "that Red got in"
	line "the way."

	para "While I still"
	line "battle on the"
	para "side, I've become"
	line "more interested in"
	para "developing"
	line "environmentally-"
	cont "friendly projects."

	para "I studied abroad"
	line "in Kalos, and,"
	para "when I returned, I"
	line "was offered this"
	cont "position."

	para "Gramps had some"
	line "pretty strong"
	cont "connections!"

	para "Come, let me show"
	line "you my latest"
	cont "project."
	sdone

.master_ball_project_explanation_text
	ctxt "We've gone through"
	line "several prototypes"
	para "while trying to"
	line "develop the"
	cont "perfect #ball."

	para "When I took over,"
	line "I made the company"
	para "environmentally"
	line "friendly."

	para "It delayed the"
	line "retail version of"
	cont "the Master Ball."

	para "However, I think"
	line "that we're finally"
	cont "there!"

	para "We finished the"
	line "first retail"
	para "version of this"
	line "ball, and<...>"
	sdone

.after_employee_runs_away_text
	ctxt "Wait<...> this isn't"
	line "right."

	para "It's missing a"
	line "chip<...> the guy in"
	para "charge of that"
	line "said he had done"
	cont "this already!"

	para "<PLAYER>, is it?"

	para "I'm sorry, but, can"
	line "you please go look"
	cont "for him?"

	para "He's probably"
	line "somewhere in"
	cont "Saffron City."

	para "Thank you. If you"
	line "find him, I might"
	para "make it worth your"
	line "while."
	done

SilphCoBlue:
	faceplayer
	opentext
	checkevent EVENT_WON_AGAINST_BLUE
	sif true
		jumptext .already_battled_text
	checkevent EVENT_APPROACHED_SILPH_WORKER
	sif false
		jumptext .please_find_guy_text
	writetext .want_to_battle_text
	yesorno
	sif false
		closetextend
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer BLUE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	setevent EVENT_WON_AGAINST_BLUE
	jumptext .after_battle_text

.already_battled_text
	ctxt "Thank you again"
	line "for that great"
	cont "battle!"

	para "I need to refine"
	line "my skills."

	para "I've always wanted"
	line "to visit Alola's"
	cont "battle tree."

	para "I'd be able to"
	line "practice against"
	para "all sorts of"
	line "trainers there!"
	done

.want_to_battle_text
	ctxt "Oh, hey, are you"
	line "up for a battle?"
	done

.please_find_guy_text
	ctxt "Please find that"
	line "guy. This needs to"
	cont "be finished!"
	done

.before_battle_text
	ctxt "Let's do it!"
	sdone

.battle_won_text
	ctxt "Wow, you're really"
	line "something else!"
	done

.after_battle_text
	ctxt "You're really"
	line "strong; it's very"
	para "noble how you"
	line "treat your"
	cont "#mon."

	para "If you want, I'll"
	line "let you have"
	para "access to the"
	line "basement."

	para "That's where we"
	line "grow the apricorns"
	para "to make Master"
	line "Balls."

	para "Only the most"
	line "skilled of ball"
	para "makers can even"
	line "have a chance at"
	para "making Master"
	line "Balls."

	para "The fruit tree is"
	line "almost extinct, so"
	para "we need to make"
	line "sure that only"
	para "trustworthy people"
	line "handle it."
	done

SilphCo_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $7, $2, 8, SAFFRON_CITY
	warp_def $7, $3, 8, SAFFRON_CITY
	warp_def $0, $e, 4, SILPH_CO
	warp_def $e, $d, 3, SILPH_CO
	warp_def $e, $b, 6, SILPH_CO
	warp_def $20, $b, 5, SILPH_CO
	warp_def $6, $f, 1, SILPH_CO_B1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 7
	person_event SPRITE_YOUNGSTER, 39, 8, $7, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoWorker, EVENT_SILPH_WORKER_NOT_UPSTAIRS
	person_event SPRITE_OFFICER, 32, 13, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SilphCoSecurityOfficer, -1
	person_event SPRITE_BLUE, 39, 6, $7, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SilphCoBlue, -1
	person_event SPRITE_RECEPTIONIST, 2, 3, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SilphCoReceptionist, -1
	person_event SPRITE_BLUE, 3, 8, $6, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_NOT_ON_FIRST_FLOOR
	person_event SPRITE_OFFICER,  1, 14, $2, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoSecurityOfficer, EVENT_SEEKING_OUT_SILPH_WORKER
	person_event SPRITE_OFFICER, 6, 15, $2, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SilphCoBasementGuard, EVENT_WON_AGAINST_BLUE
