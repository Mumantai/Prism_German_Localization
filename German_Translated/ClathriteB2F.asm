ClathriteB2F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ClathriteB2F_GoldToken:
	dw EVENT_CLATHRITE_B2F_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

ClathriteB2F_Trainer_1:
	trainer EVENT_CLATHRITE_B2F_TRAINER_1, BOARDER, 3, .before_battle_text, .defeated_text

	ctxt "Die Stadt im"
	line "Westen war einst"
	para "komplett unter"
	line "Wasser."

	para "Wie ist das nur"
	line "möglich gewesen?"
	done

.before_battle_text:
	ctxt "Diese Puzzles sind"
	line "sehr aufregend,"
	cont "nicht wahr?"
	done

.defeated_text:
	ctxt "Findest du sie"
	line "nicht aufregend?"
	done

ClathriteB2F_Trainer_2:
	trainer EVENT_CLATHRITE_B2F_TRAINER_2, SKIER, 3, .before_battle_text, .defeated_text

	ctxt "Und findest du"
	line "mich eigentlich"
	cont "auch Wunderschön?"

	para "Komm schon!"
	line "Rede mit mir!"
	done

.before_battle_text:
	ctxt "Diese Höhle ist"
	line "Wunderschön!"
	done

.defeated_text:
	ctxt "Meine #mon sind"
	line "auch Wunderschön!"
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
	db 7
	person_event SPRITE_BOULDER, 44, 44, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 35, 25, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 12, 47, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_POKE_BALL, 20, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DRAGON_FANG, EVENT_CLATHRITE_B2F_ITEM_DRAGON_FANG
	person_event SPRITE_POKE_BALL, 24, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DRAGON_CLAW, 0, EVENT_GOT_TM07
	person_event SPRITE_BOARDER, 41, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, ClathriteB2F_Trainer_1, -1
	person_event SPRITE_BUENA, 18, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, ClathriteB2F_Trainer_2, -1
