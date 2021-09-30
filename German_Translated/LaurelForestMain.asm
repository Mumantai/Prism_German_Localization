LaurelForestMain_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

LaurelForestMain_Trainer_1:
	trainer EVENT_LAUREL_FOREST_MAIN_TRAINER_1, BUG_CATCHER, 3, .before_battle_text, .battle_won_text

	ctxt "Meine Mutter lässt"
	line "mich meine Käfer"
	cont "#mon nicht nach"
	cont "Hause nehmen."

	para "Deswegen verstecke"
	line "ich Sie hier im"
	para "Wald, wo sie sich"
	line "eh wohler fühlen."
	done

.before_battle_text
	ctxt "Wow, so viele"
	line "Käfer zum Fangen!"
	done

.battle_won_text
	ctxt "Man kann hier auch"
	line "gut trainieren!"
	done

LaurelForestMain_Trainer_2:
	trainer EVENT_LAUREL_FOREST_MAIN_TRAINER_2, BUG_CATCHER, 4, .before_battle_text, .battle_won_text

	ctxt "Hmm<...> ob manche"
	line "arten den Wald"
	cont "verlassen haben?"

	para "Ich möchte ganz"
	line "seltene Käfer"
	cont "#mon fangen."
	done

.before_battle_text
	ctxt "Dieser Wald wuchs"
	line "und wuchs, bis"
	para "Sie angefangen"
	line "haben die Stadt"
	cont "auszubauen!"
	done

.battle_won_text
	ctxt "Die vielen Gebäude"
	line "verscheuchten die"
	para "meisten Käfer von"
	line "hier weg<...>"
	done

LaurelForestMainMagikarpWorshipper:
	ctxt "Nur diejenigen,"
	line "welche das wahre"
	para "Potenzial des"
	line "antiken Fisches"
	para "erkennen, mögen"
	line "passieren."

	para "Du bist wie der"
	line "Rest auch<...>"
	para "Du verstehst"
	line "es nicht."

	para "Hinfort mit dir!"
	done

LaurelForestMainClefairy:
	opentext
	writetext .text
	yesorno
	closetext
	sif false
		end
	clearevent EVENT_POKEONLY_CATERPIE_IN_PARTY
	checkevent EVENT_POKEONLY_FINISHED_CATERPIE_QUEST
	sif false, then
		clearevent EVENT_POKEONLY_CATERPIE_PICKED_UP
		setevent EVENT_POKEONLY_CATERPIE_NOT_IN_NEST
		setevent EVENT_POKEONLY_METAPOD_NOT_IN_NEST
		setevent EVENT_POKEONLY_CHILD_BUTTERFREE_NOT_IN_NEST
	sendif
	clearevent EVENT_POKEONLY_MOTHERBUTTERFREE_IN_PARTY
	clearevent EVENT_POKEONLY_PIKACHU_IN_PARTY
	setevent EVENT_POKEONLY_FIRE_OUT
	backupcustchar
	backupsecondpokemon
	setflag ENGINE_POKEMON_MODE
	setflag ENGINE_USE_TREASURE_BAG
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	callasm .heal_first_partymon
	warp LAUREL_FOREST_POKEMON_ONLY, 3, 56
	blackoutmod LAUREL_FOREST_POKEMON_ONLY
	end

.heal_first_partymon
	xor a
	ld [wCurPartyMon], a
	ld [wPokeonlyMainSpecies], a
	jpba HealPartyMon

.text
	ctxt "Pipi lässt dich"
	line "nicht passieren<...>"

	para "@"
	text_from_ram wPartyMonNicknames
	ctxt ""
	line "losschicken?"
	done

LaurelForestMain_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 3, 4, 4, LAUREL_FOREST_GATES
	warp_def 3, 5, 5, LAUREL_FOREST_GATES
	warp_def 33, 4, 9, LAUREL_FOREST_GATES
	warp_def 33, 5, 1, LAUREL_FOREST_GATES
	warp_def 3, 31, 8, LAUREL_FOREST_GATES

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_FAIRY, 4, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LaurelForestMainClefairy, -1
	person_event SPRITE_ELDER, 15, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelForestMainMagikarpWorshipper, EVENT_MAGIKARP_TEST
	person_event SPRITE_WHITNEY, 4, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BROOKLYN_NOT_IN_FOREST
	person_event SPRITE_BUG_CATCHER, 20, 33, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, LaurelForestMain_Trainer_1, -1
	person_event SPRITE_BUG_CATCHER, 31, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, LaurelForestMain_Trainer_2, -1
