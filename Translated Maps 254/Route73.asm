Route73_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route73HiddenItem:
	dw EVENT_ROUTE_73_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route73DirectionsSign:
	ctxt "<UP> Felsgrabhöhle"
	next "<UP><UP> Euphorbia City"
	next "<DOWN> Oxalia City"
	next "<UP><RIGHT> Torenia City"
	done

Route73IslandSign:
	signpostheader 6
	done

Route73BlockingDude:
	ctxt "Momentan kannst du"
	line "nicht passieren."
	para "Die #mon vor"
	line "dir, sind zu"
	cont "stark für dich."
	para "Wenn du Josiah"
	line "besiegst, könntest"
	cont "du mich vieleicht"
	cont "umstimmen."
	para "Hah! Als ob das"
	line "passieren wird."
	done

Route73_Trainer_1:
	trainer EVENT_ROUTE_73_TRAINER_1, PICNICKER, 2, .before_battle_text, .battle_won_text
	ctxt "Josiah's Kampfstil"
	line "ist Heiß!"
	para "Wortwörtlich!"
	done

.before_battle_text
	ctxt "Wie war es gegen"
	line "Josiah zu kämpfen?"
	done

.battle_won_text
	ctxt "Nun weiss ich es<...>"
	done

Route73_Trainer_2:
	trainer EVENT_ROUTE_73_TRAINER_2, BIRD_KEEPER, 1, .before_battle_text, .battle_won_text
	ctxt "Du musst schnell"
	line "sein in Kämpfen!"
	done

.before_battle_text
	ctxt "Überlege schnell!"
	done

.battle_won_text
	ctxt "Aww! Ich war nicht"
	line "schnell genug!"
	done

Route73_Trainer_3:
	trainer EVENT_ROUTE_73_TRAINER_3, BUG_CATCHER, 2, .before_battle_text, .battle_won_text
	ctxt "Was ist der Sch-"
	line "lüssel zum Sieg?"
	para "Motivation!"
	done

.before_battle_text
	ctxt "Du musst an deine"
	line "#mon glauben!"
	done

.battle_won_text
	ctxt "Zu viele Fehl-"
	line "entscheidungen<...>"
	done

Route73_Trainer_4:
	trainer EVENT_ROUTE_73_TRAINER_4, JUGGLER, 1, .before_battle_text, .battle_won_text
	ctxt "Fang ein Elektro"
	line "und ein Feuer-typ"
	para "#mon bevor du"
	line "zur Höhle gehst."
	para "Vertrau mir!"
	done

.before_battle_text
	ctxt "Fang ein Elektro"
	line "und Feuer #mon!"
	done

.battle_won_text
	ctxt "Sei gewarnt!"
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