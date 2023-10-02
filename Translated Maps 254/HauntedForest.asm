HauntedForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
 	db 1
	dbw MAPCALLBACK_NEWMAP, .reset_var

.reset_var
	seteventvar EVAR_TEMP, 0
	return

HauntedForest_Trainer_1:
	trainer EVENT_HAUNTED_FOREST_TRAINER_1, SAGE, 2, .before_battle_text, .battle_won_text
	ctxt "Ein Krug füllt"
	line "sich Tropfen um"
	cont "Tropfen."
	done

.before_battle_text
	ctxt "Ein unaufrichtiger"
	line "und böser Freund"
	para "ist schlimmer als"
	line "jede wilde Bestie!"
	para "Eine Bestie"
	line "verwundet deinen"
	para "Körper, doch ein"
	line "böser Freund scha-"
	cont "det deinem Geist."
	done

.battle_won_text
	ctxt "Ehrgeiz ist wie"
	line "Liebe: intolerant"
	para "gegenüber Verspä-"
	line "tung und Rivalen."
	done

HauntedForest_Trainer_2:
	trainer EVENT_HAUNTED_FOREST_TRAINER_2, SAGE, 1, .before_battle_text, .battle_won_text
	ctxt "Hass hört nicht"
	line "durch Hass auf!"
	para "Nur die Liebe"
	line "kann Hass beenden!"
	done

.before_battle_text
	ctxt "Diejenigen, die"
	line "weise durch das"
	para "Leben gehen,"
	line "brauchen den Tod"
	cont "nicht zu fürchten."
	done

.battle_won_text
	ctxt "Man kann alles"
	line "schaffen, wenn man"
	cont "an sich glaubt!"
	done

HauntedForest_Trainer_3:
	trainer EVENT_HAUNTED_FOREST_TRAINER_3, MEDIUM, 1, .before_battle_text, .battle_won_text
	ctxt "Unter all den"
	line "Worten ist das"
	para "beste Wort jenes,"
	line "das den Frieden"
	cont "bringt."
	done

.before_battle_text
	ctxt "Glaube niemals"
	line "etwas, das nicht"
	para "zu deinen eigenen"
	line "Idealen passt!"
	done

.battle_won_text
	ctxt "Hab Verständnis"
	line "mit allem Leben."
	para "Jeder hat seine"
	cont "eigenen Probleme."
	done

HauntedForestRedGravestone:
	writehalfword HauntedForestRedGravestoneText
	switch 0
HauntedForestGreyGravestone:
	writehalfword HauntedForestGreyGravestoneText
	switch 1
HauntedForestBlueGravestone:
	writehalfword HauntedForestBlueGravestoneText
	switch 2
HauntedForestYellowGravestone:
	writehalfword HauntedForestYellowGravestoneText
	switch 3
HauntedForestBrownGravestone:
	writehalfword HauntedForestBrownGravestoneText
	switch 4
HauntedForestTealGravestone:
	writehalfword HauntedForestTealGravestoneText
	writebyte 5
	sendif

	pushvar
	opentext
	writetext -1
	checkevent EVENT_HAUNTED_MANSION_KEY
	sif false, then
		writetext .touch_it_text
		yesorno
		sif true, then
			pullvar
			compareeventvar EVAR_TEMP
			sif true, then
				waitsfx
				playsound SFX_WRONG
				writetext .wrong_text
				waitsfx
				seteventvar EVAR_TEMP, 0
			selse
				pullvar
				addvar 1
				writeeventvar EVAR_TEMP
				sif =, 6, then
					writetext .got_key_text
					verbosegiveitem MANSION_KEY, 1
					waitbutton
					setevent EVENT_HAUNTED_MANSION_KEY
				selse
					waitsfx
					playsound SFX_GLASS_TING
					writetext .right_text
					waitsfx
				sendif
			sendif
		sendif
	sendif
	popvar
	closetextend

.touch_it_text
	ctxt "Berühren?"
	done

.right_text
	ctxt "Das Geräusch ist"
	line "beruhigend!"
	sdone

.wrong_text
	ctxt "Das hört sich"
	line "nicht richtig an."
	sdone

.got_key_text
	ctxt "Eine Hand streckt"
	line "sich aus dem Grab"
	para "und sie gibt dir"
	line "einen Schlüssel <...>"
	sdone

HauntedForestRedGravestoneText:
	ctxt "Es ist ein roter"
	line "Grabstein."
	sdone

HauntedForestGreyGravestoneText:
	ctxt "Es ist ein grauer"
	line "Grabstein."
	sdone

HauntedForestBlueGravestoneText:
	ctxt "Es ist ein blauer"
	line "Grabstein."
	sdone

HauntedForestYellowGravestoneText:
	ctxt "Es ist ein gelber"
	line "Grabstein."
	sdone

HauntedForestBrownGravestoneText:
	ctxt "Es ist ein brauner"
	line "Grabstein."
	sdone

HauntedForestTealGravestoneText:
	ctxt "Es ist ein tür-"
	line "kiser Grabstein."
	sdone

HauntedForest_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $26, $d, 1, HAUNTED_FOREST_GATE
	warp_def $27, $d, 2, HAUNTED_FOREST_GATE
	warp_def $5, $6, 1, HAUNTED_MANSION

.CoordEvents
	db 0

.BGEvents
	db 6
	signpost $14, $06, SIGNPOST_READ, HauntedForestRedGravestone
	signpost $02, $21, SIGNPOST_READ, HauntedForestTealGravestone
	signpost $06, $26, SIGNPOST_READ, HauntedForestGreyGravestone
	signpost $06, $09, SIGNPOST_READ, HauntedForestYellowGravestone
	signpost $16, $23, SIGNPOST_READ, HauntedForestBrownGravestone
	signpost $18, $25, SIGNPOST_READ, HauntedForestBlueGravestone

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 38, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_NIGHT_SHADE, 0, EVENT_GOT_TM05
	person_event SPRITE_POKE_BALL, 19, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, STARDUST, EVENT_HAUNTED_FOREST_ITEM_STARDUST
	person_event SPRITE_SAGE, 11, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_1, -1
	person_event SPRITE_SAGE, 29, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_3, -1