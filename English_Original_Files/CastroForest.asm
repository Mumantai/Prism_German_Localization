CastroForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroForest_GoldToken:
	dw EVENT_CASTRO_FOREST_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

CastroForest_EmeraldEgg:
	dw EVENT_CASTRO_FOREST_HIDDENITEM_EMERALD_EGG
	db EMERALD_EGG

CastroForest_Trainer_1:
	trainer EVENT_CASTRO_FOREST_TRAINER_1, SAGE, 4, .before_battle_text, .defeated_text

	ctxt "Many of us have"
	line "fled Naljo to"
	cont "ensure our safety."
	done

.before_battle_text
	ctxt "A fool woke up the"
	line "mighty Varaneous!"

	para "Wait, you saw the"
	line "revival?"
	done

.defeated_text
	ctxt "At least we're"
	line "safe here."
	done

CastroForest_Trainer_2:
	trainer EVENT_CASTRO_FOREST_TRAINER_2, SAGE, 5, .before_battle_text, .defeated_text

	ctxt "I was raised to"
	line "believe that the"
	para "guardians were"
	line "reasonable."

	para "If they are truly"
	line "savages, then I"
	para "never want to"
	line "return to Naljo."
	done

.before_battle_text
	ctxt "I'm a Naljo"
	line "descendent."

	para "I felt safe until"
	line "I learned that"
	para "Varaneous attacked"
	line "another Naljo"
	cont "descendent."
	done

.defeated_text
	ctxt "How droll."
	done

CastroForestRoadBlockNPC:
	ctxt "This is currently"
	line "a sacred area."

	para "You are not"
	line "permitted to"
	cont "enter for now."
	done

CastroForest_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def 29, 35, 1, CASTRO_GATE
	warp_def 29, 34, 1, CASTRO_GATE
	warp_def 11, 8, 2, ROUTE_62_GATE
	warp_def 29, 12, 1, CASTRO_FOREST_GATE_SOUTH
	warp_def 29, 13, 1, CASTRO_FOREST_GATE_SOUTH
	warp_def 10, 8, 2, ROUTE_62_GATE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 2, 5, SIGNPOST_ITEM, CastroForest_GoldToken
	signpost 27, 24, SIGNPOST_ITEM, CastroForest_EmeraldEgg

.ObjectEvents
	db 6
	person_event SPRITE_SAGE, 9, 25, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, CastroForest_Trainer_1, -1
	person_event SPRITE_SAGE, 7, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, CastroForest_Trainer_2, -1
	person_event SPRITE_SAGE, 22, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 2, CastroForestRoadBlockNPC, EVENT_RIJON_SECOND_PART
	person_event SPRITE_POKE_BALL, 28, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, SITRUS_BERRY, EVENT_CASTRO_FOREST_ITEM_SITRUS_BERRIES
	person_event SPRITE_POKE_BALL, 23, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SMOKE_BALL, EVENT_CASTRO_FOREST_ITEM_SMOKE_BALL
	person_event SPRITE_FRUIT_TREE, 19, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_FRUITTREE, 0, ORANGE_APRICORN_TREE_1, -1
