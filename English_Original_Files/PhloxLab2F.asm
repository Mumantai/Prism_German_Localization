PhloxLab2F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_TILES, .tiles

.tiles
	varblocks PhloxLabF2DoorBlocks
	return

PhloxLabHiddenItem_1:
	opentext
	checkevent EVENT_PHLOX_LAB_HIDDENITEM_MAX_REVIVE
	sif false, then
		setevent EVENT_PHLOX_LAB_HIDDENITEM_MAX_REVIVE
		verbosegiveitem MAX_REVIVE
		waitbutton
		closetextend
	selse
		farjumptext TrashCanText
		waitbutton
		closetextend
	sendif

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

	para "Subject:"
	line "Hitmonchan"

	para "Origin:"
	line "Veilstone City"
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

	para "Subject:"
	line "Glaceon"

	para "Origin:"
	line "Unknown (taken in"
	cont "Phlox Town)"
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

	para "Subject:"
	line "Blastoise"

	para "Origin:"
	line "Olivine City"
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

	para "Subject:"
	line "Magmortar"

	para "Origin:"
	line "Lavaridge Town"
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

	para "Subject:"
	line "Ampharos"

	para "Origin:"
	line "Unknown (taken in"
	cont "Unova)"
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

	para "Subject:"
	line "Milotic"

	para "Origin:"
	line "Phenac City"
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
	checkevent EVENT_PHLOX_LAB_POKEMON_DOOR_5
	sif true
		jumptext .textfried
	jumptext .text

.text
	ctxt "It's an electrical"
	line "panel."

	para "Looks complicated."

	para "Maybe it's used to"
	line "unlock this door?"
	done

.textfried
	ctxt "It's an electrical"
	line "panel."

	para "Looks busted."

	para "A thin trail of"
	line "smoke curls out<...>"
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
	line "my career will be"
	cont "ruined forever!"
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

	para "You always want to"
	line "do the right"
	cont "thing, don't you?"

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

PhloxLabJournal_4:
	jumptext .text

.text
	ctxt "Aug 22, 1987"
	line "As I had feared,"
	para "#mon cloning,"
	line "genetic testing"
	para "and experiments"
	line "have been banned."

	para "We will have no"
	line "choice but to shut"
	cont "down."
	done

PhloxLabJournal_5:
	jumptext .text

.text
	ctxt "Nov 5, 1988"
	line "A new client has"
	para "approached us, who"
	line "is interested in"
	para "working outside"
	line "the law."

	para "They will fund a"
	line "new lab for us."

	para "Will move all"
	line "equipment there as"
	para "soon as the new"
	line "construction is"
	cont "completed."
	done

PhloxLabJournal_6:
	jumptext .text

.text
	ctxt "Jan 2, 1990"
	line "New building is"
	cont "complete."

	para "Movement of most"
	line "equipment from"
	para "Laurel Forest to"
	line "Phlox Town is"
	cont "ongoing."

	para "Our benefactor is"
	line "keen to restart"
	cont "work immediately."
	done

PhloxLabJournal_7:
	jumptext .text

.text
	ctxt "Oct 12, 1991"
	line "New staff have"
	para "joined from Devon"
	line "Corp."

	para "They were expelled"
	line "for their interest"
	para "in interspecies"
	line "DNA splicing."

	para "They have stolen"
	line "plans for an"
	para "additional machine"
	line "we can use to"
	para "enhance our own"
	line "experiments."
	done

PhloxLabJournal_8:
	jumptext .text

.text
	ctxt "Apr 8, 1992"
	line "Our benefactor has"
	para "sent several test"
	line "subjects, as"
	cont "requested."

	para "We will also take"
	line "their #mon for"
	cont "additional tests."
	done

PhloxLabJournal_9:
	jumptext .text

.text
	ctxt "Jul 22, 1994"
	line "First deployment"
	para "of enhanced"
	line "#mon to Kanto."

	para "Our benefactor is"
	line "very pleased, but"
	para "has noted that the"
	line "Devon-derived"
	para "experiments are"
	line "weaker and less"
	cont "willing to fight."

	para "Further research"
	line "required."
	done

PhloxLabJournal_10:
	jumptext .text

.text
	ctxt "May 19, 1995"
	line "Rumors from Kanto:"
	para "Unknown scientist"
	line "may have achieved"
	cont "results we desire."

	para "No. 09 sent to"
	line "investigate."

	para "Will also pick up"
	line "a fresh batch of"
	para "test subjects from"
	line "our benefactor in"
	cont "Saffron."
	done

PhloxLabJournal_11:
	jumptext .text

.text
	ctxt "Feb 7, 1996"
	line "All communication"
	para "coming from our"
	line "benefactor ceased"
	para "abruptly today."
	line "Reason unknown."

	para "Funding is secure"
	line "for now."

	para "But, without a"
	line "further source, I"
	para "fear we may have"
	line "to shut down once"
	cont "again<...>"
	done

PhloxLabJournal_12:
	jumptext .text

