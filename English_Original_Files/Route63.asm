Route63_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route63HiddenItem:
	dw EVENT_ROUTE_63_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route63DirectionsSign:
	ctxt "Moraward Path"
	next "<LEFT> Hayward City"
	next "<RIGHT> Silk Tunnel"
	done

Route63_Trainer_1:
	trainer EVENT_ROUTE_63_TRAINER_1, BUG_CATCHER, 10, .before_battle_text, .battle_won_text

	ctxt "Bugs are super"
	line "effective against"
	cont "Psychic and Dark."

	para "Cool, huh?"
	done

.before_battle_text
	ctxt "Time for my swarm"
	line "of bugs to attack!"
	done

.battle_won_text
	ctxt "You didn't even"
	line "use bug spray!"
	done

Route63_Trainer_2:
	trainer EVENT_ROUTE_63_TRAINER_2, LASS, 6, .before_battle_text, .battle_won_text

	ctxt "That tunnel is"
	line "called Silk Tunnel"
	para "because it used to"
	line "be the biggest"
	para "source of wild"
	line "Caterpie."

	para "They all held silk"
	line "that people used"
	cont "to make clothes."

	para "Enjoyed your"
	line "history lesson?"
	done

.before_battle_text
	ctxt "I know why that"
	line "tunnel is called"
	cont "Silk Tunnel!"
	done

.battle_won_text
	ctxt "Curious?"
	done

Route63_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def  9, 54, 1, SILK_TUNNEL_1F

.CoordEvents: db 0

.BGEvents: db 2
	signpost  9,  3, SIGNPOST_LOAD, Route63DirectionsSign
	signpost 13, 24, SIGNPOST_ITEM, Route63HiddenItem

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 12, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_IRON_HEAD, 0, EVENT_ROUTE_63_TM
	person_event SPRITE_YOUNGSTER,  4, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route63_Trainer_1, -1
	person_event SPRITE_LASS,  8, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route63_Trainer_2, -1
	person_event SPRITE_FRUIT_TREE,  9, 47, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_FRUITTREE, 0, BLACK_APRICORN_TREE_1, -1
