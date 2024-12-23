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
	ctxt "Tür 1"
	para "Subjekt:"
	line "Nockchan"
	para "Ursprung:"
	line "Schleiede"
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
	ctxt "Tür 2"
	para "Subjekt:"
	line "Glaziola"
	para "Ursprung:"
	line "Unbekannt (Fund in"
	cont "Flokalis)"
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
	ctxt "Tür 3"
	para "Subjekt:"
	line "Turtok"
	para "Ursprung:"
	line "Oliviana City"
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
	ctxt "Tür 4"
	para "Subjekt:"
	line "Magbrant"
	para "Ursprung:"
	line "Bad Lavastadt"
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
	ctxt "Tür 5"
	para "Subjekt:"
	line "Ampharos"
	para "Ursprung:"
	line "Unbekannt (Fund in"
	cont "Einall)"
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
	ctxt "Tür 6"
	para "Subjekt:"
	line "Milotic"
	para "Ursprung:"
	line "Phenac"
	done

PhloxOpenDoorDialogue:
	opentext
	writetext .open_door_text
	playsound SFX_ENTER_DOOR
	end

.open_door_text
	ctxt "Die Zellkarte"
	line "öffnete die Tür!"
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
	ctxt "Es ist ein"
	line "elektisches Panel."
	para "Sehr kompliziert."
	para "Vieleicht öffnets"
	line "diese Tür?"
	done

.textfried
	ctxt "Es ist ein"
	line "elektisches Panel."
	para "Ist beschädigt."
	para "Rauch steigt"
	line "auf <...>"
	done

PhloxLabF2Trainer1:
	trainer EVENT_PHLOX_LAB_F2_TRAINER_1, SCIENTIST, 8, .before_battle_text, .battle_won_text
	ctxt "#mon besser zu"
	line "verstehen macht"
	cont "spaß, glaub mir!"
	done

.before_battle_text
	ctxt "Ist zwar nicht"
	line "meine Welt, aber"
	cont "egal <...>"
	para "Hauptsache ich"
	line "kann hier an den"
	para "#mon herum-"
	line "doktern."
	done

.battle_won_text
	ctxt "Ich muss wohl an"
	line "mir herumdoktern <...>"
	done

PhloxLabF2Trainer2:
	trainer EVENT_PHLOX_LAB_F2_TRAINER_2, SCIENTIST, 9, .before_battle_text, .battle_won_text
	ctxt "Es braucht so"
	line "lang um einen"
	para "guten Ruf aufzu-"
	line "bauen."
	para "Aber sekunden um"
	line "um es zu nehmen."
	done

.before_battle_text
	ctxt "Wenn du gewinnst,"
	line "ist meine Karriere"
	cont "vorbei!"
	done

.battle_won_text
	ctxt "All meine Träume <...>"
	line "Futsch!"
	done

PhloxLabF2PaletteGreen:
	trainer EVENT_PHLOX_LAB_F2_GREEN_PALETTE, PATROLLER, 18, .before_battle_text, .battle_won_text
	ctxt "Geh schon."
	para "Denk dran, wem du"
	line "damit schadest."
	done

.before_battle_text
	ctxt "Genug von dir!"
	para "Sag mir, was ist"
	line "dein Ziel im"
	cont "Leben, hmm?"
	para "Mein Ziel ist es,"
	line "finanzielle"
	para "Freiheit zu"
	line "erreichen."
	para "Und dann kommst du"
	line "daher und willst"
	para "mir all das"
	line "wegnehmen."
	para "Es interessiert"
	line "mich nicht, ob das"
	cont "unethisch ist."
	para "Ungerechtigkeit"
	line "gibt es"
	para "schließlich"
	line "überall auf der"
	cont "Welt!"
	para "Solange gierige"
	line "Menschen unsere"
	para "Produkte kaufen,"
	line "werde ich"
	para "weiterhin ein"
	line "Vermögen anhäufen"
	para "und mir jeden"
	line "Wunsch erfüllen,"
	cont "den ich habe!"
	done

.battle_won_text
	ctxt "Hartnäckiges Kind!"
	para "Gutes tun bringt"
	line "doch gar nichts!"
	para "Schau dir die Welt"
	line "an, überall"
	para "herrscht"
	line "Ungerechtigkeit,"
	para "und niemanden"
	line "interessiert es!"
	para "Also warum sollte"
	line "es dich kümmern,"
	para "welchen Weg ich"
	line "wähle, um mir"
	para "meine Träume zu"
	line "erfüllen?"
	done

PhloxLabJournal_4:
	jumptext .text

.text
	ctxt "22. Aug 1987"
	line "Wie ich befürchtet"
	para "hatte, sind"
	line "genetische Tests"
	para "und Experimente"
	line "verboten worden."
	para "Wir haben keine"
	line "Wahl, als zu"
	cont "schließen."
	done
PhloxLabJournal_5:
	jumptext .text

.text
	ctxt "5. Nov 1988"
	line "Ein neuer Klient"
	para "kam auf uns zu,"
	line "der interessiert"
	para "ist, mit uns"
	line "illegal zusammen-"
	cont "zuarbeiten."
	para "Sie werden ein"
	line "neues Labor für"
	cont "uns finanzieren."
	para "Wir werden alle"
	line "Geräte dorthin"
	para "verlegen, sobald"
	line "der neue Bau"
	cont "abgeschlossen ist."
	done
