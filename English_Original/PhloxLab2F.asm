PhloxLab2F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_TILES, .tiles

.tiles
	varblocks PhloxLabF2DoorBlocks
	return

PhloxLabF2DoorBlocks:
	db 17
	varblock1  2,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_1, $ff, $68
	varblock1 20, 20, EVENT_PHLOX_LAB_POKEMON_DOOR_1, $ff, $89
	varblock1  6,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_2, $ff, $68
	varblock1 10, 22, EVENT_PHLOX_LAB_POKEMON_DOOR_2, $ff, $87
	varblock1 10, 24, EVENT_PHLOX_LAB_POKEMON_DOOR_2, $ff, $87
	varblock1 10,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_3, $ff, $68
	varblock1 18,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_4, $ff, $65
	varblock1  4, 18, EVENT_PHLOX_LAB_POKEMON_DOOR_4, $ff, $89
	varblock1 22,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_5, $ff, $65
	varblock1 18, 14, EVENT_PHLOX_LAB_POKEMON_DOOR_5, $ff, $7b
	varblock1 18, 16, EVENT_PHLOX_LAB_POKEMON_DOOR_5, $ff, $5f
	varblock1 26,  2, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $65
	varblock2 18, 12, EVENT_PHLOX_LAB_POKEMON_DOOR_3, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $75, $ff, $79
	varblock2 20, 12, EVENT_PHLOX_LAB_POKEMON_DOOR_3, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $76, $ff, $7a
	varblock2 22, 12, EVENT_PHLOX_LAB_POKEMON_DOOR_3, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $76, $ff, $7a
	varblock2 24, 12, EVENT_PHLOX_LAB_POKEMON_DOOR_3, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $76, $ff, $7a
	varblock2 26, 12, EVENT_PHLOX_LAB_POKEMON_DOOR_3, EVENT_PHLOX_LAB_POKEMON_DOOR_6, $ff, $76, $ff, $7a

PhloxLabF2Door1:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_1
	sif true
		end
	checkitem CAGE_CARD_1
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_1
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_1
	setlasttalked 8
	scall PokemonExitRight
	playsound SFX_MEGA_PUNCH
	earthquake 80
	end

.door_text
	ctxt "Door 1"
	done

PhloxLabF2Door2:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_2
	sif true
		end
	checkitem CAGE_CARD_2
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_2
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_2
	setlasttalked 9
	scall PokemonExitRight
	playsound SFX_MOONLIGHT
	end

.door_text
	ctxt "Door 2"
	done

PhloxLabF2Door3:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_3
	sif true
		end
	checkitem CAGE_CARD_3
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_3
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_3
	setlasttalked 10
	scall PokemonExitRight
	playsound SFX_HYDRO_PUMP
	earthquake 80
	end

.door_text
	ctxt "Door 3"
	done

PhloxLabF2Door4:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_4
	sif true
		end
	checkitem CAGE_CARD_4
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_4
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_4
	setlasttalked 11
	scall PokemonExitLeft
	playsound SFX_GS_INTRO_CHARIZARD_FIREBALL
	earthquake 80
	end

.door_text
	ctxt "Door 4"
	done

PhloxLabF2Door5:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_5
	sif true
		end
	checkitem CAGE_CARD_5
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_5
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_5
	setlasttalked 12
	scall PokemonExitLeft
	playwaitsfx SFX_THUNDERSHOCK
	playsound SFX_WALL_OPEN
	end

.door_text
	ctxt "Door 5"
	done

PhloxLabF2Door6:
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_6
	sif true
		end
	checkitem CAGE_CARD_6
	sif false
		jumptext .door_text
	scall PhloxOpenDoorDialogue
	takeitem CAGE_CARD_6
	setevent EVENT_PHLOX_LAB_POKEMON_DOOR_6
	setlasttalked 13
	scall PokemonExitLeft
	playsound SFX_HYDRO_PUMP
	earthquake 80
	end

.door_text
	ctxt "Door 6"
	done

PhloxOpenDoorDialogue:
	opentext
	writetext .open_door_text
	playsound SFX_ENTER_DOOR
	end

.open_door_text
	ctxt "The Cage Card"
	line "opened the door!"
	sdone

PokemonExitRight:
	varblocks PhloxLabF2DoorBlocks
	closetext
	applymovement PLAYER, .player_step_aside
	applymovement LAST_TALKED, .mon_walk_away_1
	spriteface PLAYER, RIGHT
	applymovement LAST_TALKED, .mon_walk_away_2
	disappear LAST_TALKED
	end

.player_step_aside
	step_right
	turn_head_left
	step_end

.mon_walk_away_1
	step_left
	rept 4
		step_down
	endr
	step_right
	step_end

.mon_walk_away_2
	rept 7
		step_right
	endr
	step_end

PokemonExitLeft:
	varblocks PhloxLabF2DoorBlocks
	closetext
	applymovement PLAYER, .player_step_aside
	applymovement LAST_TALKED, .mon_walk_away_1
	spriteface PLAYER, LEFT
	applymovement LAST_TALKED, .mon_walk_away_2
	disappear LAST_TALKED
	end

