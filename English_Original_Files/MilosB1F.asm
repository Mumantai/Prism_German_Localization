MilosB1F_MapScriptHeader:
 ;trigger count
	db 2
	maptrigger MilosB1FCutscene
	maptrigger GenericDummyScript
 ;callback count
	db 0

MilosB1FLemonadeDude:
	faceplayer
	opentext
	checkevent EVENT_MILOS_CATACOMBS_RAZOR_FANG
	sif true
		jumptext .already_got_razor_fang_text
	writetext .intro_text
	yesorno
	sif false
		jumptext .said_no_text
	checkitem LEMONADE
	sif false
		jumptext .no_lemonade_text
	verbosegiveitem RAZOR_FANG, 1
	waitbutton
	sif false
		jumptext .no_room_text
	takeitem LEMONADE, 1
	setevent EVENT_MILOS_CATACOMBS_RAZOR_FANG
	jumptext .gave_lemonade_text

.already_got_razor_fang_text
	ctxt "That Razor Fang"
	line "sure is"
	cont "intriguing."

	para "I found it in a"
	line "lower floor."

	para "Rumor has it that"
	line "it belonged to"
	para "some ancient"
	line "civilization."
	done

.intro_text
	ctxt "I love lemonade!"

	para "If you get me a"
	line "glass of lemonade,"
	para "I'll give you a"
	line "neat artifact!"

	para "So, what do you"
	line "say<...> will you"
	cont "give me one?"
	done

.said_no_text
	ctxt "Well, that's not"
	line "very nice."
	done

.no_lemonade_text
	ctxt "You can't fool"
	line "me; you don't have"
	para "a single glass of"
	line "lemonade!"
	done

.gave_lemonade_text
	ctxt "Wonderful, can't"
	line "wait to drink this"
	cont "stuff!"

	para "Wait a second<...>"

	para "Haven't you ever"
	line "heard of a cooler?"

	para "Or at least a"
	line "thermos?"
	done

.no_room_text
	ctxt "You have no room"
	line "for the artifact!"

	para "I can't take your"
	line "lemonade and give"
	cont "you nothing back<...>"
	done

MilosB1F_YellowPatroller:
	trainer EVENT_MILOS_B1F_TRAINER_1, PATROLLER, 4, .before_battle_text, .battle_won_text

	ctxt "Look, I'm having a"
	line "real bad day."

	para "I don't want to"
	line "talk to you."
	done

.before_battle_text
	ctxt "Seriously?"
	done

.battle_won_text
	ctxt "Hey, come on now!"
	done

MilosB1FCutscene:
	opentext
	writetext .text_1
	writetext .text_2
	writetext .text_3
	writetext .text_4
	writetext .text_5
	spriteface 4, RIGHT
	writetext .text_6
	spriteface 6, LEFT
	writetext .text_7
	writetext .text_8
	writetext .text_9
	writetext .text_10
	spriteface 4, UP
	spriteface 6, UP
	writetext .text_11
	writetext .text_12
	writetext .text_13
	writetext .text_14
	writetext .text_15
	writetext .text_16
	writetext .text_17
	writetext .text_18
	writetext .text_19
	writetext .text_20
	writetext .text_21
	closetext
	follow 5, 8
	applymovement 5, .numbered_people_leaving
	opentext
	writetext .text_22
	writetext .text_23
	writetext .text_24
	spriteface 6, LEFT
	writetext .text_25
	closetext
	applymovement 6, .patrollers_leaving
	opentext
	writetext .text_26
	follow 4, 7
	closetext
	applymovement 4, .patrollers_leaving
	setevent EVENT_MILOS_CUTSCENE
	disappear 4
	disappear 5
	disappear 6
	disappear 7
	disappear 8
	dotrigger 1
	end

.numbered_people_leaving
	step_left
	step_left
	step_up
	step_left
	step_left
	step_left
	step_end

.patrollers_leaving
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_left
	step_left
	step_end

.text_1
	ctxt "Black: So, boss."

	para "When are we gonna"
	line "get paid for this?"
	sdone

.text_2
	ctxt "No. 13: You'll get"
	line "paid when you do"
	cont "your job!"
	sdone

.text_3
	ctxt "Yellow: But we"
	line "have been doing"
	cont "our job properly!"
	sdone

