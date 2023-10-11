LaurelForestLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelForestLab_Trainer_1:
	trainer EVENT_LAUREL_FOREST_LAB_TRAINER_1, SCIENTIST, 1, .before_battle_text, .battle_won_text

	ctxt "What an annoying"
	line "creature."
	done

.before_battle_text
	ctxt "How did our guard"
	line "let this lowly"
	cont "#mon pass?"

	para "Looks like I need"
	line "to improve my mind"
	para "control device to"
	line "make it flawless!"
	done

.battle_won_text
	ctxt "No more #mon?"

	para "No way!"
	done

LaurelForestLab_Trainer_2:
	trainer EVENT_LAUREL_FOREST_LAB_TRAINER_2, SCIENTIST, 2, .before_battle_text, .battle_won_text

	ctxt "If only you could"
	line "comprehend what"
	cont "we're doing."
	done

.before_battle_text
	ctxt "Ah, another good"
	line "test subject!"
	done

.battle_won_text
	ctxt "I was just trying"
	line "to catch you to"
	para "help enhance your"
	line "natural abilities."
	done

LaurelForestLab_Totodile:
	setevent EVENT_POKEONLY_TOTODILE
	clearevent EVENT_BROOKLYN_NOT_IN_FOREST
	callasm RemoveSecondPartyMember
	opentext
	writetext .totodile_text
	restorecustchar
	restoresecondpokemon
	clearflag ENGINE_POKEMON_MODE
	clearflag ENGINE_USE_TREASURE_BAG
	blackoutmod LAUREL_CITY
	warp LAUREL_FOREST_MAIN, 36, 4
	spriteface PLAYER, LEFT
	showemote EMOTE_HEART, 4, 40
	applymovement 4, .brooklyn_approaches
	showtext .brooklyn_gets_totodile_text
	applymovement 4, .brooklyn_moves_back
	disappear 4
	setevent EVENT_BROOKLYN_NOT_IN_FOREST
	end

.brooklyn_approaches
	big_step_right
	big_step_right
	big_step_right
	step_end

.brooklyn_moves_back
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

.brooklyn_gets_totodile_text
	ctxt "Oh, I've missed"
	line "you so much, my"
	cont "little Totodile!"

	para "Thank you so much!"

	para "Oh, if you want to"
	line "battle me, then"
	para "meet me at my Gym"
	line "back in Laurel"
	cont "City."
	sdone

.totodile_text
	ctxt "Wow, you made it!"

	para "However, I'm not"
	line "sure if I want to"
	para "go back to my"
	line "owner or not."

	para "She is just so"
	line "annoying."

	para "<...>"

	para "Wait, you met a"
	line "brainwashed"
	cont "Charizard?"

	para "I won't take my"
	line "chances. Let's get"
	cont "out of here!"
	sdone

LaurelForestLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $a, 3, LAUREL_FOREST_POKEMON_ONLY
	warp_def $f, $b, 3, LAUREL_FOREST_POKEMON_ONLY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_SCIENTIST, 15, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, LaurelForestLab_Trainer_1, EVENT_LAUREL_FOREST_LAB_TRAINER_1
	person_event SPRITE_SCIENTIST, 12, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, LaurelForestLab_Trainer_2, EVENT_LAUREL_FOREST_LAB_TRAINER_2
	person_event SPRITE_TOTODILE, 1, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestLab_Totodile, EVENT_POKEONLY_TOTODILE
