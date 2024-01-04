SaffronCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronCityCitySign:
	ctxt "Leuchtend goldenes"
	next "Land des Handels"
	done

SaffronCityGymSign:
	ctxt "#mon-Arena"
	next "Leiterin: Sabrina"
	done

SaffronCityDojoSign:
	ctxt "Kampf-Dojo"
	nl   ""
	next "Jeder ist"
	next "willkommen!"
	done

SaffronCitySilphSign:
	ctxt "Silph Co."
	nl   ""
	next "Hauptquatier"
	done

SaffronCityMrPsychicSign:
	ctxt "Mr. Psychos Haus"
	done

SaffronCityNPC1:
	ctxt "Die Leute aus"
	line "Naljo sind so"
	para "ungestüm und "
	line "aufregend."
	done

SaffronCityNPC2:
	ctxt "Ein berühmter"
	line "#mon-Trainer"
	para "ist vor Kurzem"
	line "hier hergezogen."
	para "Er war früher der"
	line "Arenaleiter von"
	cont "Vertania City."
	done

SaffronCityNPC3:
	ctxt "Seit die Silph Co."
	para "sich für den"
	line "Umweltschutz"
	para "einsetzt, mag ich"
	line "sie immer mehr."
	done

SaffronCityNPC4:
	ctxt "In einer so großen"
	line "Stadt zu leben,"
	cont "ist aufregend!"
	done

SaffronCityNPC5:
	ctxt "Aus Sicherheits-"
	line "gründen, dürfen"
	para "Menschen, die"
	line "nicht aus Kanto"
	para "kommen, die Stadt"
	line "nicht verlassen."
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
	ctxt "Was? Herr Eich"
	line "will mich wieder "
	cont "einstellen?!"
	para "Es tut mir Leid,"
	line "lass uns abhauen,"
	para "bevor es zu spät "
	line "ist!"
	sdone

.blue_meets_worker_text
	ctxt "Tut mir Leid,"
	line "Chef!"
	para "Herr Eich: Ja,ja."
	line "Jetzt mach deine"
	cont "Arbeit zu Ende."
	sdone

.created_master_ball_text
	ctxt "Herr Eich: Gute"
	line "Arbeit, <PLAYER>!"
	para "Danke, dass du"
	line "diesem besonderen"
	para "Moment für uns und"
	line "die Silph Co."
	cont "beiwohnst!"
	para "Der Meisterball!"
	para "Mit ihm fängt"
	line "man garantiert"
	cont "jedes #mon!"
	para "Und weil ich dich"
	line "so mag, schenke"
	para "ich dir das erstes"
	line "Exemplar unserer"
	cont "Produktion!"
	sdone

.interested_in_battle_text
	ctxt "Bist du auch an"
	line "einem Kampf"
	cont "interessiert?"
	para "Ich bin zwar etwas"
	line "eingerostet, aber"
	para "ich denke ich"
	line "hab es noch drauf."
	para "Sprich mich"
	line "einfach an, wenn"
	para "du einen Kampf"
	line "willst."
	done

SaffronCity_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 16
	warp_def $b, $20, 1, SAFFRON_FIGHTING_DOJO
	warp_def $b, $28, 31, SAFFRON_GYM
	warp_def $25, $23, 1, SAFFRON_MR_PSYCHIC
	warp_def 19, 15, 1, SAFFRON_COPYCATS_HOUSE
	warp_def $13, $1f, 1, SAFFRON_MART
	warp_def 13, 14, 1, SAFFRON_MAGNET_TRAIN
	warp_def $d, $f, 2, SAFFRON_MAGNET_TRAIN
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
	db 6
	signpost 13, 25, SIGNPOST_LOAD, SaffronCityCitySign
	signpost 13, 41, SIGNPOST_LOAD, SaffronCityGymSign
	signpost 13, 33, SIGNPOST_LOAD, SaffronCityDojoSign
	signpost 29, 21, SIGNPOST_LOAD, SaffronCitySilphSign
	signpost 37, 33, SIGNPOST_LOAD, SaffronCityMrPsychicSign
	signpost 13, 13, SIGNPOST_JUMPSTD, magnettrainsign

	;people-events
	db 6
	person_event SPRITE_POKEFAN_M, 30, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC1, -1
	person_event SPRITE_FISHER, 39, 29, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC2, -1
	person_event SPRITE_COOLTRAINER_F, 32, 36, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SaffronCityNPC3, -1
	person_event SPRITE_FISHER, 15, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaffronCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 22, 35, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 27, 21, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 8 + PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaffronCitySilphWorker, EVENT_APPROACHED_SILPH_WORKER