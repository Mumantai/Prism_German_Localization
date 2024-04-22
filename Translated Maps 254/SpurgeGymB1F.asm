SpurgeGymB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymB1FBoulder:
	ctxt "Der muss auch"
	line "ohne #mon"
	para "bewegt werden"
	line "können."
	done

SpurgeGymB1FExplodingRock:
	takeitem DYNAMITE
	sif false
		jumptext SpurgeGymB1FBoulder
	showtext .placed_dynamite_text
	applymovement PLAYER, .stand_back
	disappear 8
	playwaitsfx SFX_EGG_BOMB
	setevent EVENT_SPURGE_GYM_SMASHROCK
	end

.stand_back
	run_step_right
	run_step_right
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	step_end

.placed_dynamite_text
	ctxt "Dynamit am Felsen"
	line "platziert und"
	cont "angezündet."
	para "Geh in Deckung!"
	sdone

SpurgeGymB1FThirdMon:
	setevent EVENT_SPURGE_GYM_POKEMON_3
	jump SpurgeGymGetPokemon

SpurgeGymB1FSixthMon:
	setevent EVENT_SPURGE_GYM_POKEMON_6
	jump SpurgeGymGetPokemon

SpurgeGymB1FButton:
	checkevent EVENT_SPURGE_GYM_PUSHROCK
	sif true
		jumptext .already_pressed_text
	opentext
	writetext .pressed_text
	playwaitsfx SFX_EGG_BOMB
	waitbutton
	disappear 3
	setevent EVENT_SPURGE_GYM_PUSHROCK
	closetextend

.pressed_text
	ctxt "Knopf gedrückt!"
	done

.already_pressed_text
	ctxt "Der Knopf wurde"
	line "schon gedrückt."
	done

SpurgeGymB1F_TrainerDisappears:
	teleport_from
	remove_person
	step_end

SpurgeGymB1FCadence:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext .no_mons_text
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer CADENCE, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_CADENCE
	playsound SFX_WARP_FROM
	applymovement 4, SpurgeGymB1F_TrainerDisappears
	disappear 4
	end

.no_mons_text
	ctxt "Moment mal!"
	para "Du kannst nicht"
	line "ohne #mon gegen"
	cont "mich kämpfen!"
	done

.before_battle_text
	ctxt "DU!"
	para "Immer wenn ein"
	line "Arenaleiter"
	para "verliert, geht"
	line "auch ein Stück"
	para "seines Stolzes den"
	line "Bach runter."
	para "Dieses Mal gebe"
	line "ich ALLES, um dich"
	cont "FERTIGZUMACHEN!"
	sdone

.battle_won_text
	ctxt "Neeein! Nicht"
	para "schon wieder!"
	done

.after_battle_text
	ctxt "Wieder hast du"
	line "dem Ruf meiner"
	cont "Arena geschadet!"
	sdone

SpurgeGymB1FJosiah:
	faceplayer
	opentext
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext .no_mons_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer JOSIAH, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_JOSIAH
	playsound SFX_WARP_FROM
	applymovement 5, SpurgeGymB1F_TrainerDisappears
	disappear 5
	end

.no_mons_text
	ctxt "Warte mal ne"
	line "Sekunde! Ohne"
	para "#mon kannst du"
	line "nicht gegen"
	cont "mich kämpfen!"
	done

.before_battle_text
	ctxt "Was geht, mein"
	line "Kumpel?!"
	para "Letztes Mal, hast"
	line "du mich ja"
	para "ordentlich in die"
	line "Pfanne gehauen,"
	para "aber das war nur"
	line "Anfängerglück!"
	para "Dieses Mal, mache"
	line "ich dir richtig"
	para "Feuer unterm"
	line "Hintern!"
	sdone

.battle_won_text
	ctxt "Du fackelst nicht"
	line "lange, Kumpel!"
	done

.after_battle_text
	ctxt "Wieder verbrannt <...>"
	sdone

