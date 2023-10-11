Route54_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route54HiddenItem:
	dw EVENT_ROUTE_54_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route54Signpost:
	ctxt "Merson Pass"
	next "<UP> Merson Cave"
	next "  Entrance"
	next "<RIGHT> Merson City"
	done

Route54_Trainer_1:
	trainer EVENT_ROUTE_54_TRAINER_1, LASS, 3, .before_battle_text, .battle_won_text

	ctxt "Always prefer"
	line "cute!"
	done

.before_battle_text
	ctxt "Cutey cute cute!"
	done

.battle_won_text
	ctxt "Oh well, good"
	line "game!"
	done

Route54_Trainer_2:
	trainer EVENT_ROUTE_54_TRAINER_2, SAGE, 7, .before_battle_text, .battle_won_text

	ctxt "How you react to"
	line "unexpected situa-"
	para "tions is more"
	line "important than the"
	para "situations"
	line "themselves."
	done

.before_battle_text
	ctxt "I have found inner"
	line "peace."
	done

.battle_won_text
	ctxt "I remain"
	line "emotionless."
	done

Route54_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $3, $28, 2, MERSON_CAVE_B1F

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 9, 45, SIGNPOST_LOAD, Route54Signpost
	signpost 15, 52, SIGNPOST_ITEM, Route54HiddenItem

	;people-events
	db 3
	person_event SPRITE_COOLTRAINER_F, 13, 51, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route54_Trainer_1, -1
	person_event SPRITE_SAGE, 6, 42, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route54_Trainer_2, -1
	person_event SPRITE_FRUIT_TREE, 9, 54, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, GREEN_APRICORN_TREE_1, -1
