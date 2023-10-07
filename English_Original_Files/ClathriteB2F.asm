ClathriteB2F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_OBJECTS, .check_puzzle

.check_puzzle
	checkevent EVENT_SOLVED_KYOGRE_PUZZLE
	sif false
		return
	moveperson 2, 57, 32
	appear 2
	return

ClathriteB2F_GoldToken:
	dw EVENT_CLATHRITE_B2F_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

ClathriteB2F_Trainer_1:
	trainer EVENT_CLATHRITE_B2F_TRAINER_1, BOARDER, 3, .before_battle_text, .defeated_text

	ctxt "The city to the"
	line "west used to be"
	para "fully submerged"
	line "underwater."

	para "How is that even"
	line "remotely possible?"
	done

.before_battle_text:
	ctxt "These puzzles are"
	line "super exciting,"
	cont "don't you think?"
	done

.defeated_text:
	ctxt "You don't think"
	line "they're exciting?"
	done

ClathriteB2F_Trainer_2:
	trainer EVENT_CLATHRITE_B2F_TRAINER_2, SKIER, 3, .before_battle_text, .defeated_text

	ctxt "What about me, am"
	line "I beautiful then?"

	para "Come on!"
	line "Talk to me!"
	done

.before_battle_text:
	ctxt "This cave is oh"
	line "so beautiful!"
	done

.defeated_text:
	ctxt "My #mon are"
	line "beautiful too,"
	cont "right<...>?"
	done

ClathriteB2F_MapEventHeader:: db 0, 0

.Warps
	db 9
	warp_def 15, 3, 1, CLATHRITE_B1F
	warp_def 13, 47, 6, CLATHRITE_B2F
	warp_def 53, 57, 3, CLATHRITE_B1F
	warp_def 53, 27, 8, CLATHRITE_B2F
	warp_def 5, 55, 7, CLATHRITE_B2F
	warp_def 31, 15, 2, CLATHRITE_B2F
	warp_def 45, 43, 5, CLATHRITE_B2F
	warp_def 35, 17, 4, CLATHRITE_B2F
	warp_def 29, 55, 1, CLATHRITE_KYOGRE

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 28, 15, SIGNPOST_ITEM, ClathriteB2F_GoldToken

.ObjectEvents
	db 6
	person_event SPRITE_BOULDER, 44, 44, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 35, 25, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_POKE_BALL, 20, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DRAGON_FANG, EVENT_CLATHRITE_B2F_ITEM_DRAGON_FANG
	person_event SPRITE_POKE_BALL, 24, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DRAGON_CLAW, 0, EVENT_GOT_TM07
	person_event SPRITE_BOARDER, 41, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, ClathriteB2F_Trainer_1, -1
	person_event SPRITE_BUENA, 18, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, ClathriteB2F_Trainer_2, -1
