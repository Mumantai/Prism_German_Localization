Route69South_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route69South_DirectionsSign:
	signpostheader 3
	ctxt "Please stop tak-"
	next "ing the signs."
	nl   ""
	next "<UP> Heath Village"
	next "<DOWN> Caper Ridge"
	done

Route69South_IslandSign:
	signpostheader 6
	done

Route69South_Trainer_1:
	trainer EVENT_ROUTE_69_TRAINER_1, HIKER, 2, .before_battle_text, .battle_won_text

	ctxt "It's impossible to"
	line "predict every"
	cont "single thing."
	done

.before_battle_text
	ctxt "As a Trainer, you"
	line "must be prepared"
	cont "for anything."
	done

.battle_won_text
	ctxt "Oh, I lost that!"
	done

Route69South_Trainer_2:
	trainer EVENT_ROUTE_69_TRAINER_2, HIKER, 3, .before_battle_text, .battle_won_text

	ctxt "I'm so slick, that"
	line "I detest Crobat."
	done

.before_battle_text
	ctxt "You think you're"
	line "slick, don't you?"

	para "You're nothing"
	line "compared to me!"
	done

.battle_won_text
	ctxt "Not slick enough!"
	done

Route69South_Trainer_3:
	trainer EVENT_ROUTE_69_TRAINER_3, HIKER, 15, .before_battle_text, .battle_won_text

	ctxt "Going on hikes is"
	line "more fun with your"
	cont "#mon!"
	done

.before_battle_text
	ctxt "My #mon enjoy a"
	line "hike just as much"
	cont "as I do."
	done

.battle_won_text
	ctxt "They experience"
	line "losses too!"
	done

Route69South_Trainer_4:
	trainer EVENT_ROUTE_69_TRAINER_4, BLACKBELT_T, 2, .before_battle_text, .battle_won_text

	ctxt "I must train with"
	line "my #mon even"
	cont "harder now!"
	done

.before_battle_text
	ctxt "I come here to"
	line "train here every"
	para "day with my loyal"
	line "#mon!"
	done

.battle_won_text
	ctxt "Waaaargh!"
	done

Route69South_Trainer_5:
	trainer EVENT_ROUTE_69_TRAINER_5, COOLTRAINERM, 2, .before_battle_text, .battle_won_text

	ctxt "It's important to"
	line "recognize your"
	para "flaws, so you can"
	line "improve."

	para "Self-discipline."
	done

.before_battle_text
	ctxt "You cannot deny my"
	line "awesome skill!"
	done

.battle_won_text
	ctxt "I admit defeat."
	done

Route69South_Trainer_6:
	trainer EVENT_ROUTE_69_TRAINER_6, COOLTRAINERF, 1, .before_battle_text, .battle_won_text

	ctxt "Perhaps you can"
	line "teach me a thing"
	cont "or two<...>"

	para "No?"

	para "How rude!"
	done

.before_battle_text
	ctxt "What are your"
	line "battle methods?"
	done

.battle_won_text
	ctxt "<...>Really?"
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
	ctxt "Where are you"
	line "going?"

	para "Please come back"
	line "inside and stop"
	cont "that crazy kid!"
	sdone

Route69South_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 5
	warp_def 84, 6, 2, ROUTE_69_SOUTH_GATE
	warp_def 85, 6, 3, ROUTE_69_SOUTH_GATE
	warp_def 65, 11, 1, ROUTE_69_ILKBROTHERHOUSE
	warp_def 59, 14, 2, MOUND_UPPERAREA
	warp_def 5, 9, 3, ROUTE_69_NORTH_GATE

	;xy triggers
	db 1
	xy_trigger 0, 66, 11, IlkBrotherHouseBlockLeaving

	;signposts
	db 2
	signpost 69,  3, SIGNPOST_LOAD, Route69South_DirectionsSign
	signpost 83,  7, SIGNPOST_LOAD, Route69South_IslandSign

	;people-events
	db 10
	person_event SPRITE_HIKER, 19, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route69South_Trainer_1, -1
	person_event SPRITE_HIKER, 24, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route69South_Trainer_2, -1
	person_event SPRITE_HIKER, 39, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route69South_Trainer_3, -1
	person_event SPRITE_BLACK_BELT, 48, 7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route69South_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 58, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route69South_Trainer_5, -1
	person_event SPRITE_COOLTRAINER_F,  8,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route69South_Trainer_6, -1
	person_event SPRITE_POKE_BALL, 63, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POTION, EVENT_ROUTE_69_ITEM_POTION
	person_event SPRITE_POKE_BALL, 79, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MIRACLE_SEED, EVENT_ROUTE_69_ITEM_MIRACLE_SEED
	person_event SPRITE_POKE_BALL, 52, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NUGGET, EVENT_ROUTE_69_ITEM_NUGGET
	person_event SPRITE_POKE_BALL, 34, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_FURY_CUTTER, 0, EVENT_ROUTE_69_TM