.text
	ctxt "May 28, 1997"
	line "Funding is low,"
	para "gathering subjects"
	line "is troublesome,"
	para "progress is"
	line "stalling."

	para "We are selling"
	line "several subjects"
	para "to a new group in"
	line "Hoenn to make ends"
	cont "meet."

	para "My dream is, once"
	line "again, slipping"
	cont "away."
	done

PhloxLabComputer_1:
	jumptext .text

.text
	ctxt "There is something"
	line "running on here."

	para "Enhanced evolution"
	line "through radio wave"
	cont "induction method."

	para "An experiment to"
	line "determine success"
	para "ratio in location-"
	line "based evolution."

	para "<...>"

	para "It's too complex"
	line "to understand."
	done

PhloxLabComputer_2:
	jumptext .text

.text
	ctxt "There is something"
	line "running on here."

	para "Enhanced evolution"
	line "through geological"
	cont "induction method."

	para "An experiment to"
	line "replicate and"
	para "enhance the effect"
	line "of an ancient"
	cont "Kalosian stone."

	para "<...>"

	para "It's too complex"
	line "to understand."
	done

PhloxLabSecretNote:
	ctxt "There's a crumpled"
	line "note in here."

	para "<...>"

	para "Mom, I may never"
	line "see you again."

	para "I love you so"
	line "much."
	done

PhloxLab2F_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 2, 14, 3, PHLOX_LAB_1F
	warp_def 10, 26, 1, PHLOX_LAB_3F

.CoordEvents: db 0

.BGEvents: db 26
	signpost 3, 2, SIGNPOST_UP, PhloxLabF2Door1
	signpost 3, 6, SIGNPOST_UP, PhloxLabF2Door2
	signpost 3, 10, SIGNPOST_UP, PhloxLabF2Door3
	signpost 3, 19, SIGNPOST_UP, PhloxLabF2Door4
	signpost 3, 23, SIGNPOST_UP, PhloxLabF2Door5
	signpost 3, 27, SIGNPOST_UP, PhloxLabF2Door6
	signpost 15, 17, SIGNPOST_UP, PhloxLabF2ElectricPanel
	signpost  6,  3, SIGNPOST_UP, PhloxLabJournal_4
	signpost  6, 11, SIGNPOST_UP, PhloxLabJournal_5
	signpost  6, 19, SIGNPOST_UP, PhloxLabJournal_6
	signpost  6, 27, SIGNPOST_UP, PhloxLabJournal_7
	signpost 18, 17, SIGNPOST_UP, PhloxLabJournal_8
	signpost 10,  3, SIGNPOST_UP, PhloxLabJournal_9
	signpost 20,  3, SIGNPOST_UP, PhloxLabJournal_10
	signpost 16, 27, SIGNPOST_UP, PhloxLabJournal_11
	signpost 24, 21, SIGNPOST_UP, PhloxLabJournal_12
	signpost  6,  7, SIGNPOST_UP, PhloxLabComputer_1
	signpost  6, 23, SIGNPOST_UP, PhloxLabComputer_2
	signpost  1, 23, SIGNPOST_TEXT, PhloxLabSecretNote
	signpost  1, 12, SIGNPOST_READ, PhloxLabHiddenItem_1
	signpost  1,  4, SIGNPOST_JUMPSTD, trashcan
	signpost  1,  8, SIGNPOST_JUMPSTD, trashcan
	signpost  1, 19, SIGNPOST_JUMPSTD, trashcan
	signpost  1, 27, SIGNPOST_JUMPSTD, trashcan
	signpost 15, 27, SIGNPOST_JUMPSTD, trashcan
	signpost  9, 23, SIGNPOST_JUMPSTD, trashcan

.ObjectEvents: db 15
	person_event SPRITE_POKE_BALL, 22, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_1, EVENT_PHLOX_F2_CARDKEY_1
	person_event SPRITE_POKE_BALL, 25, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_2, EVENT_PHLOX_F2_CARDKEY_2
	person_event SPRITE_POKE_BALL, 1, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_3, EVENT_PHLOX_F2_CARDKEY_3
	person_event SPRITE_POKE_BALL, 11, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_4, EVENT_PHLOX_F2_CARDKEY_4
	person_event SPRITE_POKE_BALL, 19, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_5, EVENT_PHLOX_F2_CARDKEY_5
	person_event SPRITE_POKE_BALL, 25, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_CARD_6, EVENT_PHLOX_F2_CARDKEY_6
	person_event SPRITE_HITMONCHAN,  1,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_1
	person_event SPRITE_GLACEON, 1, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_2
	person_event SPRITE_BLASTOISE, 1, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_3
	person_event SPRITE_MAGMORTAR, 1, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_4
	person_event SPRITE_AMPHAROS, 1, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_5
	person_event SPRITE_MILOTIC, 1, 26, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_POKEMON_DOOR_6
	person_event SPRITE_SCIENTIST, 16, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF2Trainer1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 22, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, PhloxLabF2Trainer2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_PALETTE_PATROLLER, 19, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, PhloxLabF2PaletteGreen, EVENT_PHLOX_LAB_CEO