.player_step_aside
	step_left
	turn_head_right
	step_end

.mon_walk_away_1
	step_down
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end

.mon_walk_away_2
	rept 7
		step_left
	endr
	step_end

PhloxLabF2ElectricPanel:
	jumptext .text

.text
	ctxt "It's an electrical"
	line "panel."

	para "Looks complicated."

	para "Maybe it's used to"
	line "unlock this door?"
	done

PhloxLabF2Trainer1:
	trainer EVENT_PHLOX_LAB_F2_TRAINER_1, SCIENTIST, 8, .before_battle_text, .battle_won_text

	ctxt "Being able to"
	line "reverse engineer"
	para "actual #mon is"
	line "fun! Try it!"
	done

.before_battle_text
	ctxt "This isn't my"
	line "world, but I'm"
	cont "fine<...>"

	para "I am the reverse"
	line "engineer of the"
	cont "world! As we know."
	done

.battle_won_text
	ctxt "Now I need to"
	line "reverse engineer"
	cont "your abilities!"
	done

PhloxLabF2Trainer2:
	trainer EVENT_PHLOX_LAB_F2_TRAINER_2, SCIENTIST, 9, .before_battle_text, .battle_won_text

	ctxt "Takes a lifetime"
	line "to create a good"
	cont "reputation."

	para "It takes a moment"
	line "to destroy it."
	done

.before_battle_text
	ctxt "If you succeed,"
	line "my career will"
	cont "be ruined forever!"
	done

.battle_won_text
	ctxt "All my hopes, all"
	line "my dreams, they"
	para "amount to nothing"
	line "in the end."
	done

PhloxLabF2PaletteGreen:
	trainer EVENT_PHLOX_LAB_F2_GREEN_PALETTE, PATROLLER, 18, .before_battle_text, .battle_won_text

	ctxt "Go on."

	para "Think about who"
	line "you're hurting."
	done

.before_battle_text
	ctxt "Enough of you!"

	para "Tell me."

	para "What is your goal"
	line "in life, huh?"

	para "My goal in life is"
	line "to be financially"
	cont "stable, for once."

	para "And here's you,"
	line "trying to take all"
	cont "of that away."

	para "Do you think I"
	line "care that it's"
	cont "unethical, huh?"

	para "People around the"
	line "world do unethical"
	cont "things to survive."

	para "Once those greedy"
	line "people think they"
	para "need our product"
	line "to compete in"
	cont "#mon battles<...>"

	para "I will have all"
	line "the money I need"
	para "to get everything"
	line "I ever wanted."

	para "You are not going"
	line "to go any further."
	done

.battle_won_text
	ctxt "Persistent child!"

	para "You always want"
	line "to do the right"
	cont "thing, don't you."

	para "But guess what?"

	para "The rest of the"
	line "world won't care"
	cont "about your needs."

	para "Giving gets you"
	line "nowhere in life."

	para "Taking is the only"
	line "way to survive in"
	cont "this world today."
	done

PhloxLab2F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 2, 14, 3, PHLOX_LAB_1F
	warp_def 10, 26, 1, PHLOX_LAB_3F

.CoordEvents: db 0

.BGEvents: db 7
	signpost 3, 2, SIGNPOST_UP, PhloxLabF2Door1
	signpost 3, 6, SIGNPOST_UP, PhloxLabF2Door2
	signpost 3, 10, SIGNPOST_UP, PhloxLabF2Door3
	signpost 3, 19, SIGNPOST_UP, PhloxLabF2Door4
	signpost 3, 23, SIGNPOST_UP, PhloxLabF2Door5
	signpost 3, 27, SIGNPOST_UP, PhloxLabF2Door6
	signpost 15, 17, SIGNPOST_UP, PhloxLabF2ElectricPanel

.ObjectEvents: db 15
	person_event SPRITE_POKE_BALL, 22, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_1, EVENT_PHLOX_F2_CARDKEY_1
	person_event SPRITE_POKE_BALL, 25, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_2, EVENT_PHLOX_F2_CARDKEY_2
	person_event SPRITE_POKE_BALL, 1, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_3, EVENT_PHLOX_F2_CARDKEY_3
	person_event SPRITE_POKE_BALL, 11, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_4, EVENT_PHLOX_F2_CARDKEY_4
	person_event SPRITE_POKE_BALL, 19, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_5, EVENT_PHLOX_F2_CARDKEY_5
	person_event SPRITE_POKE_BALL, 25, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_6, EVENT_PHLOX_F2_CARDKEY_6
	person_event SPRITE_HITMONCHAN, 1, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_1
	person_event SPRITE_GLACEON, 1, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_2
	person_event SPRITE_BLASTOISE, 1, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_3
	person_event SPRITE_MAGMORTAR, 1, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_4
	person_event SPRITE_AMPHAROS, 1, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_5
	person_event SPRITE_MILOTIC, 1, 26, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_6
	person_event SPRITE_SCIENTIST, 16, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF2Trainer1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 22, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF2Trainer2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_PALETTE_PATROLLER, 19, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, PhloxLabF2PaletteGreen, EVENT_PHLOX_LAB_CEO
