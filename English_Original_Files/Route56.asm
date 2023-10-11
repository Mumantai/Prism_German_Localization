Route56_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route56DirectionsSign:
	ctxt "Southedge Bay"
	next "<UP> City Underpass"
	next "<LEFT> Eagulou City"
	next "<RIGHT> Route 55"
	done

Route56HiddenItem_1:
	dw EVENT_ROUTE_56_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route56HiddenItem_2:
	dw EVENT_ROUTE_56_HIDDENITEM_SILVER_EGG
	db SILVER_EGG

Route56_Trainer_1:
	trainer EVENT_ROUTE_56_TRAINER_1, SWIMMERM, 7, .before_battle_text, .battle_won_text

	ctxt "I'll shave my hair"
	line "next time; it's"
	para "supposed to make"
	line "me swim faster,"
	cont "right?"
	done

.before_battle_text
	ctxt "Guess how many"
	line "laps I did!"
	done

.battle_won_text
	ctxt "I swam back and"
	line "forth hundreds of"
	cont "times."

	para "Seriously!"
	done

Route56_Trainer_2:
	trainer EVENT_ROUTE_56_TRAINER_2, SWIMMERF, 6, .before_battle_text, .battle_won_text

	ctxt "Come practice with"
	line "me sometime."
	done

.before_battle_text
	ctxt "Look at my"
	line "backstroke!"
	done

.battle_won_text
	ctxt "Swimming while"
	line "battling is"
	cont "exciting!"
	done

Route56_Trainer_3:
	trainer EVENT_ROUTE_56_TRAINER_3, SWIMMERM, 8, .before_battle_text, .battle_won_text

	ctxt "Swimming will keep"
	line "you fit."

	para "When you surf,"
	line "your #mon get"
	para "the exercise, not"
	line "you!"
	done

.before_battle_text
	ctxt "Stroke!"
	done

.battle_won_text
	ctxt "That battle almost"
	line "gave me the other"
	cont "kind of stroke!"
	done

Route56_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $5, $23, 2, ROUTE_56_GATE_UNDERGROUND
	warp_def $d, $5d, 1, ROUTE_56_GATE

	;xy triggers
	db 0

	;signposts
	db 3
	signpost  2, 77, SIGNPOST_ITEM, Route56HiddenItem_1
	signpost 17, 52, SIGNPOST_ITEM, Route56HiddenItem_2
	signpost  7, 37, SIGNPOST_LOAD, Route56DirectionsSign

	;people-events
	db 3
	person_event SPRITE_SWIMMER_GUY, 11, 72, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 42, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY,  9, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route56_Trainer_3, -1
