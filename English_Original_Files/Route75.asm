Route75_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route75HiddenItem_1:
	dw EVENT_ROUTE_75_HIDDENITEM_SAPPHIRE_EGG
	db SAPPHIRE_EGG

Route75HiddenItem_2:
	dw EVENT_ROUTE_75_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route75_Trainer_1:
	trainer EVENT_ROUTE_75_TRAINER_1, SCHOOLBOY, 2, .before_battle_text, .battle_won_text

	ctxt "School keeps me"
	line "way too busy<...>"
	done

.before_battle_text
	ctxt "Let me try some-"
	line "thing I learned"
	cont "at school today."
	done

.battle_won_text
	ctxt "I didn't study"
	line "enough, I guess."
	done

Route75_Trainer_2:
	trainer EVENT_ROUTE_75_TRAINER_2, LASS, 1, .before_battle_text, .battle_won_text

	ctxt "I need to get"
	line "some Running"
	cont "Shoes!"
	done

.before_battle_text
	ctxt "You look good,"
	line "but<...> not good"
	cont "enough for me!"
	done

.battle_won_text
	ctxt "I see. So you can"
	line "battle that way."
	done

Route75_Trainer_3:
	trainer EVENT_ROUTE_75_TRAINER_3, BIRD_KEEPER, 2, .before_battle_text, .battle_won_text

	ctxt "I hope to be as"
	line "good as my idol"
	cont "Falkner one day!"
	done

.before_battle_text
	ctxt "#mon strike"
	line "with such grace!"
	done

.battle_won_text
	ctxt "But I like showing"
	line "off<...>"
	done

Route75_Trainer_4:
	trainer EVENT_ROUTE_75_TRAINER_4, BEAUTY, 2, .before_battle_text, .battle_won_text

	ctxt "As long as I have"
	line "my #mon, I'm"
	cont "happy."
	done

.before_battle_text
	ctxt "I have cute"
	line "#mon, look!"
	done

.battle_won_text
	ctxt "Cuteness alone"
	line "can't win?"
	done

Route75_Trainer_5:
	trainer EVENT_ROUTE_75_TRAINER_5, SAILOR, 2, .before_battle_text, .battle_won_text

	ctxt "Which region is"
	line "north again?"
	done

.before_battle_text
	ctxt "Oh, snap!"

	para "What happened"
	line "to the bridge?"
	done

.battle_won_text
	ctxt "Your skill is"
	line "world class!"
	done

Route75_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $6, $25, 1, LAUREL_GATE
	warp_def $7, $25, 2, LAUREL_GATE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 11, 36, SIGNPOST_ITEM, Route75HiddenItem_1
	signpost 13, 18, SIGNPOST_ITEM, Route75HiddenItem_2

	;people-events
	db 6
	person_event SPRITE_SCHOOLBOY, 10, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route75_Trainer_1, -1
	person_event SPRITE_LASS, 6, 35, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route75_Trainer_2, -1
	person_event SPRITE_BIRDKEEPER, 10, 33, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route75_Trainer_3, -1
	person_event SPRITE_BEAUTY, 10, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, Route75_Trainer_4, -1
	person_event SPRITE_SAILOR, 6, 23, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, Route75_Trainer_5, -1
	person_event SPRITE_POKE_BALL, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_ROUTE_75_ITEM_PP_UP
