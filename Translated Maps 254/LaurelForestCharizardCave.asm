LaurelForestCharizardCave_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_blocks

.set_blocks
	checkevent EVENT_0
	sif false
		return
	changemap LaurelForestCharizardCaveButton1_BlockData
	return

LaurelForestCharizardCaveButton1_BlockData: INCBIN "maps/blk/LaurelForestCharizardCaveButton1_BlockData.ablk.lz"

LaurelForestCharizardCaveButton1:
	checkevent EVENT_0
	sif true
		jumptext LaurelForestCharizardCave_AlreadyPushedText
	showtext LaurelForestCharizardCave_PushedButtonText
	playsound SFX_STRENGTH
	changemap LaurelForestCharizardCaveButton1_BlockData
	reloadmappart
	waitsfx
	setevent EVENT_0
	end

LaurelForestCharizardCaveButton2:
	checkevent EVENT_0
	sif false
		jumptext LaurelForestCharizardCave_AlreadyPushedText
	showtext LaurelForestCharizardCave_PushedButtonText
	playsound SFX_STRENGTH
	changemap LaurelForestCharizardCave_BlockData
	reloadmappart
	waitsfx
	clearevent EVENT_0
	end

LaurelForestCharizardCave_PushedButtonText:
	ctxt "Du hast den"
	line "Schalter gedrückt."
	sdone

LaurelForestCharizardCave_AlreadyPushedText:
	ctxt "Der Schalter wurde"
	line "bereits gedrückt."
	done

LaurelForestCharizardCaveCharmander:
	faceplayer
	cry CHARMANDER
	jumptext .text

.text
	ctxt "Das war knapp!"
	para "Fast hätte es"
	line "mich erwischt!"
	done
LaurelForestCharizardCaveMom:
	faceplayer
	cry CHARIZARD
	jumptext .text

.text
	ctxt "Ich frage mich,"
	line "wie mein Partner"
	para "unser Kind groß-"
	line "ziehen will <...>"
	para "aber du musst ver-"
	line "stehen, dass das"
	para "Tradition in sei-"
	cont "ner Familie ist."
	done

LaurelForestCharizardCaveDad:
	faceplayer
	cry CHARIZARD
	checkevent EVENT_POKEONLY_CHARIZARD_MOVED_BOULDER
	sif true
		jumptext .already_moved_boulder_text
	showtext .first_interaction_text
	applymovement 4, .move_dad_to_boulder
	applymovement 8, .move_boulder
	disappear 8
	playsound SFX_STRENGTH
	earthquake 80
	applymovement 4, .move_dad_back
	setevent EVENT_POKEONLY_CHARIZARD_MOVED_BOULDER
	closetextend

.move_dad_to_boulder
	jump_step_right
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	turn_head_left
	step_end

.move_boulder
	step_right
	step_up
	fast_jump_step_left
	stop_sliding
	step_end

.move_dad_back
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	jump_step_left
	turn_head_down
	step_end

.first_interaction_text
	ctxt "Ich bin enttäuscht"
	line "von meinem Sohn <...>"
	para "Er hat es nicht"
	line "ohne fremde Hilfe"
	para "geschafft nach"
	line "Hause zu kommen."
	para "Vieleicht kann er"
	line "nicht schwimmen <...>"
	para "<...>"
	para "Was? Du suchst"
	line "Curo-Scherben?"
	para "Ein paar Wissen-"
	line "schaftler haben"
	para "uns vor Kurzem"
	line "angekettet. Nur"
	para "um einen Tunnel"
	line "graben zu können."
	para "Ich habe die"
	line "Ketten zebrochen"
	cont "und bin entkommen."
	para "Ich habe gehofft,"
	line "mein Kind wäre"
	para "genau so stark und"
	line "könnte die Ketten"
	cont "zerbrechen, aber <...>"
	para "Naja, zurück zum"
	line "Thema <...>"
	para "Ich erinnere mich,"
	line "dass einer dieser"
	para "Leute im Tunnel"
	line "nach Scherben"
	para "gesucht hat."
	para "Ich habe ihn aber"
	line "blockiert, damit"
	para "mein Sohn dort"
	line "kein Unfug treibt."
	para "Wenn du da runter"
	line "willst und dir"
	para "anschauen möchtest"
	line "was diesr Abschaum"
	para "angerichtet hat,"
	line "dann nur zu!"
	para "Ich mache dir mal"
	line "den Weg frei."
	sdone

.already_moved_boulder_text
	ctxt "Diese Menschen"
	line "sind zwar"
	cont "erbärmlich, aber <...>"
	para "Sie treiben meinen"
	line "Kleinen an sein"
	para "Limit. Noch viel"
	line "weiter ,als mich"
	para "mein Vater damals"
	line "getrieben hat."
	para "Wir werden die"
	line "ehrenvolle"
	para "Blutlinie unserer"
	line "Familie für"
	cont "immer erhalten!"
	done

LaurelForestCharizardCaveBoulder:
	ctxt "Ein Felsbrocken"
	line "blockiert den Weg."
	done

LaurelForestCharizardCave_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def 17, 9, 4, LAUREL_FOREST_POKEMON_ONLY
	warp_def 5, 3, 7, LAUREL_FOREST_CHARIZARD_CAVE
	warp_def 3, 7, 4, LAUREL_FOREST_CHARIZARD_CAVE
	warp_def 3, 37, 3, LAUREL_FOREST_CHARIZARD_CAVE
	warp_def 23, 22, 6, LAUREL_FOREST_CHARIZARD_CAVE
	warp_def 14, 10, 5, LAUREL_FOREST_CHARIZARD_CAVE
	warp_def 27, 5, 2, LAUREL_FOREST_CHARIZARD_CAVE

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 1, 27, SIGNPOST_READ, LaurelForestCharizardCaveButton1
	signpost 9, 37, SIGNPOST_READ, LaurelForestCharizardCaveButton2
	signpost 15, 37, SIGNPOST_READ, LaurelForestCharizardCaveButton1
	signpost 21, 27, SIGNPOST_READ, LaurelForestCharizardCaveButton1
	signpost 21, 23, SIGNPOST_READ, LaurelForestCharizardCaveButton2

.ObjectEvents
	db 7
	person_event SPRITE_CHARMANDER, 14, 14, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelForestCharizardCaveCharmander, -1
	person_event SPRITE_DRAGON, 6, 7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelForestCharizardCaveMom, -1
	person_event SPRITE_DRAGON, 5, 12, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelForestCharizardCaveDad, -1
	person_event SPRITE_POKE_BALL, 20, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CURO_SHARD, EVENT_LAUREL_POKEMONONLY_CUROSHARD_CHARIZARD
	person_event SPRITE_POKE_BALL, 24, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, MINING_PICK, EVENT_LAUREL_POKEMONONLY_MININGPICKS
	person_event SPRITE_ROCK, 8, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_BOULDER, 2, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXT, 0, LaurelForestCharizardCaveBoulder, EVENT_POKEONLY_CHARIZARD_MOVED_BOULDER