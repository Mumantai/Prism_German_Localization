SaffronCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaffronCityCitySign:
	ctxt "Leuchtendes"
	next "goldenes Land des"
	next "Handels"
	done

SaffronCityGymSign:
	ctxt "#mon-Arena"
	next "Leiterin: Sabrina"
	done

SaffronCityDojoSign:
	ctxt "Kampf-Dojo"
	nl " "
	next "Jeder ist"
	next "willkommen!"

	done

SaffronCitySilphSign:
	ctxt "Silph Co."

	nl " "
	next "Zentral-"
	next "Hauptquatier"
	done

SaffronCityMrPsychicSign:
	ctxt "Mr. Psychos"
	next "Haus"
	done

SaffronCityTrainStationSign:
	ctxt "Magnet-Zug"
	done

SaffronCityNPC1:
	ctxt "Die Leute aus"
	line "Naljo sind so"
	para "ungezwungen und"
	line "faszinierend."

	done

SaffronCityNPC2:
	ctxt "Ein berühmter"
	line "#mon-Trainer"
	para "ist kürzlich in"
	line "die Stadt gezogen."

	para "Er war früher der"
	line "Leiter der"
	para "Vertania City"
	line "Arena."
	done

SaffronCityNPC3:
	ctxt "Ich liebe die"
	line "Silph Co. dafür,"
	para "dass sie umwelt-"
	line "freundlich"
	cont "geworden sind."
	done

SaffronCityNPC4:
	ctxt "Es ist aufregend,"
	line "in einer großen"
	para "Stadt wie dieser"
	line "zu leben!"

	done

SaffronCityNPC5:
	ctxt "Aus"
	line "Sicherheitsgründen"
	para "gilt für Menschen,"
	line "die von außerhalb"
	para "Kantos kommen,"
	line "die Stadt nicht zu"
	cont "verlassen."

	done

SaffronCitySilphWorker:
	faceplayer
	showtext .generic_opening_text
	checkevent EVENT_SEEKING_OUT_SILPH_WORKER
	sif false
		end
	showemote EMOTE_SHOCK, 7, 32
	showtext .back_to_work_text
	setevent EVENT_APPROACHED_SILPH_WORKER
	clearevent EVENT_SILPH_WORKER_NOT_UPSTAIRS
	warp SILPH_CO, 8, 41
	spriteface PLAYER, UP
	spriteface 4, RIGHT
	;playmusic MUSIC_BLUE
	showtext .blue_meets_worker_text

	applymovement 4, .blue_approaches_worker
	spriteface 4, RIGHT

	playwaitsfx SFX_SPIDER_WEB
	playwaitsfx SFX_MORNING_SUN
	playwaitsfx SFX_BALL_POOF
	playwaitsfx SFX_RAGE
	playwaitsfx SFX_GIGA_DRAIN
	playwaitsfx SFX_MILK_DRINK
	playwaitsfx SFX_TITLE_SCREEN_ENTRANCE

	spriteface 4, RIGHT
	spriteface 2, LEFT
	playsound SFX_MASTER_BALL
	showtext .created_master_ball_text
	spriteface PLAYER, LEFT
	applymovement 4, .move_to_player
	spriteface 4, RIGHT
	opentext
	verbosegiveitem MASTER_BALL, 1
	setevent EVENT_CREATED_MASTERBALL
	jumptext .interested_in_battle_text

.blue_approaches_worker
	slow_step_right
	step_end

.move_to_player
	slow_step_down
	slow_step_down
	step_end

.generic_opening_text
	ctxt "Schön, mal an die"
	line "frische Luft zu"
	cont "kommen!"

	sdone

.back_to_work_text
	ctxt "Was, Herr Eich"
	line "will mich wieder"
	cont "beschäftigen?!"

	para "Es tut mir leid."
	line "Lass uns abhauen,"
	para "bevor es zu spät"
	line "ist!"

	sdone

.blue_meets_worker_text
	ctxt "Sorry, Chef!"

	para "Herr Eich: Ja, ja."
	line "Nun, bring deine"
	cont "Arbeit zu Ende."

	sdone

.created_master_ball_text
	ctxt "Herr Eich: Gute"
	line "Arbeit, <PLAYER>!"

	para "Vielen Dank, dass"
	line "du Zeuge eines"
	para "sehr wichtigen"
	line "Events in der"
	para "Geschichte von"
	line "Silph Co."

	para "geworden bist!"

	line "Der Meister-Ball:"
	para "er wird jedes"
	line "#mon zu 100%"
	cont "fangen!"

	para "<PLAYER>, ich kann"
	line "dich wirklich gut"
	para "leiden, ich gebe"
	line "dir unseren ersten"
	cont "Meister-Ball!"

	sdone

.interested_in_battle_text
	ctxt "Bist du auch an"
	line "einem #mon-"
	para "Kampf"
	line "interessiert?"

	para "Ich schätze, ich"
	line "könnte. Ich bin"
	para "etwas eingerostet,"
	line "aber ich nehme an,"
	cont "ich könnte."

	para "Sprich mit mir,"
	line "wann immer du"
	cont "kämpfen möchtest."

	done

SaffronCity_MapEventHeader ;filler
	db 0, 0

;warps
	db 15
	warp_def $b, $20, 1, SAFFRON_FIGHTING_DOJO
	warp_def $b, $28, 31, SAFFRON_GYM
	warp_def $25, $23, 1, SAFFRON_MR_PSYCHIC
	warp_def 19, 15, 1, SAFFRON_COPYCATS_HOUSE
	warp_def $13, $1f, 1, SAFFRON_MART
	warp_def $d, $e, 2, SAFFRON_MAGNET_TRAIN
	warp_def $1d, $18, 1, SILPH_CO
	warp_def $25, $f, 1, SAFFRON_POKECENTER
	warp_def $5, $1a, 1, SAFFRON_GATES
	warp_def $1a, $4, 7, SAFFRON_GATES
	warp_def $1b, $4, 8, SAFFRON_GATES
	warp_def $2d, $1a, 3, SAFFRON_GATES
	warp_def $2d, $1b, 4, SAFFRON_GATES
	warp_def $1a, $2f, 5, SAFFRON_GATES
	warp_def $1b, $2f, 6, SAFFRON_GATES

	;xy triggers
	db 0

	;signposts
	db 8
	signpost 13, 25, SIGNPOST_LOAD, SaffronCityCitySign
	signpost 13, 41, SIGNPOST_LOAD, SaffronCityGymSign
	signpost 13, 33, SIGNPOST_LOAD, SaffronCityDojoSign
	signpost 29, 21, SIGNPOST_LOAD, SaffronCitySilphSign
	signpost 37, 33, SIGNPOST_LOAD, SaffronCityMrPsychicSign
	signpost 13, 19, SIGNPOST_LOAD, SaffronCityTrainStationSign
	signpost 37, 16, SIGNPOST_JUMPSTD, pokecentersign
	signpost 19, 32, SIGNPOST_JUMPSTD, martsign

	;people-events
	db 6
	person_event SPRITE_POKEFAN_M, 30, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC1, -1
	person_event SPRITE_FISHER, 39, 29, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC2, -1
	person_event SPRITE_COOLTRAINER_F, 32, 36, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SaffronCityNPC3, -1
	person_event SPRITE_FISHER, 15, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 22, 35, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 27, 21, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 8 + PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronCitySilphWorker, EVENT_APPROACHED_SILPH_WORKER
