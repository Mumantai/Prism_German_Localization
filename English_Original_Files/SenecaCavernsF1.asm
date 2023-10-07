SenecaCavernsF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SenecaCavernsF1_Trainer_1:
	trainer EVENT_SENECACAVERNSF1_TRAINER_1, BURGLAR, 2, .before_battle_text, .battle_won_text

	ctxt "Now I gotta walk"
	line "all the way down"
	para "to the #mon"
	line "Center."
	done

.before_battle_text
	ctxt "There's no way a"
	line "kid like you can"
	cont "handle me!"
	done

.battle_won_text
	ctxt "Beaten at my own"
	line "game<...>"
	done

SenecaCavernsF1_Trainer_2:
	trainer EVENT_SENECACAVERNSF1_TRAINER_2, BIRD_KEEPER, 7, .before_battle_text, .battle_won_text

	ctxt "Once I heal them"
	line "up, they'll be"
	para "ready to take you"
	line "down."
	done

.before_battle_text
	ctxt "Behold, your avian"
	line "adversaries!"
	done

.battle_won_text
	ctxt "What bad luck!"
	done

SenecaCavernsF1_Trainer_3:
	trainer EVENT_SENECACAVERNSF1_TRAINER_3, GUITARIST, 2, .before_battle_text, .battle_won_text

	ctxt "Nothing is ever"
	line "going to keep me"
	cont "from rockin'!"
	done

.before_battle_text
	ctxt "Great acoustics in"
	line "here, huh?"
	done

.battle_won_text
	text "Ouch!"
	done

SenecaCavernsF1_Trainer_4:
	trainer EVENT_SENECACAVERNSF1_TRAINER_4, FIREBREATHER, 9, .before_battle_text, .battle_won_text

	ctxt "Some people think"
	line "the east side of"
	para "this cave contains"
	line "the Rijon League."

	para "Very funny."
	done

.before_battle_text
	ctxt "Flamethrower!"
	done

.battle_won_text
	ctxt "Great. Now I need"
	line "a Burn Heal."
	done

SenecaCavernsF1_MapEventHeader:
	;filler
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
	person_event SPRITE_BURGLAR, 20, 37, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsF1_Trainer_1, -1
	person_event SPRITE_BIRDKEEPER, 10, 40, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, SenecaCavernsF1_Trainer_2, -1
	person_event SPRITE_ROCKER, 16, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, SenecaCavernsF1_Trainer_3, -1
	person_event SPRITE_FIREBREATHER, 28, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsF1_Trainer_4, -1
	person_event SPRITE_POKE_BALL, 17, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_SENECACAVERNSF1_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 16, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_SENECACAVERNSF1_ITEM_ELIXIR
	person_event SPRITE_ROCK, 20, 35, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
