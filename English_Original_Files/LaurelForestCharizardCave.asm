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
	ctxt "You pushed the"
	line "button."
	sdone

LaurelForestCharizardCave_AlreadyPushedText:
	ctxt "The button has al-"
	line "ready been pushed."
	done

LaurelForestCharizardCaveCharmander:
	faceplayer
	cry CHARMANDER
	jumptext .text

.text
	ctxt "That was close."
	line "Thank goodness!"

	para "I was saved!"
	done

LaurelForestCharizardCaveMom:
	faceplayer
	cry CHARIZARD
	jumptext .text

.text
	ctxt "I often question"
	line "how my partner"
	para "wants to raise our"
	line "child<...> but you"
	para "must understand"
	line "that this is"
	para "tradition in his"
	line "family."
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
	ctxt "I'm disappointed"
	line "in my son<...>"

	para "He needed outside"
	line "help to get home,"
	para "rather than just"
	line "simply swimming"
	cont "across the water."

	para "I guess he can't"
	line "swim<...> and it's"
	para "good that we found"
	line "out."

	para "<...>"

	para "What do you mean,"
	line "you're looking"
	cont "for Curo Shards?"

	para "Some scientists"
	line "chained us down"
	para "recently just to"
	line "dig out a tunnel."

	para "Of course, I was"
	line "able to break out"
	para "alone and free my"
	line "partner just fine."

	para "I was hoping my"
	line "child would manage"
	para "to free himself,"
	line "and show his inner"
	cont "strength, but<...>"

	para "Anyway, putting"
	line "parenting aside<...>"

	para "I remember one of"
	line "them going on and"
	para "on about how he"
	line "lost some shard,"
	para "so maybe it's in"
	line "that tunnel?"

	para "I blocked it off"
	line "to keep my son"
	cont "from exploring."

	para "If you want to go"
	line "down there and"
	para "play with<...>"
	line "whatever those"
	para "human scums made,"
	line "be my guest."

	para "I'll clear it for"
	line "you, because only"
	para "someone as strong"
	line "as I can."
	sdone

.already_moved_boulder_text
	ctxt "These humans may"
	line "be annoying and"
	cont "pathetic, but<...>"

	para "They are pushing"
	line "my offspring to"
	para "the limit, much"
	line "further than I was"
	para "pushed by my own"
	line "father."

	para "We will keep the"
	line "honorable blood-"
	para "line of our family"
	line "going forever."
	done

LaurelForestCharizardCaveBoulder:
	ctxt "A heavy boulder"
	line "blocks the way."
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
