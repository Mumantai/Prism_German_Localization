CastroGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroGym_TripleSpinMovement:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

CastroGymHelperGuy:
	ctxt "What's up?"

	para "All these Trainers"
	line "look the same, but"
	para "only one is the"
	line "leader!"
	done

CastroGymLeader:
	checkflag ENGINE_FISTBADGE
	sif false, then
		applymovement 2, CastroGym_TripleSpinMovement
		faceplayer
		showtext .before_battle_text
		winlosstext .battle_won_text, 0
		loadtrainer KOJI, 1
		startbattle
		reloadmapafterbattle
		variablesprite SPRITE_CASTRO_GYM_1, SPRITE_LASS
		variablesprite SPRITE_CASTRO_GYM_2, SPRITE_LASS
		variablesprite SPRITE_CASTRO_GYM_3, SPRITE_LASS
		variablesprite SPRITE_CASTRO_GYM_4, SPRITE_YOUNGSTER
		special RunSpritesCallback
		opentext
		writetext .got_badge_text
		playwaitsfx SFX_GET_BADGE
		setflag ENGINE_FISTBADGE
		writetext .give_TM_text
		givetm TM_COUNTER + RECEIVED_TM
	sendif
	jumptextfaceplayer .after_battle_text

.before_battle_text
	ctxt "Am I Koji?"

	para "Why, yes, I am!"
	sdone

.battle_won_text
	ctxt "Well done!"

	para "Here!"

	para "The Fist Badge!"
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Fist Badge."
	done

.give_TM_text
	ctxt "Here!"

	para "Take this TM!"
	sdone

.after_battle_text
	ctxt "Hah!"

	para "That was some"
	line "joyful sparring!"
	done

CastroGymTrainer1:
	checkevent EVENT_CASTRO_GYM_TRAINER_1
	sif true
		jumptextfaceplayer .after_battle_text
	applymovement 3, CastroGym_TripleSpinMovement
	faceplayer
	variablesprite SPRITE_CASTRO_GYM_1, SPRITE_LASS
	special RunSpritesCallback
	faceplayer
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer LASS, 9
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_1, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_1
	end

.before_battle_text
	ctxt "Japanese"
	line "onomatopoeia"
	cont "are so kawaii!"
	sdone

.battle_won_text
	ctxt "Hiri hiri!"
	done

.after_battle_text
	ctxt "Uwaaaa!"
	done

CastroGymTrainer2:
	checkevent EVENT_CASTRO_GYM_TRAINER_2
	sif true
		jumptextfaceplayer .after_battle_text
	applymovement 4, CastroGym_TripleSpinMovement
	faceplayer
	variablesprite SPRITE_CASTRO_GYM_2, SPRITE_LASS
	special RunSpritesCallback
	faceplayer
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer LASS, 10
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_2, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_2
	end

.before_battle_text
	ctxt "Well, you chose"
	line "unwisely."
	sdone

.battle_won_text
	text "Ack!"
	done

.after_battle_text
	ctxt "You have more"
	line "chances."
	done

CastroGymTrainer3:
	checkevent EVENT_CASTRO_GYM_TRAINER_3
	sif true
		jumptextfaceplayer .after_battle_text
	applymovement 5, CastroGym_TripleSpinMovement
	faceplayer
	variablesprite SPRITE_CASTRO_GYM_3, SPRITE_LASS
	special RunSpritesCallback
	faceplayer
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer PICNICKER, 3
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_3, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_3
	end

.before_battle_text
	ctxt "Koji is hot."

	para "Dressing like him"
	line "is<...>"

	para "wonderful!"
	sdone

.battle_won_text
	ctxt "Wasn't supposed"
	line "to happen!"
	done

.after_battle_text
	ctxt "Can't wait for"
	line "Halloween!"
	done

CastroGymTrainer4:
	checkevent EVENT_CASTRO_GYM_TRAINER_4
	sif true
		jumptextfaceplayer .after_battle_text
	applymovement 6, CastroGym_TripleSpinMovement
	faceplayer
	variablesprite SPRITE_CASTRO_GYM_4, SPRITE_YOUNGSTER
	special RunSpritesCallback
	faceplayer
	showtext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer CAMPER, 3
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_4, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_4
	end

.before_battle_text
	ctxt "Ninjas are so"
	line "cool!"
	sdone

.battle_won_text
	ctxt "Not skilled"
	line "enough!"
	done

.after_battle_text
	ctxt "Time to study"
	line "ninjutsu instead"
	cont "of pretending."
	done

CastroGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $3, 1, CASTRO_VALLEY
	warp_def $11, $4, 1, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 6
	person_event SPRITE_KOJI, 10, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroGymLeader, -1
	person_event SPRITE_CASTRO_GYM_1, 13, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroGymTrainer1, -1
	person_event SPRITE_CASTRO_GYM_2, 7, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroGymTrainer2, -1
	person_event SPRITE_CASTRO_GYM_3, 6, 26, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroGymTrainer3, -1
	person_event SPRITE_CASTRO_GYM_4, 1, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CastroGymTrainer4, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, CastroGymHelperGuy, -1
