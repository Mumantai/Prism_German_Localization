SpurgeGymB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymB1FBoulder:
	ctxt "Es muss auch ohne"
	line "#mon bewegt"
	cont "werden können."
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
	ctxt "Du hast den"
	line "Dynamiten plaziert"
	cont "und gezündet!"
	para "Halte abstand!"
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
	ctxt "Schalter betätigt!"
	done

.already_pressed_text
	ctxt "Der Schalter wurde"
	line "bereits betätigt."
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
	para "Ohne #mon"
	line "kannst du keinen"
	cont "Kampf bestreiten!"
	done

.before_battle_text
	ctxt "DUUU!"
	para "Jedesmal wenn ein"
	line "Arena Leiter"
	para "verliert, verliert"
	line "er auch etwas von"
	cont "seinem Ruf." 
	para "Diesesmal werde"
	line "ich mein Stolz"
	cont "zurück erhalten!"
	sdone

.battle_won_text
	ctxt "NICHT SCHON WIEDER"
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
	ctxt "Moment mal!"
	para "Ohne #mon"
	line "kannst du keinen"
	cont "Kampf bestreiten!"
	done

.before_battle_text
	ctxt "Wie geht es dir"
	line "Kollege!"
	para "Du hast mich zwar"
	line "beim letzten mal"
	para "in die Pfanne"
	line "gehauen, aber das"
	para "war nur Anfänger-"
	line "glück."
	para "Die Hitze wird"
	line "Hot, warte ab!"
	sdone

.battle_won_text
	ctxt "Du bist echt Hot!"
	line "Läuft bei dir!"
	done

.after_battle_text
	ctxt "Wieder Verbrannt <...>"
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
	line "Kampf, verlieren"
	cont "ist verlieren."
	para "Berechnungen,"
	line "Analysen und neue"
	para "Strategien habe"
	line "ich für diesen"
	para "Kampf vor-"
	line "bereitet."
	para "Diesmal werde ich"
	line "nicht verlieren!"
	sdone

.battle_won_text
	ctxt "ABER WIE?!"
	done

.after_battle_text
	ctxt "Wie konnte ich nur"
	line "so daneben liegen!"
	para "Wo war wohl mein"
	line "schwachpunkt <...>"
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
	para "Ist schon etwas" 
	line "her."
	para "Allein wie die"
	line "Luft um dich herum"
	para "vibriert zeigt die"
	line "Stärke und Bindung"
	cont "deiner #mon <...>"
	para "Mal schauen wie"
	line "stark die Bindung"
	cont "wirklich ist!"
	sdone

.battle_won_text
	ctxt "Es ist Großartig"
	line "zu sehen wie stark" 
	para "die Bindung"
	line "zwischen Trainer"
	para "und #mon sein"
	line "kann!"
	done

.after_battle_text
	ctxt "Viel Erfolg auf"
	line "deiner Reise!"
	sdone

SpurgeGymB1F_Text_GenericNeedOneMon:
	ctxt "Entschuldige, aber"
	line "du brauchst"
	para "mindestens ein"
	line "#mon!"
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