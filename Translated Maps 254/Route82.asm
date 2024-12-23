Route82_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route82HiddenItem:
	dw EVENT_ROUTE_82_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route82DirectionsSign:
	ctxt "<LEFT> Torenia City"
	next "<RIGHT> Akania-Hafen"
	done

Route82IslandSign:
	signpostheader 5
	done

Route82_Trainer_1:
	trainer EVENT_ROUTE_82_TRAINER_1, FISHER, 12, .before_battle_text, .battle_won_text
	ctxt "-Seufz- Es würde"
	line "mich nicht wundern"
	para "wenn die Relicanth"
	line "aussterben"
	cont "würden <...>"
	para "Die Menschen ver-"
	line "schmutzen mit dem"
	para "ganzen Müll"
	line "den Ozean."
	done

.before_battle_text
	ctxt "Ich werde mir ein"
	line "Relicanth fangen!"
	done

.battle_won_text
	ctxt "Oh maaan!"
	done

Route82_Trainer_2:
	trainer EVENT_ROUTE_82_TRAINER_2, FISHER, 13, .before_battle_text, .battle_won_text
	ctxt "Ich ritt mein"
	line "#mon während"
	cont "ich am Angeln war."
	para "Als es mich nicht"
	line "mehr tragen konnte"
	para "ging ich an den"
	line "Hafen."
	done

.before_battle_text
	ctxt "Unterhalb des"
	line "Hafens findet man"
	para "bestimmt die"
	line "seltensten Fisch-"
	cont "#mon."
	done

.battle_won_text
	ctxt "NEIN, NEIN, NEIN!"
	done

Route82_Trainer_3:
	trainer EVENT_ROUTE_82_TRAINER_3, COOLTRAINERF, 3, .before_battle_text, .battle_won_text
	ctxt "Es begeistert mich"
	line "jedesmal, Trainer"
	para "mit starken"
	line "#mon zu sehen."
	para "Ich treffe leider"
	line "viel zu selten auf"
	para "leute die gut"
	line "Kämpfen können!"
	done

.before_battle_text
	ctxt "Hey, du siehst"
	line "stark aus!"
	para "Zeig mir bitte"
	line "deine #mon!"
	done

.battle_won_text
	ctxt "Das war Spaßig!"
	done

Route82_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 5
	warp_def $a, $4, 3, ROUTE_82_GATE
	warp_def $b, $4, 4, ROUTE_82_GATE
	warp_def $3, $1c, 1, ROUTE_82_MONKEY
	warp_def $d, $2a, 1, ROUTE_82_CAVE
	warp_def $b, $30, 2, ROUTE_82_CAVE

	;xy triggers
	db 0

	;signposts
	db 3
	signpost  9,  5, SIGNPOST_LOAD, Route82DirectionsSign
	signpost  6, 34, SIGNPOST_ITEM, Route82HiddenItem
	signpost  9,  7, SIGNPOST_LOAD, Route82IslandSign

	;people-events
	db 6
	person_event SPRITE_FISHER, 14, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_1, -1
	person_event SPRITE_FISHER,  6, 45, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_2, -1
	person_event SPRITE_COOLTRAINER_F, 15, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_3, -1
	person_event SPRITE_FRUIT_TREE, 14, 50, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_FRUITTREE, 0, PERSIM_TREE_1, -1
	person_event SPRITE_POKE_BALL,  6, 50, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SILK_SCARF, EVENT_ROUTE_82_ITEM_SILK_SCARF
	person_event SPRITE_POKE_BALL,  5,  9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, THUNDERSTONE, EVENT_ROUTE_82_ITEM_THUNDERSTONE