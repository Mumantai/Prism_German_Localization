PrisonWorkout_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PrisonWorkoutTrashCan:
	ctxt "Hier ist nur"
	line "Müll."
	done

PrisonWorkoutNPC1:
	ctxt "Ich hörte, dass"
	line "diese Insel der"
	para "Ruheort der"
	line "legendären Naljo-"
	cont "Wächter war."

	para "Menschen und"
	line "andere #mon"
	para "war es verboten,"
	line "diese Insel zu"
	cont "betreten."

	para "Die von außen"
	line "gerufene Bau-"
	cont "Firma hat das"
	para "nicht interessiert"
	line "und haben wie"
	para "befohlen das"
	line "Gefängnis auf"
	para "dieses historische"
	line "Denkmal gebaut."
	done

PrisonWorkoutNPC2:
	ctxt "Muskeln aufbauen"
	line "ist das Einzige,"
	para "was ich zur"
	line "Abwechslung noch"
	cont "tun kann <...>"

	para "Es füllt dennoch"
	line "nicht die Leere"
	cont "in mir <...>"

	para "Als sie mich hier"
	line "einsperrten,"
	para "trennten sie mich"
	line "von meinen"
	cont "#mon <...>"

	para "Die Freundschaft"
	line "zwischen uns war"
	para "so stark, wie es"
	line "meine Muskeln"
	para "niemals werden"
	line "könnten <...>"
	done

PrisonWorkoutKeyGuy:
	faceplayer
	opentext
	checkevent EVENT_PRISON_WORKOUT_KEY
	sif true
		jumptext .key_given_text
	writetext .give_key_text
	verbosegiveitem CAGE_KEY, 1
	waitbutton
	sif false
		jumptext .no_space_text
	setevent EVENT_PRISON_WORKOUT_KEY
	closetextend

.give_key_text
	ctxt "Hah!"

	para "Was willst du,"
	line "kleiner Wurm?"

	para "Suchst du nach"
	line "Zellenschlüsseln?"

	para "Jupp, ich hab noch"
	line "einen zweiten."

	para "Ich brauchs nicht,"
	line "weil ich HART"
	para "genug für den"
	line "Knast bin."
	sdone

.key_given_text
	ctxt "Du musst härter"
	line "werden."

	para "Ohne Härte über-"
	line "lebst du hier"
	cont "sonst nicht."
	done

.no_space_text
	ctxt "Du hast kein Platz"
	line "im Beutel."
	done

PrisonWorkoutGuard:
	faceplayer
	opentext
	checkevent EVENT_PRISON_WORKOUT_TRAINER
	sif false, then
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer OFFICER, 7
		startbattle
		reloadmapafterbattle
		playmapmusic
		setevent EVENT_PRISON_WORKOUT_TRAINER
		jumptext .after_winning_text
	sendif
	checkevent EVENT_PRISON_ROOF_TRAINER_2
	sif false
		jumptext .already_beaten_text
	setevent EVENT_PRISON_B1F_KNOW_PASSWORD
	jumptext .password_text

.already_beaten_text
	ctxt "Hey, Kiddie."

	para "Du solltest mit"
	line "den leichtesten"
	cont "Gewichten starten."

	para "Du brauchst noch"
	line "sehr viel Training"
	para "bevor du solche"
	line "Muskeln wie wir"
	cont "kriegst."
	done

.before_battle_text
	ctxt "Meine Güte!"

	para "Du Pisser hast"
	line "mich voll"
	para "erschreckt,"
	line "ich schwör."

	para "Hier geht so"
	line "viel Krasses ab"
	cont "und so <...>"

	para "Lass uns zur Be-"
	line "ruhigung kämpfen!"

	para "Aber ohne Treten"
	line "klaro?"
	sdone

.battle_won_text
	ctxt "Das ist"
	line "unglaublich."
	done

.after_winning_text
	ctxt "Pass da unten"
	line "auf dich auf."
	
	para "Diese #mon sind"
	line "unvorhersehbar."
	done

.password_text
	ctxt "Was ist das?"

	para "Johnny-Boy sagte,"
	line "es ist OK, dir das"
	cont "Passwort zu geben?"

	para "Ah, OK. Bitte"
	line "Entschuldige."

	para "Das Passwort für"
	line "das Haupt-Tor"
	para "lautet:"
	line "Wigglyjelly."

	para "Es ist eine"
	line "Süßigkeit aus"
	cont "den USA!"

	para "Oder war es:"
	line "Jigglydoughnut <...>?"

	para "Ne, ne, ne! ich"
	line "bin sicher es war:"
	cont "Wigglyjelly!"
	done

PrisonWorkoutNurse:
	faceplayer
	opentext
	writetext .before_healing_text
	special HealParty
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	jumptext .after_healing_text

.before_healing_text
	ctxt "Du siehst müde aus"

	para "Ruh dich hier"
	line "ruhig etwas aus."
	sdone

.after_healing_text
	ctxt "Jetzt siehst du"
	line "viel besser aus."

	para "Komm jederzeit"
	line "wieder her."
	done

PrisonWorkout_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $8, $0, 10, PRISON_F1
	warp_def $9, $0, 11, PRISON_F1

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 15, 18, SIGNPOST_TEXT, PrisonWorkoutTrashCan
	signpost 3, 18, SIGNPOST_TEXT, PrisonWorkoutTrashCan

	;people-events
	db 5
	person_event SPRITE_BLACK_BELT, 14, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, PrisonWorkoutNPC1, -1
	person_event SPRITE_BLACK_BELT, 4, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, PrisonWorkoutNPC2, -1
	person_event SPRITE_BLACK_BELT, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonWorkoutKeyGuy, -1
	person_event SPRITE_OFFICER, 13, 17, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonWorkoutGuard, -1
	person_event SPRITE_NURSE, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PrisonWorkoutNurse, -1
