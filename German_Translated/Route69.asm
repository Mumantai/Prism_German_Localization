Route69_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route69DirectionsSign:
	signpostheader 3
	ctxt "Bitte klaut die"
	next "Schilder nicht."
	nl   ""
	next "<UP> Heidenau"
	next "<DOWN> Capparia City"
	done

Route69_Trainer_1:
	trainer EVENT_ROUTE_69_TRAINER_1, HIKER, 2, .before_battle_text, .battle_won_text

	ctxt "Es ist unmöglich,"
	line "alles vorherzu-"
	cont "sehen."
	done

.before_battle_text
	ctxt "Als Trainer, musst"
	line "du auf alles vor-"
	cont "bereitet sein."
	done

.battle_won_text
	ctxt "Wie unerwartet."
	done

Route69_Trainer_2:
	trainer EVENT_ROUTE_69_TRAINER_2, HIKER, 3, .before_battle_text, .battle_won_text

	ctxt "Warum bin ich nur"
	line "so verdammt toll?"
	done

.before_battle_text
	ctxt "Du hälst dich wohl"
	line "für ganz toll?"

	para "Aber verglichen"
	line "mit mir <...>?"
	done

.battle_won_text
	ctxt "<...> bist du doch"
	line "ziemlich toll."
	done

Route69_Trainer_3:
	trainer EVENT_ROUTE_69_TRAINER_3, HIKER, 15, .before_battle_text, .battle_won_text

	ctxt "Mit seinen #mon"
	line "wandern zu gehen,"
	cont "ist das Beste!"
	done

.before_battle_text
	ctxt "Meine #mon"
	line "und ich, lieben"
	cont "das Wandern."
	done

.battle_won_text
	ctxt "Wir brauchen wohl"
	line "mal eine Pause."
	done

Route69_Trainer_4:
	trainer EVENT_ROUTE_69_TRAINER_4, BLACKBELT_T, 2, .before_battle_text, .battle_won_text

	ctxt "Ich muss noch viel"
	line "härter trainieren,"
	cont "als zuvor!"
	done

.before_battle_text
	ctxt "Ich trainiere hier"
	line "täglich mit meinen"
	cont "treuen #mon!"
	done

.battle_won_text
	ctxt "Waaaargh!"
	done

Route69_Trainer_5:
	trainer EVENT_ROUTE_69_TRAINER_5, COOLTRAINERM, 3, .before_battle_text, .battle_won_text

	ctxt "Es ist wichtig,"
	line "seine Schwächen zu"
	para "kennen, um besser"
	line "zu werden."

	done

.before_battle_text
	ctxt "Ich hab' echt"
	line "was drauf!"
	done

.battle_won_text
	ctxt "Ich habe versagt."
	done

Route69_Trainer_6:
	trainer EVENT_ROUTE_69_TRAINER_6, COOLTRAINERF, 1, .before_battle_text, .battle_won_text

	ctxt "Vielleicht kannst"
	line "du mir ja etwas"
	cont "beibringen <...>"

	para "Nicht?"

	para "Wie frech!"
	done

.before_battle_text
	ctxt "Was ist deine"
	line "Strategie?"
	done

.battle_won_text
	ctxt "<...> Echt?"
	done

IlkBrotherHouseBlockLeaving:
	checkevent EVENT_ROUTE_69_ILK_BRO_TRAPPED
	sif false
		end
	showtext .text
	applymovement PLAYER, .move_player_up
	disappear PLAYER
	warpsound
	special Special_BattleTowerFade
	waitsfx
	warpfacing UP, ROUTE_69_ILKBROTHERHOUSE, 4, 9
	playmusic MUSIC_RIVAL_ENCOUNTER
	end

.move_player_up
	step_up
	step_end

.text
	ctxt "Wohin mit dein"
	line "Leben?"

	para "Komm wieder rein"
	line "und halte das"
	cont "Kind auf."
	sdone

Route69_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def 84, 6, 2, ROUTE_69_GATE
	warp_def 85, 6, 3, ROUTE_69_GATE
	warp_def 65, 11, 1, ROUTE_69_ILKBROTHERHOUSE
	warp_def 59, 14, 2, MOUND_UPPERAREA

	;xy triggers
	db 1
	xy_trigger 0, 66, 11, IlkBrotherHouseBlockLeaving

	;signposts
	db 1
	signpost 5, 11, SIGNPOST_LOAD, Route69DirectionsSign

	;people-events
	db 10
	person_event SPRITE_HIKER, 19, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route69_Trainer_1, -1
	person_event SPRITE_HIKER, 24, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route69_Trainer_2, -1
	person_event SPRITE_HIKER, 41, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route69_Trainer_3, -1
	person_event SPRITE_BLACK_BELT, 48, 7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route69_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 58, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route69_Trainer_5, -1
	person_event SPRITE_COOLTRAINER_F, 4, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route69_Trainer_6, -1
	person_event SPRITE_POKE_BALL, 63, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POTION, EVENT_ROUTE_69_ITEM_POTION
	person_event SPRITE_POKE_BALL, 79, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MIRACLE_SEED, EVENT_ROUTE_69_ITEM_MIRACLE_SEED
	person_event SPRITE_POKE_BALL, 52, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NUGGET, EVENT_ROUTE_69_ITEM_NUGGET
	person_event SPRITE_POKE_BALL, 34, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_FURY_CUTTER, 0, EVENT_ROUTE_69_TM
