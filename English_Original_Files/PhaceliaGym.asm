PhaceliaGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaGymGuide:
	ctxt "Andre's the kind of"
	line "Gym Leader who"
	para "lets his fists do"
	line "the talking."

	para "He can be very"
	line "hostile, so be"
	para "careful when"
	line "talking to him."
	done

PhaceliaGym_Trainer_1:
	trainer EVENT_PHACELIA_GYM_TRAINER_1, BLACKBELT_T, 3, .before_battle_text, .battle_won_text

	ctxt "I need to take my"
	line "training itinerary"
	cont "more seriously!"
	done

.before_battle_text
	ctxt "It takes years of"
	line "intense training"
	para "before you even"
	line "get considered to"
	para "be one of Andre's"
	line "lowly disciples!"
	done

.battle_won_text
	text "Augh!"
	done

PhaceliaGym_Trainer_2:
	trainer EVENT_PHACELIA_GYM_TRAINER_2, BLACKBELT_T, 4, .before_battle_text, .battle_won_text

	ctxt "I'm going to start"
	line "waking up at 3 AM"
	para "and training non-"
	line "stop until 9 PM!"

	para "I must become more"
	line "powerful than you"
	para "could ever"
	line "imagine!"
	done

.before_battle_text
	ctxt "Up at 4 AM, 16"
	line "hours of training,"
	para "with only three"
	line "10-minute breaks."

	para "Day after day."

	para "Thus is the life"
	line "of a warrior."
	done

.battle_won_text
	ctxt "I need more!"
	done

PhaceliaGym_Trainer_3:
	trainer EVENT_PHACELIA_GYM_TRAINER_3, BLACKBELT_T, 5, .before_battle_text, .battle_won_text

	ctxt "I wore you down"
	line "enough. You won't"
	para "stand a chance"
	line "against Andre!"
	done

.before_battle_text
	ctxt "I may only be"
	line "second-in-command"
	para "here<...> But it"
	line "doesn't matter."

	para "You're not going"
	line "any farther."
	done

.battle_won_text
	ctxt "Inequitable!"
	done

PhaceliaGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_MUSCLEBADGE
	sif true
		jumptext .already_defeated_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer ANDRE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	special RestartMapMusic
	setflag ENGINE_MUSCLEBADGE
	writetext .before_giving_TM_text
	givetm TM_DYNAMICPUNCH + RECEIVED_TM
	waitbutton
	jumptext .after_giving_TM_text

.already_defeated_text
	ctxt "Technology and"
	line "civilization is"
	para "going to fail us"
	line "in the end."

	para "When that happens,"
	line "my crew along with"
	para "our #mon teams"
	line "will be the most"
	para "powerful force in"
	line "the world!"
	done

.introduction_text
	ctxt "Hey, how did you"
	line "get this far?"

	para "My followers need"
	line "to train more."

	para "I'm Andre."

	para "This cave, right"
	line "here, is our home."

	para "My #mon and I"
	line "carved it using"
	para "nothing but our"
	line "BARE HANDS!"

	para "These construction"
	line "workers are so"
	para "pathetic, relying"
	line "on technology to"
	para "achieve tasks,"
	line "rather than simply"
	para "making their body"
	line "an indestructible"
	cont "war machine!"

	para "Think I'm crazy?"

	para "Just watch!"
	sdone

.battle_won_text
	ctxt "No!"

	para "You may be strong"
	line "now, but what will"
	para "happen when"
	line "society can no"
	para "longer produce"
	line "things to fill"
	cont "your item pack?"

	para "I'll give you a"
	line "badge for now, but"
	para "when the world"
	line "ends, don't come"
	cont "crying to me."
	done

.received_badge_text
	ctxt "<PLAYER>"
	line "received Muscle"
	cont "Badge."
	done

.before_giving_TM_text
	ctxt "I need to rid"
	line "myself of such"
	para "foul shortcuts"
	line "that technology"
	cont "has created."

	para "Take this."
	done

.after_giving_TM_text
	ctxt "This TM is called"
	line "DynamicPunch."

	para "It's an inaccurate"
	line "move, but if it"
	para "hits, the foe"
	line "becomes confused!"

	para "You may see it as"
	line "an advantage, but"
	para "I only see it as a"
	line "way to cripple you"
	para "and your team's"
	line "ability to survive"
	cont "without help."
	done

PhaceliaGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $f, $f, 2, PHACELIA_CITY
	warp_def $1, $3, 6, MILOS_F1

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 8
	person_event SPRITE_GYM_GUY, 10, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaGymGuide, -1
	person_event SPRITE_BLACK_BELT, 14, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, PhaceliaGym_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 11, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, PhaceliaGym_Trainer_2, -1
	person_event SPRITE_BLACK_BELT, 4, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, PhaceliaGym_Trainer_3, -1
	person_event SPRITE_ANDRE, 2, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhaceliaGymLeader, -1
	person_event SPRITE_ROCK, 5, 16, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 4, 3, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 3, 2, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
