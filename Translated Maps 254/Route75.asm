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
	ctxt "Die Schule stiehlt"
	line "mir die Zeit <...>"
	done

.before_battle_text
	ctxt "Ich zeige dir, was"
	line "ich in der Schule"
	cont "gelernt habe."
	done

.battle_won_text
	ctxt "Ich hab wohl nicht"
	line "gut aufgepasst."
	done

Route75_Trainer_2:
	trainer EVENT_ROUTE_75_TRAINER_2, LASS, 1, .before_battle_text, .battle_won_text
	ctxt "Ich brauche ein"
	line "Paar Turbotreter!"
	done

.before_battle_text
	ctxt "Du siehst gut aus,"
	line "aber <...> nicht gut"
	cont "genug für mich!"
	done

.battle_won_text
	ctxt "Ich sehe, du"
	line "kämpft echt gut."
	done

Route75_Trainer_3:
	trainer EVENT_ROUTE_75_TRAINER_3, BIRD_KEEPER, 2, .before_battle_text, .battle_won_text
	ctxt "Ich hoffe, eines"
	line "Tages so gut wie"
	cont "Falkner zu werden!"
	done

.before_battle_text
	ctxt "#mon greifen"
	line "so anmutig an!"
	done

.battle_won_text
	ctxt "Aber ich gebe"
	line "gerne an <...>"
	done

Route75_Trainer_4:
	trainer EVENT_ROUTE_75_TRAINER_4, BEAUTY, 2, .before_battle_text, .battle_won_text
	ctxt "Solange meine"
	line "#mon bei mir"
	para "sind, bin ich"
	line "glücklich."
	done

.before_battle_text
	ctxt "Ich habe süße"
	line "#mon, guck!"
	done

.battle_won_text
	ctxt "Süße allein,"
	line "reicht nicht?"
	done

Route75_Trainer_5:
	trainer EVENT_ROUTE_75_TRAINER_5, SAILOR, 2, .before_battle_text, .battle_won_text
	ctxt "Welche Region ist"
	line "nochmal im Norden?"
	done

.before_battle_text
	ctxt "Oh, Mist!"
	para "Was ist mit der"
	line "Brücke passiert?"
	done

.battle_won_text
	ctxt "Du bist wirklich"
	line "weltklasse!"
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