LaurelForestLab_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

LaurelForestLab_Trainer_1:
	trainer EVENT_LAUREL_FOREST_LAB_TRAINER_1, SCIENTIST, 1, .before_battle_text, .battle_won_text

	ctxt "So eine nervige"
	line "Kreatur."
	done

.before_battle_text
	ctxt "Wer hat dieses"
	line "schwache #mon"
	cont "reingelassen?"

	para "Egal. Es ist"
	line "das perfekte"
	para "Testobjekt für"
	line "meine Experimente!"
	done

.battle_won_text
	ctxt "Wie kann das sein?"

	para "Diese Stärke <...>"
	done

LaurelForestLab_Trainer_2:
	trainer EVENT_LAUREL_FOREST_LAB_TRAINER_2, SCIENTIST, 2, .before_battle_text, .battle_won_text

	ctxt "Wenn du nur ver-"
	line "stehen würdest,"
	cont "was wir hier tun."
	done

.before_battle_text
	ctxt "Oh, ein weiteres"
	line "gutes Testobjekt."
	done

.battle_won_text
	ctxt "Ich wollte dich"
	line "fangen, um deine"
	para "natürlichen Kräfte"
	line "zu verstärken."
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
	ctxt "Oh, ich habe dich"
	line "so sehr vermisst,"
	cont "mein Karnimani!"

	para "Vielen Dank!"

	para "Falls du gegen"
	line "mich kämpfen"
	para "willst, komm nach"
	line "Lauralia City in"
	cont "die #mon-Arena."
	sdone

.totodile_text
	ctxt "Wow! Du hast es"
	line "echt geschafft!"

	para "Ich bin mir aber"
	line "nicht sicher, ob"
	para "ich wieder zu mei-"
	line "nem Besitzer will."

	para "Sie ist so nervig."		

	para "<...>"

	para "Warte. Du hast ein"
	line "durchgedrehtes"
	cont "Glurak getroffen?"

	para "Dem will ich nicht"
	line "begegnen! Nichts"
	cont "wie weg hier!"
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
	person_event SPRITE_SCIENTIST, 15, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 6, LaurelForestLab_Trainer_1, EVENT_LAUREL_FOREST_LAB_TRAINER_1
	person_event SPRITE_SCIENTIST, 12, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, LaurelForestLab_Trainer_2, EVENT_LAUREL_FOREST_LAB_TRAINER_2
	person_event SPRITE_TOTODILE, 1, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LaurelForestLab_Totodile, EVENT_POKEONLY_TOTODILE
