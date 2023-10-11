Route73_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route73HiddenItem:
	dw EVENT_ROUTE_73_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route73DirectionsSign:
	ctxt "<UP>  Mound Cave"
	next "<UP><UP> Spurge City"
	next "<DOWN>  Oxalis City"
	next "<UP><RIGHT> Torenia City"
	done

Route73IslandSign:
	signpostheader 6
	done

Route73BlockingDude:
	ctxt "I'm not letting you"
	line "through right now."

	para "The #mon ahead"
	line "are too tough for"
	cont "a kid like you."

	para "Maybe<...> If you"
	line "defeated Josiah,"
	para "it could convince"
	line "me to move."

	para "Hah! As if that"
	line "could happen."
	done

Route73_Trainer_1:
	trainer EVENT_ROUTE_73_TRAINER_1, PICNICKER, 2, .before_battle_text, .battle_won_text

	ctxt "Josiah might be"
	line "tough, but he's"
	cont "also hot!"

	para "Literally!"
	done

.before_battle_text
	ctxt "How did you do"
	line "against Josiah?"
	done

.battle_won_text
	ctxt "I think I know<...>"
	done

Route73_Trainer_2:
	trainer EVENT_ROUTE_73_TRAINER_2, BIRD_KEEPER, 1, .before_battle_text, .battle_won_text

	ctxt "You always need"
	line "to think fast"
	cont "during battles."
	done

.before_battle_text
	ctxt "Think fast!"
	done

.battle_won_text
	ctxt "Yikes! I wasn't"
	line "fast enough!"
	done

Route73_Trainer_3:
	trainer EVENT_ROUTE_73_TRAINER_3, BUG_CATCHER, 2, .before_battle_text, .battle_won_text

	ctxt "What's the key"
	line "to good battles?"

	para "Motivation!"
	done

.before_battle_text
	ctxt "You must have"
	line "faith in your"
	cont "#mon!"
	done

.battle_won_text
	ctxt "I'm questioning my"
	line "decisions now<...>"
	done

Route73_Trainer_4:
	trainer EVENT_ROUTE_73_TRAINER_4, JUGGLER, 1, .before_battle_text, .battle_won_text

	ctxt "Catch an Electric"
	line "and a Fire-type"
	para "#mon before you"
	line "go into the cave."

	para "Trust me!"
	done

.before_battle_text
	ctxt "Catch an Electric"
	line "and Fire #mon!"
	done

.battle_won_text
	ctxt "Heed my warning!"
	done

Route73_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 33, 11, 1, ROUTE_73_GATE
	warp_def 33, 12, 2, ROUTE_73_GATE
	warp_def 1, 12, 1, MOUND_F1

.CoordEvents: db 0

.BGEvents: db 3
	signpost 2, 19, SIGNPOST_ITEM, Route73HiddenItem
	signpost 29, 15, SIGNPOST_LOAD, Route73DirectionsSign
	signpost 15, 13, SIGNPOST_LOAD, Route73IslandSign

.ObjectEvents: db 9
	person_event SPRITE_PICNICKER, 25, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route73_Trainer_1, -1
	person_event SPRITE_BIRDKEEPER, 24, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route73_Trainer_2, -1
	person_event SPRITE_BUG_CATCHER, 14, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route73_Trainer_3, -1
	person_event SPRITE_JUGGLER, 10, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route73_Trainer_4, -1
	person_event SPRITE_FRUIT_TREE, 30, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_FRUITTREE, 0, PECHA_TREE_1, -1
	person_event SPRITE_POKE_BALL, 10, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_ELIXIR, EVENT_ROUTE_73_ITEM_MAX_ELIXIR
	person_event SPRITE_POKE_BALL, 15, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, REPEL, EVENT_ROUTE_73_ITEM_REPELS
	person_event SPRITE_POKE_BALL, 30, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_WHIRLWIND, 0, EVENT_ROUTE_73_TM53
	person_event SPRITE_FISHER, 26, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route73BlockingDude, EVENT_ROUTE_73_GUARD