PhloxLabJournal_6:
	jumptext .text

.text
	ctxt "2. Jan 1990"
	line "Neues Gebäude ist"
	cont "fertiggestellt."
	para "Umzug der meisten"
	line "Geräte von"
	para "Lauralia-Wald nach"
	line "Flokalis läuft."
	para "Unser Investor"
	line "möchte die Arbeit"
	para "sofort wieder"
	line "aufzunehmen."
	done
PhloxLabJournal_7:
	jumptext .text

.text
	ctxt "12. Oktober 1991"
	line "Neue Mitarbeiter"
	para "von Devon Corp."
	line "sind beigetreten."
	para "Sie wurden"
	line "aufgrund ihres"
	para "Interesses an"
	line "DNA-Experimenten"
	cont "ausgeschlossen."
	para "Sie haben Pläne"
	line "für eine"
	para "zusätzliche"
	line "Maschine"
	para "gestohlen, die wir"
	line "zur Verbesserung"
	para "unserer eigenen"
	line "Experimente nutzen"
	cont "können."
	done
PhloxLabJournal_8:
	jumptext .text

.text
	ctxt "8. April 1992"
	para "Unser Investor"
	line "hat, wie"
	para "angefordert,"
	line "mehrere Test-"
	cont "objekte geschickt."
	para "Diese werden wir"
	line "für weitere Tests"
	cont "verwenden."
	done
PhloxLabJournal_9:
	jumptext .text

.text
	ctxt "22. Juli 1994."
	para "Erster Versand der"
	line "modifizierten "
	para "#mon nach"
	line "Kanto."
	para "Unser Investor ist"
	line "sehr zufrieden,"
	para "hat jedoch"
	line "festgestellt, dass"
	para "die von Devon"
	line "erhaltenen"
	para "Experimente"
	line "schwächer und"
	para "weniger"
	line "kampfbereit sind."
	para "Weitere Forschung"
	line "erforderlich."
	done
PhloxLabJournal_10:
	jumptext .text

.text
	ctxt "19. Mai 1995"
	para "Gerüchte aus"
	line "Kanto: Ein"
	para "unbekannter"
	line "Wissenschaftler"
	para "könnte die"
	line "gewünschten"
	para "Ergebnisse erzielt"
	line "haben."
	para "Nr. 09 wurde zur"
	para "Untersuchung"
	line "geschickt. Wird"
	para "auch eine frische"
	line "Charge von"
	para "Testobjekten von"
	line "unserem Investor"
	para "in Saffronia City"
	line "abholen."
	done
PhloxLabJournal_11:
	jumptext .text

.text
	ctxt "7. Februar 1996"
	para "Jegliche"
	line "Kommunikation von"
	para "unserem Investor"
	line "ist heute abrupt"
	cont "abgebrochen."
	para "Grund unbekannt."
	para "Die Finanzierung"
	line "ist vorerst"
	cont "gesichert."
	para "Aber ohne eine"
	line "weitere"
	para "Einnahmequelle"
	line "befürchte ich,"
	para "dass wir"
	line "vielleicht erneut"
	cont "schließen müssen."
	done
PhloxLabJournal_12:
	jumptext .text

.text
	ctxt "28. Mai 1997"
	para "Die Finanzierung"
	line "ist knapp, die"
	para "Beschaffung von"
	line "Testobjekten"
	para "problematisch, der"
	line "Fortschritt"
	cont "stockt."
	para "Um über die Runden"
	line "zu kommen,"
	para "verkaufen wir"
	line "mehrere"
	para "Testobjekte an"
	line "eine neue Gruppe"
	cont "in Hoenn."
	para "Mein Traum"
	line "entgleitet mir"
	cont "erneut."
	done
PhloxLabComputer_1:
	jumptext .text

.text
	ctxt "Hier passiert"
	line "gerade etwas."
	para "Beschleunigte"
	line "Evolution durch"
	para "die Methode der"
	line "Funkwelleninduktion."
	para "Ein Experiment zur"
	line "Bestimmung der"
	para "Erfolgsquote bei"
	line "ortsabhängiger"
	cont "Evolution."
	para "<...>"
	para "Zu komplex, um"
	line "es zu verstehen."
	done
PhloxLabComputer_2:
	jumptext .text

.text
	ctxt "Hier passiert"
	line "gerade etwas."
	para "Beschleunigte"
	line "Evolution durch"
	para "die Methode der"
	line "geologischen"
	cont "Induktion. Ein"
	para "Experiment zur"
	line "Nachbildung und"
	para "Steigerung des"
	line "Effekts eines"
	para "alten Steins aus"
	line "Kalos. <...> Es"
	para "ist zu komplex, um"
	line "es zu verstehen."
	done

PhloxLabSecretNote:
	ctxt "Hier ist ein"
	line "zerknüllter"
	cont "Zettel."
	para "Mama, Ich"
	line "wollte dir schon"
	para "immer sagen wie"
	line "sehr ich dich"
	para "liebe, doch dazu"
	line "wird es wohl nicht"
	cont "mehr kommen<...>"
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