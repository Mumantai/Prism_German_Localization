SaffronCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronCityCitySign:
	ctxt "Shining, Golden"
	next "Land of Commerce"
	done

SaffronCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Sabrina"
	done

SaffronCityDojoSign:
	ctxt "Fighting Dojo"
	nl   ""
	next "Everybody"
	next "welcome!"
	done

SaffronCitySilphSign:
	ctxt "Silph Co."
	nl   ""
	next "Central"
	next "Headquarters"
	done

SaffronCityMrPsychicSign:
	ctxt "Mr. Psychic's"
	next "House"
	done

SaffronCityNPC1:
	ctxt "People from Naljo"
	line "are so wild and"
	cont "exciting."
	done

SaffronCityNPC2:
	ctxt "A famous #mon"
	line "Trainer recently"
	cont "moved into town."

	para "He used to be the"
	line "Viridian City Gym"
	cont "leader."
	done

SaffronCityNPC3:
	ctxt "Silph Co. has"
	line "grown on me ever"
	para "since they started"
	line "being more"
	para "environmentally"
	line "friendly."
	done

SaffronCityNPC4:
	ctxt "It's exciting to"
	line "live in a big city"
	cont "like this!"
	done

SaffronCityNPC5:
	ctxt "For security"
	line "reasons, they don't"
	para "allow people who"
	line "are from outside"
	para "Kanto to leave the"
	line "city."
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
	ctxt "Nice to get some"
	line "fresh air!"
	sdone

.back_to_work_text
	ctxt "What, Mr. Oak"
	line "wants me back on"
	cont "the clock?!"

	para "I'm sorry, let's run"
	line "before it's too"
	cont "late!"
	sdone

.blue_meets_worker_text
	ctxt "I'm so sorry, boss!"

	para "Mr. Oak: Yes, yes;"
	line "well, finish up"
	cont "your task."
	sdone

.created_master_ball_text
	ctxt "Mr. Oak: Good job!"

	para "<PLAYER>!"

	para "Thank you for"
	line "witnessing a very"
	para "important event in"
	line "Silph Co. history!"

	para "The Master Ball -"
	line "it will catch any"
	para "#mon without"
	line "fail!"

	para "Since I like you,"
	line "<PLAYER>, I'll let"
	para "you have our very"
	line "first retail"
	cont "Master Ball!"
	sdone

.interested_in_battle_text
	ctxt "Are you also"
	line "interested in a"
	cont "#mon battle?"

	para "I guess I could;"
	line "I'm kind of rusty,"
	para "but I suppose I"
	line "could."

	para "Talk to me"
	line "whenever you want"
	cont "a battle."
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
