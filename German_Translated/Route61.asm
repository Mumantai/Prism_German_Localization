Route61_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route61Sign:
	signpostheader 0
	text_jump Route62Sign

Route61_Trainer_1:
	trainer EVENT_ROUTE_61_TRAINER_1, FISHER, 8, .before_battle_text, .battle_won_text

	ctxt "Die Fische beißen"
	line "hier immer an."

	done

.before_battle_text
	ctxt "Hier ist mein"
	line "geheimer "
	cont "Angelplatz."

	done

.battle_won_text
	ctxt "Sag es niemandem!"

	done

Route61_Trainer_2:
	trainer EVENT_ROUTE_61_TRAINER_2, FISHER, 9, .before_battle_text, .battle_won_text

	ctxt "Vielleicht sollte"
	line "ich sie ein"
	para "bisschen am Haken"
	line "baumeln lassen,"
	para "bevor ich mich"
	line "entscheide, dass"
	para "sie mit mir in die"
	line "Stadt mitkommen"
	cont "sollen."

	done

.before_battle_text
	ctxt "Ich habe eine"
	line "super Angelrute."

	done

.battle_won_text
	ctxt "So habe ich diese"
	line "#mon gefangen!"

	done

Route61_Trainer_3:
	trainer EVENT_ROUTE_61_TRAINER_3, FISHER, 10, .before_battle_text, .battle_won_text

	ctxt "Es empfiehlt sich,"
	line "bei den Fischen zu"
	cont "schlafen."

	para "Immer noch falsch?"

	done

.before_battle_text
	ctxt "Haken, Schnur und"
	line "Senker!"

	done

.battle_won_text
	ctxt "Was, diese"
	line "Redewendung klappt"
	cont "hier nicht?"

	done

Route61_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 33, 13, 1, ROUTE_61_HOUSE2
	warp_def 31, 6, 2, ROUTE_61_GATE_SOUTH
	warp_def 65, 8, 1, ROUTE_61_GATE_NORTH
	warp_def 29, 13, 1, ROUTE_61_HOUSE
	warp_def 65, 9, 1, ROUTE_61_GATE_NORTH

.CoordEvents: db 0

.BGEvents: db 1
	signpost 55, 11, SIGNPOST_LOAD, Route61Sign

.ObjectEvents: db 5
	person_event SPRITE_FISHER, 97, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 8, Route61_Trainer_1, -1
	person_event SPRITE_FISHER, 49, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route61_Trainer_2, -1
	person_event SPRITE_FISHER, 37, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, Route61_Trainer_3, -1
	person_event SPRITE_POKE_BALL, 103, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_ROUTE_61_ITEM_CAGE_KEY
	person_event SPRITE_FRUIT_TREE, 63, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, 5, -1
