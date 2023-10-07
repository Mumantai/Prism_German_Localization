EspoForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EspoForestShrine:
	ctxt "The sides of the"
	line "shrine are etched"
	para "with the prayers"
	line "and thanks of"
	cont "people."

	para "One in particular"
	line "catches your eye."

	para "It reads:"
	line "<``>THANK YOU<...><''>"
	done

EspoForestShrineNPC:
	ctxt "Espo Forest is"
	line "said to have a"
	para "link to a parallel"
	line "world."

	para "This ethereal aura"
	line "attracts beings"
	para "with psychic"
	line "powers."
	done

EspoForest_Trainer_1:
	trainer EVENT_ESPO_FOREST_TRAINER_1, PSYCHIC_T, 9, .before_battle_text, .battle_won_text

	ctxt "I'm supposed to"
	line "meet my date here"
	para "later, and I don't"
	line "want any nosy kids"
	cont "around."
	done

.before_battle_text
	ctxt "Leave!"
	line "Leave these woods!"
	done

.battle_won_text
	ctxt "There is nothing"
	line "for you here!"
	done

EspoForest_Trainer_2:
	trainer EVENT_ESPO_FOREST_TRAINER_2, MEDIUM, 8, .before_battle_text, .battle_won_text

	ctxt "<...>"

	para "<...>Oh, I'm picking up"
	line "the radio again,"
	cont "huh?"
	done

.before_battle_text
	ctxt "Do you hear<...>"
	line "the voices<...>?"
	done

.battle_won_text
	ctxt "HOT 93.9 THE MIX!"
	line "SOUTHERLY CITY'S"
	para "NUMBER ONE HIT"
	line "MUSIC STATION!"
	done

EspoForest_Trainer_3:
	trainer EVENT_ESPO_FOREST_TRAINER_3, PSYCHIC_T, 10, .before_battle_text, .battle_won_text

	ctxt "My mind feels"
	line "clearer here."

	para "My telekinesis is"
	line "stronger, and my"
	para "#mon feel at"
	line "peace."
	done

.before_battle_text
	ctxt "Can you take on a"
	line "Psychic with home"
	cont "advantage?"
	done

.battle_won_text
	ctxt "It's as if any"
	line "#mon battle is"
	cont "your home."
	done

EspoForest_Trainer_4:
	trainer EVENT_ESPO_FOREST_TRAINER_4, SAGE, 9, .before_battle_text, .battle_won_text

	ctxt "Of course there"
	line "are the Brass and"
	para "Tin Towers, but"
	line "Sprout Tower is"
	para "where I was"
	line "trained."
	done

.before_battle_text
	ctxt "Have you heard"
	line "tell of the great"
	cont "towers in Johto?"
	done

.battle_won_text
	ctxt "My poor sprouts!"
	done

EspoForest_Trainer_Stamina:
	trainer EVENT_ESPO_FOREST_TRAINER_STAMINA, SUPER_NERD, 10, .before_battle_text, .battle_won_text

	ctxt "That was a battle"
	line "worth having!"

	para "I hope I get to"
	line "battle more great"
	cont "trainers like you!"
	done

.before_battle_text
	ctxt "I got kicked out"
	line "of the Stamina"
	para "Challenge in"
	line "Southerly."

	para "They said I was"
	line "ending too many"
	cont "player streaks!"

	para "Bah! If they want"
	line "to give prizes to"
	para "weaklings, then so"
	line "be it!"
	done

.battle_won_text
	ctxt "Now, that's some"
	line "skill!"
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
