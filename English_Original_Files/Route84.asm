Route84_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route84HiddenItem:
	dw EVENT_ROUTE_84_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route84DirectionsSign:
	ctxt "<LEFT> Phlox Town"
	next "<RIGHT> Clathrite"
	nl   "  Tunnel"
	done

Route84_Trainer_1:
	trainer EVENT_ROUTE_84_TRAINER_1, COOLTRAINERM, 9, .before_battle_text, .battle_won_text

	ctxt "Not even a little"
	line "bit surprised?"
	done

.before_battle_text
	ctxt "You've just been"
	line "fully ambushed!"

	para "Roll for"
	line "initiative!"
	done

.battle_won_text
	ctxt "Awww, you're no"
	line "fun<...> Boring."
	done

Route84_Trainer_2:
	trainer EVENT_ROUTE_84_TRAINER_2, SKIER, 1, .before_battle_text, .battle_won_text

	ctxt "Sometimes I like"
	line "to ski on the snow"
	cont "with my #mon!"

	para "Fun, huh?"
	done

.before_battle_text
	ctxt "That's a very fun"
	line "obstacle course"
	para "for skilled skiers"
	line "such as myself!"
	done

.battle_won_text
	ctxt "Dang it."
	done

Route84_Trainer_3:
	trainer EVENT_ROUTE_84_TRAINER_3, SKIER, 2, .before_battle_text, .battle_won_text

	ctxt "This region's odd"
	line "geography is said"
	para "to come from old"
	line "legendary #mon."

	para "They made this the"
	line "perfect place for"
	cont "some skating!"
	done

.before_battle_text
	ctxt "This region has"
	line "some really weird"
	cont "geography<...>"
	done

.battle_won_text
	ctxt "Not that I'm"
	line "complaining!"
	done

Route84_Trainer_4:
	trainer EVENT_ROUTE_84_TRAINER_4, HIKER, 13, .before_battle_text, .battle_won_text

	ctxt "I don't even need a"
	line "compass, hahaha!"
	done

.before_battle_text
	ctxt "That tunnel wasn't"
	line "much trouble."

	para "Just need to keep"
	line "proper track of"
	cont "where you're going!"
	done

.battle_won_text
	ctxt "Hold it."
	done

Route84_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 63, 5, CLATHRITE_1F
	warp_def 5, 7, 1, PHLOX_ENTRY

.CoordEvents: db 0

.BGEvents: db 2
	signpost 5, 42, SIGNPOST_ITEM, Route84HiddenItem
	signpost 9, 24, SIGNPOST_LOAD, Route84DirectionsSign

.ObjectEvents: db 6
	person_event SPRITE_COOLTRAINER_M, 8, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route84_Trainer_1, -1
	person_event SPRITE_BUENA, 11, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route84_Trainer_2, -1
	person_event SPRITE_BUENA, 10, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route84_Trainer_3, -1
	person_event SPRITE_HIKER, 7, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 4, Route84_Trainer_4, -1
	person_event SPRITE_FRUIT_TREE, 17, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, LUM_TREE_1, -1
	person_event SPRITE_POKE_BALL, 14, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NEVERMELTICE, EVENT_ROUTE_84_ITEM_NEVERMELTICE