.text_4
	ctxt "No. 08: Oh yeah,"
	line "missy? Then tell"
	para "me about this: why"
	line "are the cops"
	para "suspecting that"
	line "something fishy's"
	para "going on in the"
	line "underground city?"
	sdone

.text_5
	ctxt "Black: It probably"
	line "has something to"
	para "do with all of"
	line "those big, weird"
	cont "earthquakes<...>"
	sdone

.text_6
	ctxt "Green: <``>Missy<''>?"

	para "Wait<...> Dude."

	para "You're a girl?"
	sdone

.text_7
	ctxt "Yellow: Of course"
	line "I am! We went to"
	para "high school tog-"
	line "ether, remember!?"
	sdone

.text_8
	ctxt "Green: <...>I don't"
	line "remember our high"
	para "school allowing"
	line "girls on campus."
	sdone

.text_9
	ctxt "Yellow: Yeah, they"
	line "let me in anyway."

	para "Have a problem"
	line "with that, huh?"
	sdone

.text_10
	ctxt "No. 13: Is this"
	line "what you guys call"
	cont "<``>doing your job<''>?"
	sdone

.text_11
	ctxt "No. 08: I can't"
	line "believe the boss"
	cont "hired these guys."
	sdone

.text_12
	ctxt "No. 13: Could you"
	line "guys please just"
	para "SHUT UP and do"
	line "your darn job?"

	para "No cops!"

	para "Got it?"
	sdone

.text_13
	ctxt "Yellow: Got it,"
	line "but the cops aren't"
	para "whom you should be"
	line "worried about<...>"
	sdone

.text_14
	ctxt "Green: There's some"
	line "kid from a distant"
	para "region who keeps"
	line "getting in our"
	cont "way!"
	sdone

.text_15
	ctxt "Black: Naturally,"
	line "no matter what we"
	para "do, we'll end up"
	line "facing that, uhm,"
	cont "<``>annoyance<''> again."
	sdone

.text_16
	ctxt "Yellow: It's like,"
	line "our fate I guess."
	sdone

.text_17
	ctxt "Green: Totally."
	sdone

.text_18
	ctxt "No. 13: Well, if"
	line "that's the case<...>"

	para "I'll just let the"
	line "boss know about"
	cont "this <``>prodigy<''>."
	sdone

.text_19
	ctxt "No. 08: But we'll"
	line "take care of him."
	sdone

.text_20
	ctxt "No. 13: Don't worry"
	line "about it."
	sdone

.text_21
	ctxt "No. 08: Anyway,"
	line "you three let your"
	para "boss know to keep"
	line "going with these<...>"
	cont "<``>distractions<''>."

	para "We're really close"
	line "to finishing our"
	cont "project, at last."
	sdone

.text_22
	ctxt "Green: That was"
	line "some pretty cool"
	para "banter we had"
	line "going on there."
	sdone

.text_23
	ctxt "Yellow: Yeah, but"
	line "why don't you know"
	cont "my gender<...>?"

	para "I thought we were"
	line "together for ages!"
	sdone

.text_24
	ctxt "Green: We are WHAT"
	line "now? <...>Why do you"
	cont "think that?"
	sdone

.text_25
	ctxt "Yellow: <...>"
	prompt

.text_26
	ctxt "Green: Hang on,"
	line "it's sometimes"
	para "hard to hear with"
	line "this helmet on."
	sdone

MilosB1F_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $21, $21, 8, MILOS_F1
	warp_def $3, $3, 1, MILOS_B2F
	warp_def $21, $7, 5, MILOS_F1
	warp_def $11, $3, 1, MILOS_B2FB
	warp_def $4, $8, 3, MILOS_B2F
	warp_def $5, $8, 3, MILOS_B2F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 7
	person_event SPRITE_POKEFAN_M, 6, 36, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MilosB1FLemonadeDude, -1
	person_event SPRITE_PALETTE_PATROLLER, 6, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 2, MilosB1F_YellowPatroller, EVENT_MILOS_B1F_TRAINER_1
	person_event SPRITE_PALETTE_PATROLLER, 31, 33, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_SCIENTIST, 29, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_PALETTE_PATROLLER, 31, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_PALETTE_PATROLLER, 31, 32, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_SCIENTIST, 29, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
