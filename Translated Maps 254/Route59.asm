Route59_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route59HiddenItem:
	dw EVENT_ROUTE_59_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route59DirectionsSign:
	ctxt "Jaeru Ebenen"
	next "<UP> Silph Co. Lager"
	next "<UP><RIGHT> Botania City"
	next "<LEFT> Jaeru City"
	done

Route59_Trainer_1:
	trainer EVENT_ROUTE_59_TRAINER_1, JUGGLER, 2, .before_battle_text, .battle_won_text
	ctxt "Jetzt wo die Lage"
	line "in Botania City"
	para "nicht mehr so"
	line "angespannt ist,"
	para "kann jeder ohne"
	line "probleme vorbei."
	done

.before_battle_text
	ctxt "Botania City ist"
	line "nicht mehr unter"
	cont "Quarantäne!"
	done

.battle_won_text
	ctxt "Schade, das die"
	line "hier kein #mon"
	cont "Center haben, denn"
	para "ich könnte jetzt"
	line "einen brauchen."
	done

Route59_Trainer_2:
	trainer EVENT_ROUTE_59_TRAINER_2, FIREBREATHER, 4, .before_battle_text, .battle_won_text
	ctxt "Zeit etwas mehr"
	line "Maisstärke zu"
	cont "nehmen."
	done

.before_battle_text
	ctxt "Die Mitte dieses"
	line "Grasfeldes ist"
	para "der beste Ort um"
	line "meine Feuer-Spuck-"
	cont "Künste zu zeigen!"
	done

.battle_won_text
	ctxt "Komm runter, du"
	line "hast nur gewonnen."
	para "Ist ja nicht so"
	line "das du jetzt Champ"
	cont "geworden bist <...>"
	para "Moment mal <...>"
	line "Du bist der CHAMP!"
	done

Route59_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 3, 54, 1, SILPH_WAREHOUSE_F1
	warp_def 5, 63, 2, ROUTE_59_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 55, SIGNPOST_LOAD, Route59DirectionsSign
	signpost 12, 17, SIGNPOST_ITEM, Route59HiddenItem

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 11, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWORDS_DANCE, 0, EVENT_ROUTE_59_NPC_1
	person_event SPRITE_JUGGLER, 10, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route59_Trainer_1, -1
	person_event SPRITE_FIREBREATHER, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route59_Trainer_2, -1