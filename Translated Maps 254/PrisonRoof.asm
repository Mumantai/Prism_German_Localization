PrisonRoof_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_OBJECTS, .Callback

.Callback
	checkevent EVENT_PRISON_ROOF_TRAINER_2
	sif false
		appear 2
	return

PrisonRoof_Trainer_1:
	trainer EVENT_PRISON_ROOF_TRAINER_1, OFFICER, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptextfaceplayer .after_battle_text

.before_battle_text
	ctxt "Was, was, was?"
	done

.battle_won_text
	text "Uh <...>"
	done

.after_battle_text
	ctxt "Was ist passiert?"
	done

PrisonRoof_Trainer_2:
	trainer EVENT_PRISON_ROOF_TRAINER_2, OFFICER, 6, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	faceplayer
	showtext .after_battle_text_1
	showtext .after_battle_text_2
	jumptext .after_battle_text_3

.before_battle_text
	ctxt "Verdammt nochmal"
	line "Grady, bleib"
	cont "fokussiert."
	para "Ich hasse es auf"
	line "diesen Typen auf-"
	cont "zupassen <...>"
	done

.battle_won_text
	ctxt "Warte, du bist"
	line "kein Insasse?"
	done

.after_battle_text_1
	ctxt "Im ernst, das ist"
	line "eins der"
	para "schlimmsten"
	line "Gefängnisse der"
	cont "Welt."
	para "Die Insassen hier"
	line "könnten jederzeit"
	para "ausbrechen, wenn"
	line "Sie wollen"
	cont "würden."
	para "Grady und Ich"
	line "führen alleine die"
	para "ganze Sicherheits-"
	line "abteilung."
	para "Stimms Grady?"
	sdone

.after_battle_text_2
	ctxt "Grady: Öhm echt?"
	sdone

.after_battle_text_3
	ctxt "Naja, du bist ja"
	line "noch ein Kind."
	para "Eigentlich hätten"
	line "sie dich in eine"
	para "Jugendanstalt"
	line "schicken sollen"
	cont "und nicht hierher."
	
	para "Geh runter zum"
	line "Fitness Raum und"
	para "frag Ali nach"
	line "dem neuen Passwort"
	cont "zum Keller."
	para "Wegen der"
	line "Inkompetenz hier"
	para "müssen wir ständig"
	line "das beknackte"
	cont "Passwort ändern <...>"
	done

PrisonRoof_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $b, $d, 2, PRISON_F2

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 11, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, PrisonRoof_Trainer_1, -1
	person_event SPRITE_OFFICER, 11, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, PrisonRoof_Trainer_2, -1