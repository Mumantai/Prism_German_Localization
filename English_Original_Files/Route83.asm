Route83_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route83HiddenItem:
	dw EVENT_ROUTE_83_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route83DirectionsSign:
	ctxt "<LEFT>  Mound Cave"
	next "<RIGHT>  Torenia City"
	next "<LEFT><DOWN> Route 73"
	done

Route83IslandSign:
	signpostheader 5
	done

Route83BlockingDude:
	ctxt "Hello!"

	para "Sorry, I just HAVE"
	line "to tie my shoes on"
	cont "this very spot<...>"
	done

Route83_Trainer:
	trainer EVENT_ROUTE_83_TRAINER_1, SCHOOLBOY, 3, .before_battle_text, .battle_won_text

	ctxt "I like video games"
	line "more than school."

	para "Hehe."
	done

.before_battle_text
	ctxt "Round 1: FIGHT!"
	done

.battle_won_text
	text "FATALITY!"
	done

Route83_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 9, 8, 1, MOUND_UPPERAREA

.CoordEvents: db 0

.BGEvents: db 3
	signpost 5, 32, SIGNPOST_ITEM, Route83HiddenItem
	signpost 9, 55, SIGNPOST_LOAD, Route83DirectionsSign
	signpost 7, 35, SIGNPOST_LOAD, Route83IslandSign

.ObjectEvents: db 4
	person_event SPRITE_SCHOOLBOY, 7, 43, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route83_Trainer, -1
	person_event SPRITE_SCHOOLBOY, 10, 27, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route83BlockingDude, EVENT_LAUREL_FOREST_MAIN_TRAINER_2
	person_event SPRITE_POKE_BALL, 5, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POISON_BARB, EVENT_ROUTE_83_ITEM_POISON_BARB
	person_event SPRITE_POKE_BALL, 9, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, REPEL, EVENT_ROUTE_83_ITEM_REPELS
