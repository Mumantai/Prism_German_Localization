SenecaCavernsB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SenecaCavernsB1F_Trainer_1:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_1, POKEFANM, 5, .before_battle_text, .battle_won_text

	ctxt "Hadomi hätte statt"
	line "den #dex zu"
	para "übersetzen, lieber"
	line "etwas trainieren"
	cont "sollen<...>"
	done

.before_battle_text
	ctxt "Hi ich bin Hadomi"
	line "& habe deinen #"
	cont "Dex mit übersetzt!"
	done

.battle_won_text
	ctxt "Hätte lieber mal"
	line "trainieren sollen<...>"
	done

SenecaCavernsB1F_Trainer_2:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_2, HIKER, 14, .before_battle_text, .battle_won_text

	ctxt "Höhlen sind wie"
	line "Häuser, aber durch"
	cont "die Natur kreiert!"
	done

.before_battle_text
	ctxt "Das ist ein sehr"
	line "schöner Tunnel."
	done

.battle_won_text
	ctxt "Oh waren wir am"
	line "kämpfen?"
	done

SenecaCavernsB1F_Trainer_3:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_3, GENTLEMAN, 4, .before_battle_text, .battle_won_text

	ctxt "Schick der Top 4"
	line "viele Grüße von"
	para "Karsten bzw. "
	line "Mumantai OK?"
	done

.before_battle_text
	ctxt "Warte mal Kind."

	para "Ich bin Karsten."
	line "Aber alle nennen"
	cont "mich Mumantai!"
	para "Wie? du kennst"
	line "mich nicht?"
	para "<...>"
	done

.battle_won_text
	ctxt "Jetzt gehts mir"
	line "besser."
	done

SenecaCavernsB1F_Trainer_4:
	trainer EVENT_SENECACAVERNSB1F_TRAINER_4, SCIENTIST, 3, .before_battle_text, .battle_won_text

	ctxt "Diese Höhle ist<...>"

	para "WUNDERSCHÖN."
	done

.before_battle_text
	ctxt "Diese Höhle ist"
	line "der Traum für"
	cont "jeden Geologen!"
	done

.battle_won_text
	text "Nunja<...>"
	done

SenecaCavernsB1F_MapEventHeader ;filler
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
