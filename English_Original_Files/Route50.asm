Route50_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route50HiddenItem:
	dw EVENT_ROUTE_50_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route50DirectionsSign:
	ctxt "Origal Maze"
	next "<LEFT>  Route 50"
	next "<RIGHT><UP> Route 49"
	done

Route50_Trainer_1:
	trainer EVENT_ROUTE_50_TRAINER_1, BUG_CATCHER, 6, .before_battle_text, .battle_won_text

	ctxt "I'm just going to"
	line "sit here and wait"
	para "for another"
	line "Trainer to come."
	done

.before_battle_text
	ctxt "Neat little place"
	line "to hide, huh?"
	done

.battle_won_text
	ctxt "Less hiding and"
	line "more training."
	done

Route50_Trainer_2:
	trainer EVENT_ROUTE_50_TRAINER_2, BURGLAR, 1, .before_battle_text, .battle_won_text

	ctxt "You can get to"
	line "Azalea Town if you"
	cont "keep going north!"
	done

.before_battle_text
	ctxt "I came from Johto!"
	done

.battle_won_text
	ctxt "Where are you"
	line "from?"

	para "Never heard of it."
	done

Route50_Trainer_3:
	trainer EVENT_ROUTE_50_TRAINER_3, SUPER_NERD, 5, .before_battle_text, .battle_won_text

	ctxt "I don't need your"
	line "help right now."
	done

.before_battle_text
	ctxt "Wait!"
	done

.battle_won_text
	ctxt "Thanks for your"
	line "time."
	done

Route50_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $5, $30, 3, ROUTE_50_GATE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 5, 43, SIGNPOST_LOAD, Route50DirectionsSign
	signpost 7, 21, SIGNPOST_ITEM, Route50HiddenItem

	;people-events
	db 5
	person_event SPRITE_BUG_CATCHER, 2, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route50_Trainer_1, -1
	person_event SPRITE_BURGLAR, 6, 41, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route50_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 5, 24, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, Route50_Trainer_3, -1
	person_event SPRITE_POKE_BALL, 11, 28, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_STEEL_WING, 0, EVENT_ROUTE_50_TM
	person_event SPRITE_FRUIT_TREE, 2, 38, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_FRUITTREE, 0, YELLOW_APRICORN_TREE_1, -1
