MersonCaveB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MersonCaveB1FDirectionsSign:
	ctxt "<LEFT> Route 54"
	done

MersonCaveB1F_Trainer_1:
	trainer EVENT_MERSON_CAVE_B1F_TRAINER_1, BUG_CATCHER, 5, .before_battle_text, .battle_won_text

	ctxt "Ich habe gegen"
	line "etliche Trainer"
	para "gekämpft, die sich"
	line "entschieden haben,"
	para "durch diese Höhle"
	line "zu reisen."

	done

.before_battle_text
	ctxt "Ich habe den"
	line "Ausgang fast!"

	done

.battle_won_text
	ctxt "Ach ja, meine"
	line "Käfer werden immer"
	cont "stärker!"

	done

MersonCaveB1F_Trainer_2:
	trainer EVENT_MERSON_CAVE_B1F_TRAINER_2, HIKER, 4, .before_battle_text, .battle_won_text

	ctxt "Es ist bekannt,"
	line "dass sich"
	para "Höhlenstrukturen"
	line "von Zeit zu Zeit "
	cont "ändern."

	para "Man weiß nie, was"
	line "es Neues gibt!"

	done

.before_battle_text
	ctxt "Immer eine gute"
	line "Tour durch diese "
	cont "Höhle."

	done

.battle_won_text
	ctxt "Es wird einfach"
	line "nie langweilig!"

	done

MersonCaveB1F_Trainer_3:
	trainer EVENT_MERSON_CAVE_B1F_TRAINER_3, LASS, 2, .before_battle_text, .battle_won_text

	ctxt "Es gibt vielleicht"
	line "Gebiete, die nur"
	para "von #mon"
	line "entdeckt wurden."

	done

.before_battle_text
	ctxt "Diese Höhle ist"
	line "ein wirres "
	cont "Labyrint."

	done

.battle_won_text
	ctxt "Man, das war "
	line "uncool."

	done

MersonCaveB1F_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $f, $19, 4, MERSON_CAVE_B2F
	warp_def $21, $f, 1, ROUTE_54
	warp_def $7, $5, 5, MERSON_CAVE_B2F
	warp_def $d, $b, 3, SEASHORE_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 23, 15, SIGNPOST_LOAD, MersonCaveB1FDirectionsSign

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 12, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HP_UP, EVENT_MERSON_CAVE_B1F_ITEM_HP_UP
	person_event SPRITE_POKE_BALL, 23, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DUSK_RING, EVENT_MERSON_CAVE_B1F_ITEM_DUSK_RING
	person_event SPRITE_YOUNGSTER, 30, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, MersonCaveB1F_Trainer_1, -1
	person_event SPRITE_FISHER, 17, 24, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, MersonCaveB1F_Trainer_2, -1
	person_event SPRITE_COOLTRAINER_F, 4, 20, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, MersonCaveB1F_Trainer_3, -1
