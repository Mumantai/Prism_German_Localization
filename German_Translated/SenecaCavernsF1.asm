SenecaCavernsF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SenecaCavernsF1_Trainer_1:
	trainer EVENT_SENECACAVERNSF1_TRAINER_1, BURGLAR, 2, .before_battle_text, .battle_won_text

	ctxt "Jetzt muss ich bis"
	line "zum #mon Center"
	cont "laufen<...>"
	done

.before_battle_text
	ctxt "Ein Kind wie du"  
	line "kann mich nie und"
	cont "nimmer schlagen!"
	done

.battle_won_text
	ctxt "Ich wurde"
	line "geschlagen<...>"
	done

SenecaCavernsF1_Trainer_2:
	trainer EVENT_SENECACAVERNSF1_TRAINER_2, BIRD_KEEPER, 7, .before_battle_text, .battle_won_text

	ctxt "Nachdem ich sie"
	line "geheilt habe,"
	para "werden Sie dich"
	line "besiegen."
	done

.before_battle_text
	ctxt "Fürchte dich vor"
	line "den Vögeln!"
	done

.battle_won_text
	ctxt "Vorführeffekt!"
	done

SenecaCavernsF1_Trainer_3:
	trainer EVENT_SENECACAVERNSF1_TRAINER_3, GUITARIST, 4, .before_battle_text, .battle_won_text

	ctxt "Ich werde"
	line "weiterhin die"
	cont "Bühne Rocken!"
	done

.before_battle_text
	ctxt "Tolle Akustik"
	line "hier drin, oder?"
	done

.battle_won_text
	text "Aua!"
	done

SenecaCavernsF1_Trainer_4:
	trainer EVENT_SENECACAVERNSF1_TRAINER_4, FIREBREATHER, 9, .before_battle_text, .battle_won_text

	ctxt "Paar Leute denken"
	line "der östliche teil"
	para "dieser Höhle würde"
	line "die Rijon Liga"
	cont "beinhalten."

	para "Sehr lustig."
	done

.before_battle_text
	ctxt "Flammenwurf!"
	done

.battle_won_text
	ctxt "Jetzt habe ich"
	line "mich verbrannt."
	done

SenecaCavernsF1_MapEventHeader ;filler
	db 0, 0

;warps
	db 5
	warp_def $1c, $20, 3, ROUTE_67
	warp_def $9, $21, 4, SENECACAVERNSB2F
	warp_def $5, $1b, 3, SENECACAVERNSB1F
	warp_def $b, $d, 1, SENECACAVERNSB1F
	warp_def $1c, $c, 2, ROUTE_67

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 7
	person_event SPRITE_R_BURGLER, 20, 37, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsF1_Trainer_1, -1
	person_event SPRITE_BIRDKEEPER, 10, 40, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SenecaCavernsF1_Trainer_2, -1
	person_event SPRITE_ROCKER, 16, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SenecaCavernsF1_Trainer_3, -1
	person_event SPRITE_FIREBREATHER, 28, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsF1_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 17, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_SENECACAVERNSF1_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 16, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_SENECACAVERNSF1_ITEM_ELIXIR
	person_event SPRITE_ROCK, 20, 35, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
