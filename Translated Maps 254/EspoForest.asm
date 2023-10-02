EspoForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EspoForestShrine:
	ctxt "In die Seiten des"
	line "Schreins wurden"
	para "Lobpreisungen und"
	line "Gebete eingeritzt."
	para "Das folgende ist"
	line "besonder"
	para "auffällig:"
	line "<``>DANKE<...><''>"
	done

EspoForestShrineNPC:
	ctxt "Es heißt, der Espo"
	line "Wald ist mit einer"
	para "Parallelwelt"
	line "verbunden."
	para "Diese spirituelle"
	line "Aura zieht Leute"
	para "mit Psycho kräften"
	line "an."
	done

EspoForest_Trainer_1:
	trainer EVENT_ESPO_FOREST_TRAINER_1, PSYCHIC_T, 9, .before_battle_text, .battle_won_text

	ctxt "Ich treffe mich"
	line "hier später mit"
	para "meinem Date und"
	line "nervende Kids wie"
	para "dich kann ich"
	line "dabei nicht"
	cont "gebrauchen!"
	done

.before_battle_text
	ctxt "Geh!"
	line "Verlass diesen"
	cont "Wald!"
	done

.battle_won_text
	ctxt "Hier gibt es"
	line "nichts für dich!"
	done

EspoForest_Trainer_2:
	trainer EVENT_ESPO_FOREST_TRAINER_2, MEDIUM, 8, .before_battle_text, .battle_won_text
	ctxt "<...>"
	para "<...>Oh, ich empfange"
	line "ein Signal,"
	cont "Ehm?"
	done

.before_battle_text
	ctxt "Hörst du auch die<...>"
	line "diese Stimmen<...>?"
	done

.battle_won_text
	ctxt "HOTMIX 93.9 FM!"
	line "SÜDPORT CITYS"
	para "NUMMER EINS RADIO"
	line "KANAL FÜR MUSIK!"
	done

EspoForest_Trainer_3:
	trainer EVENT_ESPO_FOREST_TRAINER_3, PSYCHIC_T, 10, .before_battle_text, .battle_won_text

	ctxt "Hier kann ich klar"
	line "denken. Meine"
	para "Telekinese ist"
	line "stärker, und"
	para "meine #mon"
	line "fühlen sich wohl."
	done

.before_battle_text
	ctxt "Wir Seher haben"
	line "hier Heimvorteil."
	done

.battle_won_text
	ctxt "Als würdest du"
	line "dich in einem"
	para"#mon Kampf wie"
	line "Zuhause fühlen<...>"
	done

EspoForest_Trainer_4:
	trainer EVENT_ESPO_FOREST_TRAINER_4, SAGE, 9, .before_battle_text, .battle_won_text

	ctxt "Da gibt es einmal"
	line "die Turmruine und"
	para "den Glockenturm."
	line "Ich wurde im"
	para "Knofensa-Turm"
	line "traniert."
	done

.before_battle_text
	ctxt "Hast du von den"
	line "berühmten Türmen"
	cont "in Johto gehört?"
	done

.battle_won_text
	ctxt "Meine armen"
	line "Knofensa!"
	done

EspoForest_Trainer_Stamina:
	trainer EVENT_ESPO_FOREST_TRAINER_STAMINA, SUPER_NERD, 10, .before_battle_text, .battle_won_text
	ctxt "Das nenne ich "
	line "einen Kampf!"
	para "Ich hoffe, ich"
	line "begegegne mehr so"
	cont "starken Trainern"
	line "wie dir"
	done

.before_battle_text
	ctxt "Ich wurde aus der"
	line "Ausdauer-Challenge"
	para "in Südport-City"
	line "geworfen."
	para "Angeblich hätte"
	line "ich zu viele dort"
	cont "fertig gemacht!"
	para "Pff! Dann sollen"
	line "die Schwächlinge"
	para "eben unter sich"
	line "bleiben!"
	para "Mir doch egal!"
	done

.battle_won_text
	ctxt "Das nenn ich"
	line "Talent!"
	done

EspoForest_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $3, $20, 1, ESPO_CLEARING
	warp_def $3, $21, 2, ESPO_CLEARING

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 16, 18, SIGNPOST_TEXT, EspoForestShrine
	signpost 16, 19, SIGNPOST_TEXT, EspoForestShrine

.ObjectEvents
	db 15
	person_event SPRITE_PSYCHIC, 12, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, EspoForest_Trainer_1, -1
	person_event SPRITE_GRANNY, 26, 31, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, EspoForest_Trainer_2, -1
	person_event SPRITE_PSYCHIC, 25, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, EspoForest_Trainer_3, -1
	person_event SPRITE_SAGE, 8, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, EspoForest_Trainer_4, -1
	person_event SPRITE_SUPER_NERD, 6,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 0, EspoForest_Trainer_Stamina, -1
	person_event SPRITE_SAGE, 15, 21, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, EspoForestShrineNPC, -1
	person_event SPRITE_POKE_BALL, 34, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POWER_HERB, EVENT_ESPO_FOREST_ITEM_POWER_HERB
	person_event SPRITE_POKE_BALL, 33, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DAWN_STONE, EVENT_ESPO_FOREST_ITEM_DAWN_STONE
	person_event SPRITE_FRUIT_TREE, 30, 22, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, RED_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 33, 35, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, BLUE_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 22, 35, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, YELLOW_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 17,  3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, WHITE_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 15, 13, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, BLACK_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 34,  6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, PINK_APRICORN_TREE_2, -1
	person_event SPRITE_FRUIT_TREE, 23,  9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_FRUITTREE, 0, ORANGE_APRICORN_TREE_2, -1