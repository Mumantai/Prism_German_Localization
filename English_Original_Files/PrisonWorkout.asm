PrisonWorkout_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PrisonWorkoutTrashCan:
	ctxt "There's only"
	line "trash in here."
	done

PrisonWorkoutNPC1:
	ctxt "I heard that this"
	line "island used to be"
	para "the resting ground"
	line "of the legendary"
	cont "Naljo Guardians."

	para "Humans and other"
	line "#mon were not"
	para "allowed to visit"
	line "the island."

	para "However, the hired"
	line "construction crew"
	cont "didn't care;"
	para "they had their"
	line "orders to build"
	para "a prison, so they"
	line "built it over this"
	cont "historic landmark."
	done

PrisonWorkoutNPC2:
	ctxt "Working out is the"
	line "only joy I get out"
	cont "of life now<...>"

	para "However, it doesn't"
	line "fill the void."

	para "At the time I was"
	line "arrested, they"
	para "separated me and"
	line "my #mon<...>"

	para "The friendship I"
	line "had with them"
	para "is much stronger"
	line "than my body could"
	cont "ever become."
	done

PrisonWorkoutKeyGuy:
	faceplayer
	opentext
	checkevent EVENT_PRISON_WORKOUT_KEY
	sif true
		jumptext .key_given_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	waitbutton
	sif false
		jumptext .no_space_text
	setevent EVENT_PRISON_WORKOUT_KEY
	closetextend

.give_key_text
	ctxt "Hah!"

	para "What do you want,"
	line "you little wimp?"

	para "Looking for keys?"

	para "Well yeah, I got"
	line "a spare one."

	para "I don't need it,"
	line "because I'm tough"
	para "enough to live the"
	line "prison life."
	sdone

.key_given_text
	ctxt "You need to keep"
	line "getting tougher."

	para "You'll need real"
	line "toughness to"
	cont "survive in here."
	done

.no_space_text
	ctxt "Free up some"
	line "space first"
	cont "actually."
	done

PrisonWorkoutGuard:
	faceplayer
	opentext
	checkevent EVENT_PRISON_WORKOUT_TRAINER
	sif false, then
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer OFFICER, 7
		startbattle
		reloadmapafterbattle
		playmapmusic
		setevent EVENT_PRISON_WORKOUT_TRAINER
		jumptext .after_winning_text
	sendif
	checkevent EVENT_PRISON_ROOF_TRAINER_2
	sif false
		jumptext .already_beaten_text
	setevent EVENT_PRISON_B1F_KNOW_PASSWORD
	jumptext .password_text

.already_beaten_text
	ctxt "Hey kid."

	para "You should start"
	line "with the lightest"
	cont "training weights."

	para "It's going to be"
	line "a looong time"
	para "before you get"
	line "even close to"
	cont "the other guys."
	done

.before_battle_text
	ctxt "Oh geez!"

	para "Kid, you scared"
	line "the stones out of"
	cont "me."

	para "There's been a"
	line "lot of paranormal"
	para "activity around"
	line "this place."

	para "I know what will"
	line "calm me down."

	para "A #mon battle!"
	sdone

.battle_won_text
	ctxt "This is"
	line "ridiculous."
	done

.after_winning_text
	ctxt "Be careful"
	line "downstairs."

	para "Those #mon are"
	line "unpredictable."
	done

.password_text
	ctxt "What's that?"

	para "Johnny-boy said"
	line "it's okay to give"
	cont "you the password?"

	para "Ah, OK."
	line "Sorry about that."

	para "The password to"
	line "the main gate is:"
	cont "Wigglyjelly."

	para "It's a combination"
	line "of my favorite"
	para "sweets and Grady's"
	line "childhood #mon!"

	para "Or was it:"
	line "Jigglydoughnut<...>?"

	para "No, no, no! I'm"
	line "certain it's"
	cont "Wigglyjelly!"
	done

PrisonWorkoutNurse:
	faceplayer
	opentext
	writetext .before_healing_text
	special HealParty
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	jumptext .after_healing_text

.before_healing_text
	ctxt "You look tired."

	para "Here, take a rest."
	sdone

.after_healing_text
	ctxt "There we go, you"
	line "look a lot better."

	para "Come back whenever"
	line "you need a rest."
	done

PrisonWorkout_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $8, $0, 10, PRISON_F1
	warp_def $9, $0, 11, PRISON_F1

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 15, 18, SIGNPOST_TEXT, PrisonWorkoutTrashCan
	signpost 3, 18, SIGNPOST_TEXT, PrisonWorkoutTrashCan

	;people-events
	db 5
	person_event SPRITE_BLACK_BELT, 14, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, PrisonWorkoutNPC1, -1
	person_event SPRITE_BLACK_BELT, 4, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, PrisonWorkoutNPC2, -1
	person_event SPRITE_BLACK_BELT, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonWorkoutKeyGuy, -1
	person_event SPRITE_OFFICER, 13, 17, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonWorkoutGuard, -1
	person_event SPRITE_NURSE, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonWorkoutNurse, -1
