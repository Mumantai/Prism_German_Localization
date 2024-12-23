AcquaTutorial_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcquaTutorial_GoldToken:
	dw EVENT_ACQUA_TUTORIAL_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

AcquaTutorialSmallCaveExit:
	opentext
	writetext .text
	yesorno
	sif false
		closetextend
	restorecustchar
	clearflag ENGINE_POKEMON_MODE
	warp ACQUA_TUTORIAL, 26, 20
	closetext
	blackoutmod ACQUA_START
	checkevent EVENT_ACQUA_MOVED_BOULDER
	sif false
		end
	playsound SFX_EMBER
	earthquake 40
	waitsfx
	end

.text
	ctxt "Zurück zu"
	line "deinem Trainer?"
	done

AcquaTutorialButton:
	checkevent EVENT_ACQUA_MOVED_BOULDER
	sif true
		jumptext .already_pressed_text
	showtext .found_button_text
	playsound SFX_STRENGTH
	earthquake 16
	showtext .pressed_button_text
	setevent EVENT_ACQUA_MOVED_BOULDER
	end

.found_button_text
	ctxt "Wofür ist wohl"
	line "dieser Schalter?"
	sdone

.pressed_button_text
	ctxt "Irgendwas hat sich"
	line "bewegt <...>"
	sdone

.already_pressed_text
	ctxt "Du hast den Knopf"
	line "erneut gedrückt <...>"
	para "Nichts passiert."
	sdone

AcquaTutorialSmallCaveEntrance:
	checkevent EVENT_ACQUA_MOVED_BOULDER
	sif true
		jumptext .room_collapsed_text
	opentext
	writetext .send_larvitar_instead
	yesorno
	closetext
	sif false
		end
	backupcustchar
	setflag ENGINE_POKEMON_MODE
	warp ACQUA_TUTORIAL, 30, 42
	blackoutmod ACQUA_TUTORIAL
	end

.send_larvitar_instead
	ctxt "Der Spalt ist zu"
	line "klein <...>"
	para "@"
	text_from_ram wPartyMonNicknames
	ctxt ""
	line "losschicken?"
	done

.room_collapsed_text
	ctxt "Der Raum ist"
	line "eingestürzt."
	done

AcquaTutorialBoulder:
	ctxt "Der Felsen ist zu"
	line "schwer für dich."
	done

AcquaTutorialFirstSoil:
	showtext AcquaTutorialFirstSoil_Text
AcquaTutorialSoil:
	pause 12
	playsound SFX_DOUBLE_KICK
	disappear LAST_TALKED
	end

AcquaTutorialFirstSoil_Text:
	text_from_ram wPartyMonNicknames
	ctxt " frisst"
	line "den Erdhaufen."
	sdone

AcquaTutorialLarvitarInCave:
	faceplayer
	opentext
	writetext .met_other_larvitar_text
	callasm .give_item
	sif true
		jumptext .no_room_text
	writetext .gave_soft_sand_text
	playwaitsfx SFX_ITEM
	writetext .other_larvitar_leaves_text
	closetext
	applymovement PLAYER, .step_aside
	applymovement 9, .larvitar_leaves
	disappear 9
	end

.give_item
	ld hl, wPartyMon1Item
	ld a, [hl]
	ldh [hScriptVar], a
	and a
	ret nz
	ld [hl], SOFT_SAND
	ret

.step_aside
	step_left
	step_up
	step_up
	step_right
	turn_head_left
	step_end

.larvitar_leaves
	step_left
	step_left
	step_up
	step_up
	step_up
	rept 6
		step_left
	endr
	step_end

.met_other_larvitar_text
	ctxt "<...>"
	para "Oh! Hallo!"
	para "Sorry, dass ich"
	line "weggelaufen bin <...>"
	para "Ich bin nun mal"
	line "etwas schüchtern <...>"
	para "Wenn du deinen"
	line "Trainer fernhälst,"
	cont "kriegst du dafür"
	cont "ein Geschenk!"
	prompt

.gave_soft_sand_text
	ctxt "Du erhälst das"
	line "Item Pudersand!"
	done

.no_room_text
	ctxt "Oh, du trägst"
	line "bereits ein Item."
	para "Komm ohne Item"
	line "wieder zu mir."
	para "Ich warte hier"
	line "solange auf dich."
	done

.other_larvitar_leaves_text
	ctxt "Ich sollte mich"
	line "jetzt verstecken <...>"
	sdone

AcquaTutorialLarvitarOutsideCave:
	faceplayer
	showtext .found_other_larvitar_text
	playsound SFX_RUN
	applymovement 10, .other_larvitar_goes_in
	disappear 10
	playwaitsfx SFX_EXIT_BUILDING
	jumptext .larvitar_fled_text

.other_larvitar_goes_in
	fast_slide_step_up
	rept 3
		fast_slide_step_up
		fast_slide_step_left
		fast_slide_step_down
		fast_slide_step_right
	endr
	fast_slide_step_up
	fast_slide_step_left
	fast_slide_step_up
	step_end

.found_other_larvitar_text
	ctxt "Hmm <...> noch ein"
	line "Larvitar."
	sdone

.larvitar_fled_text
	ctxt "Das Larvitar ist"
	line "geflohen!"
	done

AcquaTutorial_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 19, 21, 1, ACQUA_START
	warp_def 25, 26, 2, ACQUA_EXITCHAMBER

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 41, 30, SIGNPOST_READ, AcquaTutorialSmallCaveExit
	signpost 16, 33, SIGNPOST_ITEM, AcquaTutorial_GoldToken
	signpost 51, 43, SIGNPOST_READ, AcquaTutorialButton
	signpost 19, 26, SIGNPOST_READ, AcquaTutorialSmallCaveEntrance

.ObjectEvents
	db 10
	person_event SPRITE_BOULDER, 25, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXT, 0, AcquaTutorialBoulder, EVENT_ACQUA_MOVED_BOULDER
	person_event SPRITE_ROCK, 54, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialSoil, -1
	person_event SPRITE_ROCK, 44, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialSoil, -1
	person_event SPRITE_ROCK, 46, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialSoil, -1
	person_event SPRITE_ROCK, 44, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialFirstSoil, -1
	person_event SPRITE_ROCK, 54, 42, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialSoil, -1
	person_event SPRITE_ROCK, 52, 43, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AcquaTutorialSoil, -1
	person_event SPRITE_LARVITAR, 47, 43, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcquaTutorialLarvitarInCave, EVENT_ACQUA_TUTORIAL_SCARED_LARVITAR_INSIDE
	person_event SPRITE_LARVITAR, 22, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcquaTutorialLarvitarOutsideCave, EVENT_ACQUA_TUTORIAL_SCARED_LARVITAR_OUTSIDE
	person_event SPRITE_POKE_BALL, 7, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POTION, EVENT_ACQUA_TUTORIAL_ITEM_POTION