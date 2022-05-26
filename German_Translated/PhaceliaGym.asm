PhaceliaGym_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhaceliaGymGuide:
	ctxt "Andre ist der Typ"
	line "Arenaleiter, der"
	para "seine Fäuste"
	line "sprechen lässt."

	para "Er ist sehr"
	line "hitzig, also gib"
	para "Acht auf deine"
	line "Worte."
	done

PhaceliaGym_Trainer_1:
	trainer EVENT_PHACELIA_GYM_TRAINER_1, BLACKBELT_T, 3, .before_battle_text, .battle_won_text

	ctxt "Ich muss viel"
	line "härter trainieren!"
	done

.before_battle_text
	ctxt "Du brauchst jahre-"
	line "langes Training,"
	para "bevor Andre dich"
	line "überhaupt als"
	cont "Schüler aufnimmt!"
	done

.battle_won_text
	text "UGAH UGAH!"
	done

PhaceliaGym_Trainer_2:
	trainer EVENT_PHACELIA_GYM_TRAINER_2, BLACKBELT_T, 4, .before_battle_text, .battle_won_text

	ctxt "Ich wache um 03:00"
	line "Uhr Morgens auf"
	para "und trainiere bis"
	line "abends um 21:00!"

	para "Ich muss stärker"
	line "werden als du es"
	para "dir je erträumen"
	line "könntest!"
	done

.before_battle_text
	ctxt "Um 03:00 Morgens"
	line "aufstehen, 16 Std"
	para "Training mit nur"
	line "3x 10 Min Pause."

	para "Tag für Tag."

	para "Das ist das Leben"
	line "eines Kriegers."
	done

.battle_won_text
	ctxt "Ich brauch mehr!"
	done

PhaceliaGym_Trainer_3:
	trainer EVENT_PHACELIA_GYM_TRAINER_3, BLACKBELT_T, 5, .before_battle_text, .battle_won_text

	ctxt "Ich hab dich gut"
	line "geschwächt. Gegen"
	para "Andre solltest du"
	line "keine Power mehr"
	cont "haben!"
	done

.before_battle_text
	ctxt "Ich bin zwar nur"
	line "der Stellvertreter"
	para "hier <...> Aber"
	line "das ist egal!"

	para "An mir kommst du"
	line "nicht vorbei."
	done

.battle_won_text
	ctxt "UNMÖGLICH!"
	done

PhaceliaGymLeader:
	faceplayer
	opentext
	checkflag ENGINE_MUSCLEBADGE
	sif true
		jumptext .already_defeated_text
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer ANDRE, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	special RestartMapMusic
	setflag ENGINE_MUSCLEBADGE
	writetext .before_giving_TM_text
	givetm TM_DYNAMICPUNCH + RECEIVED_TM
	waitbutton
	jumptext .after_giving_TM_text

.already_defeated_text
	ctxt "Technologie und"
	line "Zivilisation"
	para "bringen uns an den"
	line "Abgrund."

	para "Bis dahin werden"
	line "meine Crew und ich"
	para "mit unseren"
	line "#mon die"
	para "stärkste Allianz"
	line "bilden!"
	done

.introduction_text
	ctxt "Hmm, wie kamst du"
	line "so weit?"

	para "Meine Jünger"
	line "brauchen ein"
	cont "härteres Training!"

	para "Ich bin Andre."

	para "Diese Höhle hier"
	line "ist unser Zuhause."

	para "Meine #mon und"
	line "ich haben das hier"
	para "mit unseren Händen"
	line "gegraben!"

	para "Die Minenarbeiter"
	line "hier sind so"
	para "schwächlich, weil"
	line "sie ohne"
	para "Technologie nichts"
	line "mehr erledigen"
	cont "könnten."
	
	para "Statt einfach ihre"
	line "Körper zu einer"
	para "Maschiene zu"
	line "transofrmieren <...>"

	para "Naja, egal <...>"

	para "Jetzt zeige ich"
	line "dir meine Brutale"
	para "Berge-zerfetzende"
	line "MACHT!"
	sdone

.battle_won_text
	ctxt "NEIN!"

	para "Jetzt bist du noch"
	line "stark, aber wenn"
	para "die Gesellschaft"
	line "auseinanderbricht"
	para "und du deinen Beu-"
	line "tel nicht mehr"
	para "füllen kannst,"
	line "sieht es schlecht"
	cont "für dich aus!"

	para "Hier hast du zwar"
	line "den Orden, aber"
	para "wenn die Welt"
	line "untergeht, komm"
	para "nicht heulend zu"
	line "mir!"
	done

.received_badge_text
	ctxt "<PLAYER> erhält"
	line "den Muskel-Orden!"
	done

.before_giving_TM_text
	ctxt "Ich muss mich von"
	line "den weichmachenden"
	para "Vorteilen der"
	line "Technologie lösen"
	para "um hart und flei-"
	line "ßig zu bleiben."

	para "Nimm schon."
	done

.after_giving_TM_text
	ctxt "Diese TM ist"
	line "Wuchtschlag."

	para "Sie ist Ungenau,"
	line "aber wenn sie"
	para "trifft, wird der"
	line "Gegner verwirrt!"

	para "Das ist mein Weg,"
	line "mir mit meinen"
	para "Fäusten die Vor-"
	line "teile zu verschaf-"
	para "fen! Meine Schläge"
	line "sind daher"
	cont "immer wuchtig!"
	done

PhaceliaGym_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $f, $f, 2, PHACELIA_CITY
	warp_def $1, $3, 6, MILOS_F1

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 8
	person_event SPRITE_GYM_GUY, 10, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaGymGuide, -1
	person_event SPRITE_BLACK_BELT, 14, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, PhaceliaGym_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 11, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, PhaceliaGym_Trainer_2, -1
	person_event SPRITE_BLACK_BELT, 4, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, PhaceliaGym_Trainer_3, -1
	person_event SPRITE_CHUCK, 2, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhaceliaGymLeader, -1
	person_event SPRITE_ROCK, 5, 16, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 4, 3, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 3, 2, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
