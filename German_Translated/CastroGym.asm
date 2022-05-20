CastroGym_MapScriptHeader;trigger count
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
	ctxt "Was geht ab?"

	para "Die Trainer sehen"
	line "alle gleich aus,"
	para "aber nur einer ist"
	line "der Arenaleiter!"

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
	ctxt "Ob ich Koji bin?"

	para "Japp, der bin ich!"
	sdone

.battle_won_text
	ctxt "Gut gemacht!"

	para "Hier!"
	line "Der Faustorden!"

	done

.got_badge_text
	ctxt "<PLAYER> erhält"
	line "den Faustorden."
	done

.give_TM_text
	ctxt "Hier!"

	para "Nimm diese TM!"
	sdone

.after_battle_text
	ctxt "Hah!"

	para "Das war mal ein"
	line "gutes Sparring!"

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
	ctxt "Japanische Laut-"
	line "malerei ist sowas"
	cont "von kawaii!"

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
	ctxt "Keine kluge Wahl."
	sdone

.battle_won_text
	text "Ack!"
	done

.after_battle_text
	ctxt "Versuch's erneut."
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
	loadtrainer PICNICKER, 5
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_3, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_3
	end

.before_battle_text
	ctxt "Koji ist heiß."

	para "Sich wie er zu"
	line "verkleiden<...>"
	para "EIN TRAUM!"
	sdone

.battle_won_text
	ctxt "Mein Fehler!"
	done

.after_battle_text
	ctxt "Ich kann Halloween"
	line "kaum erwarten!"

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
	loadtrainer CAMPER, 6
	startbattle
	sif true
		variablesprite SPRITE_CASTRO_GYM_4, SPRITE_KOJI
	reloadmapafterbattle
	setevent EVENT_CASTRO_GYM_TRAINER_4
	end

.before_battle_text
	ctxt "Ninjas sind cool!"
	sdone

.battle_won_text
	ctxt "Zu unerfahren!"

	done

.after_battle_text
	ctxt "Zeit, Ninjutsu"
	line "zu trainieren!"
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