SpurgeGymB1FEdison:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext SpurgeGymB1F_Text_GenericNeedOneMon
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer EDISON, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_EDISON
	playsound SFX_WARP_FROM
	applymovement 6, SpurgeGymB1F_TrainerDisappears
	disappear 6
	end

.before_battle_text
	ctxt "Ein Kampf ist ein"
	line "Kampf und eine"
	para "Niederlage ist"
	line "eine Niederlage."
	para "Ich habe dich für"
	line "diesen Kampf extra"
	para "analysiert und"
	line "neue Techniken"
	cont "einstduiert."
	para "Ich werde nicht"
	line "noch einmal gegen"
	cont "dich verlieren!"
	sdone

.battle_won_text
	ctxt "Aber <...> wie?!"
	done

.after_battle_text
	ctxt "Wie konnte ich nur"
	line "so falsch liegen?!"
	para "Meine Taktik muss"
	line "einen Schwachpunkt"
	cont "haben <...> aber wo?"
	sdone

SpurgeGymB1FRinji:
	faceplayer
	checkcode VAR_PARTYCOUNT
	sif false
		jumptext SpurgeGymB1F_Text_GenericNeedOneMon
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer RINJI, 2
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	setevent EVENT_SPURGE_GYM_B1F_RINJI
	playsound SFX_WARP_FROM
	applymovement 7, SpurgeGymB1F_TrainerDisappears
	disappear 7
	end

.before_battle_text
	ctxt "Grüß dich."
	para "Ist schon was her."
	para "Deine Schwing-"
	line "ungen, zeigen mir,"
	para "dass du und deine"
	line "#mon ein noch"
	para "stärkeres Band als"
	line "vorher habt."
	para "Ihr seid viel"
	line "stärker geworden."
	para "Diese Stärke will"
	line "ich testen!"
	sdone

.battle_won_text
	ctxt "Das wachsende"
	line "Band zwischen"
	para "#mon und"
	line "Trainer zu"
	para "sehen, ist so"
	line "ergreifend!"
	done

.after_battle_text
	ctxt "Angenehme Reise,"
	line "mein Freund!"
	sdone

SpurgeGymB1F_Text_GenericNeedOneMon:
	ctxt "Entschuldige,"
	line "aber du brauchst"
	para "schon ein"
	line "#mon, um"
	para "gegen mich kämpfen"
	line "zu können!"
	done

SpurgeGymB1F_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 37, 25, 1, SPURGE_GYM_HOUSE
	warp_def 29, 9, 1, SPURGE_GYM_B2F_SIDESCROLL
	warp_def 17, 31, 2, SPURGE_GYM_B2F
	warp_def 7, 37, 3, SPURGE_GYM_B2F
	warp_def 5, 7, 4, SPURGE_GYM_B2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 27, 37, SIGNPOST_READ, SpurgeGymB1FButton

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 10, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FThirdMon, EVENT_SPURGE_GYM_POKEMON_3
	person_event SPRITE_BOULDER, 29, 19, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXT, 0, SpurgeGymB1FBoulder, EVENT_SPURGE_GYM_PUSHROCK
	person_event SPRITE_CADENCE, 8, 20, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FCadence, EVENT_SPURGE_GYM_B1F_CADENCE
	person_event SPRITE_JOSIAH, 27, 32, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FJosiah, EVENT_SPURGE_GYM_B1F_JOSIAH
	person_event SPRITE_EDISON, 6, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FEdison, EVENT_SPURGE_GYM_B1F_EDISON
	person_event SPRITE_BUGSY, 8, 37, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FRinji, EVENT_SPURGE_GYM_B1F_RINJI
	person_event SPRITE_ROCK, 33, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FExplodingRock, EVENT_SPURGE_GYM_SMASHROCK
	person_event SPRITE_POKE_BALL, 26, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, DYNAMITE, EVENT_SPURGE_GYM_B1F_DYNAMITE
	person_event SPRITE_POKE_BALL, 8, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB1FSixthMon, EVENT_SPURGE_GYM_POKEMON_6