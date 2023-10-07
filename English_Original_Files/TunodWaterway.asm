TunodWaterway_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

TunodWaterwayHiddenItem:
	dw EVENT_TUNOD_WATERWAY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

TunodWaterway_Trainer_1:
	trainer EVENT_TUNOD_WATERWAY_TRAINER_1, SWIMMERM, 11, .before_battle_text, .battle_won_text

	ctxt "You should be"
	line "grateful that we"
	para "now have the"
	line "technology to tame"
	cont "#mon."
	done

.before_battle_text
	ctxt "Swim for yourself"
	line "like I do!"
	done

.battle_won_text
	ctxt "I thought my"
	line "#mon would have"
	para "more energy by not"
	line "carrying me"
	cont "around<...>"
	done

TunodWaterway_Trainer_2:
	trainer EVENT_TUNOD_WATERWAY_TRAINER_2, SWIMMERF, 8, .before_battle_text, .battle_won_text

	ctxt "We lose more and"
	line "more privacy every"
	para "time the world"
	line "decides to become"
	cont "smaller."
	done

.before_battle_text
	ctxt "This used to be my"
	line "secret spot, until"
	para "Southerly opened"
	line "up that path<...>"
	done

.battle_won_text
	ctxt "Do you see now why"
	line "I wanted this"
	cont "place to myself?"
	done

TunodWaterway_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def  7,  4, 1, OLCAN_CHINE_ENTRANCE

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 12, 50, SIGNPOST_ITEM, TunodWaterwayHiddenItem

	;people-events
	db 3
	person_event SPRITE_FRUIT_TREE,  5, 38, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, RAWST_TREE_1, -1
	person_event SPRITE_SWIMMER_GUY, 11, 41, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TunodWaterway_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL,  7, 60, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TunodWaterway_Trainer_2, -1
