SenecaCavernsB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SenecaCavernsB1F_Trainer_1:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_1, POKEFANM, 5, .before_battle_text, .battle_won_text
	ctxt "Muss mehr"
	line "trainieren!"
	done

.before_battle_text
	ctxt "Hi, ich bin Hadomi"
	line "und habe geholfen,"
	para "deinen #dex zu"
	line "übersetzen!"

/* Alternative
	ctxt "Ich bin SOWAS"
	line "von bereit für"
	cont "die #mon-Liga!"
*/
	done

.battle_won_text
	ctxt "Hätt' ich mal"
	line "besser trainiert <...>"


/* Alternative
	ctxt "Vielleicht nicht!"
	para "Vielleicht nicht <...>"
*/
	done

SenecaCavernsB1F_Trainer_2:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_2, HIKER, 14, .before_battle_text, .battle_won_text
	ctxt "Höhlen sind wie"
	line "Häuser, aber"
	para "gebaut von #mon"
	line "und Mutter"
	cont "Natur."
	done

.before_battle_text
	ctxt "Das ist ein sehr"
	line "schöner Tunnel."
	done

.battle_won_text
	ctxt "Warte, wir haben"
	line "gekämpft?"
	para "Sorry, ich war"
	line "abgelenkt."
	done

SenecaCavernsB1F_Trainer_3:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_3, GENTLEMAN, 4, .before_battle_text, .battle_won_text
	ctxt "Schick der Top"
	line "Vier viele Grüße"
	cont "von Mumantai, OK?"

/* Alternative
	ctxt "Ich wollte mich"
	line "nicht vor der Top"
	cont "Vier blamieren."
	para "Da du mich aber"
	line "besiegt hast,"
	para "kannst due"
	line "vielleicht ja die"
	para "Top Vier"
	line "blamieren!"
*/
	done

.before_battle_text
	ctxt "Hey, warte mal!"
	para "Du hast es echt"
	line "eilig, oder?"
	done

.battle_won_text
	ctxt "Jetzt geht's mir"
	line "schon besser."
	done

SenecaCavernsB1F_Trainer_4:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_4, SCIENTIST, 3, .before_battle_text, .battle_won_text
	ctxt "Wenn ich diese"
	line "Höhle mit einem"
	para "Wort beschreiben"
	line "müsste, wäre es <...>"
	para "Faszinierend."
	done

.before_battle_text
	ctxt "Diese Höhle ist"
	line "ein Traum für"
	cont "jeden Geologen!"
	done

.battle_won_text
	text "Naja <...>"
	done

SenecaCavernsB1F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $3, $b, 4, SENECACAVERNSF1
	warp_def $10, $2, 1, SENECACAVERNSB2F
	warp_def $3, $2d, 3, SENECACAVERNSF1

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_POKEFAN_M, 19, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsB1F_Trainer_1, -1
	person_event SPRITE_HIKER, 32, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsB1F_Trainer_2, -1
	person_event SPRITE_GENTLEMAN, 17, 45, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsB1F_Trainer_3, -1
	person_event SPRITE_SCIENTIST, 10, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, SenecaCavernsB1F_Trainer_4, -1