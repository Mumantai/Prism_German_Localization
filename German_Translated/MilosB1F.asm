MilosB1F_MapScriptHeader;trigger count
	db 2
	maptrigger MilosB1FCutscene
	maptrigger GenericDummyScript
 ;callback count
	db 0

MilosB1FFluteDude:
	faceplayer
	opentext
	checkevent EVENT_MILOS_CATACOMBS_RAZOR_FANG
	sif true
		jumptext .already_got_flute_text
	writetext .intro_text
	yesorno
	sif false
		jumptext .said_no_text
	checkitem LEMONADE
	sif false
		jumptext .no_lemonade_text
	verbosegiveitem RAZOR_FANG, 1
	sif false
		jumptext .no_room_text
	takeitem LEMONADE, 1
	setevent EVENT_MILOS_CATACOMBS_RAZOR_FANG
	jumptext .gave_lemonade_text

.already_got_flute_text
	ctxt "Der Scharfzahn"
	line "ist sehr"
	cont "faszinierend."

	para "Ich habe es in"
	line "der unteren ebene"
	cont "gesehen."

	para "Die Gerüchte sagen"
	line "es stamme aus"
	para "einer Antiken"
	line "Zivilisation."
	done

.intro_text
	ctxt "Ich liebe"
	line "Limonade!"

	para "Wenn du mir ein"
	line "Glas Limonade"
	para "bringst, gebe ich"
	line "dir etwas tolles!"

	para "Wie schauts aus?"
	line "Besorgst du mir"
	cont "welchen?<...>"
	done

.said_no_text
	ctxt "Das ist aber nicht"
	line "nett<...>"
	done

.no_lemonade_text
	ctxt "Du hast keine"
	line "Limonade dabei!"
	done

.gave_lemonade_text
	ctxt "Perfekt! kann es"
	line "kaum abwarten es"
	cont "zu trinken!"

	para "Warte mal<...>"

	para "Hast du noch nie"
	line "was von Kühlung"
	cont "gehört?"

	para "Sowas serviert man"
	line "KALT!"
	done

.no_room_text
	ctxt "Du hast kein Platz"
	line "für das Artifakt!"
	
	para "Ich nehme die Limo"
	line "nicht an, solange"
	para "du nichts von mir"
	line "annehmen kannst<...>"
	done

MilosB1F_YellowPatroller:
	trainer EVENT_MILOS_B1F_TRAINER_1, PATROLLER, 4, .before_battle_text, .battle_won_text

	ctxt "Schau mal, mir"
	line "gehts heute nicht"
	cont "nicht so gut."

	para "Lass mich in Ruh!"

	done

.before_battle_text
	ctxt "Dein ernst?"
	done

.battle_won_text
	ctxt "Ach, komm schon!"
	done

MilosB1FCutscene:
	opentext
	writetext .text_1
	writetext .text_2
	writetext .text_3
	writetext .text_4
	writetext .text_5
	spriteface 4, RIGHT
	writetext .text_6
	spriteface 6, LEFT
	writetext .text_7
	writetext .text_8
	writetext .text_9
	writetext .text_10
	spriteface 4, UP
	spriteface 6, UP
	writetext .text_11
	writetext .text_12
	writetext .text_13
	writetext .text_14
	writetext .text_15
	writetext .text_16
	writetext .text_17
	writetext .text_18
	writetext .text_19
	writetext .text_20
	writetext .text_21
	closetext
	follow 5, 8
	applymovement 5, .numbered_people_leaving
	opentext
	writetext .text_22
	writetext .text_23
	writetext .text_24
	spriteface 6, LEFT
	writetext .text_25
	closetext
	applymovement 6, .patrollers_leaving
	opentext
	writetext .text_26
	follow 4, 7
	closetext
	applymovement 4, .patrollers_leaving
	setevent EVENT_MILOS_CUTSCENE
	disappear 4
	disappear 5
	disappear 6
	disappear 7
	disappear 8
	dotrigger 1
	end

.numbered_people_leaving
	step_left
	step_left
	step_up
	step_left
	step_left
	step_left
	step_end

.patrollers_leaving
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_left
	step_left
	step_end

.text_1
	ctxt "Schwarz: Nun Boss<...>"

	para "Wann kriegen wir"
	line "eigentlich unsere"
	cont "Bezahlung?"
	sdone

.text_2
	ctxt "Nr. 13: Du wirst"
	line "bezahlt, wenn der"
	cont "Job erledigt ist!"
	sdone

.text_3
	ctxt "Gelb: Aber wir"
	line "machen den Job"
	cont "doch bereits!"
	sdone

.text_4
	ctxt "Nr. 08: Ah echt?"
	line "Dann erkläre mir"
	para "mal folgendes"
	line "FRÄULEIN!:"

	para "Warum haben die"
	line "Bullen dann einen"
	para "Verdacht, dass in"
	line "Untergrund City"
	cont "etwas faul ist?"
	sdone

.text_5
	ctxt "Schwarz: Es hat"
	line "vermutlich etwas"
	para "mit den Natur-"
	line "Katastrophen"
	cont "neuerdings zu tun<...>"
	sdone

.text_6
	ctxt "Grün: 'Fräulein'?"

	para "Warte<...> DIGGA<...>"

	para "Du bist ne Frau?"
	sdone

.text_7
	ctxt "Gelb: Natürlich!"
	line "Wir waren auf der"
	para "selben Schule, du"
	line "Idiot!"
	sdone

.text_8
	ctxt "Grün: <...> Als ob"
	line "ich mich an alle"
	para "Mädchen aus der"
	line "Schule erinnern"
	cont "würde<...>"
	sdone

.text_9
	ctxt "Gelb: Aber zu-"
	line "mindest an deine"
	cont "Freunde, du Idiot."

	sdone

.text_10
	ctxt "Nr. 13: Ist das"
	line "etwa, was Ihr als"
	para "<'>Job erledigen'"
	line "bezeichnet?"
	
	sdone

.text_11
	ctxt "Nr. 08: Ich glaubs"
	line "nicht, dass der"
	para "Boss diese Idioten"
	line "eingestellt hat."
	sdone

.text_12
	ctxt "Nr. 13: Seid jetzt"
	line "alle mal LEISE und"
	para "macht euren"
	line "scheiss job!"

	para "Ich will keine"
	line "Bullen, kapische?"
	sdone

.text_13
	ctxt "Gelb: Kapiert, die"
	line "Bullen sind aber"
	para "unser geringstes"
	line "Problem<...>"
	sdone

.text_14
	ctxt "Grün: Da ist so"
	line "ein Kind aus einer"
	para "weit entfernten"
	line "Region, der uns"
	para "immer in die quere"
	line "kommt!"
	sdone

.text_15
	ctxt "Schwarz: Egal was"
	line "wir auch tun,"
	para "werden wir auf"
	line "dieses 'Problem'"
	cont "stossen."
	sdone

.text_16
	ctxt "Gelb: Es ist sowas"
	line "wie unser"
	cont "Schicksal<...>"
	sdone

.text_17
	ctxt "Green: Genau!"
	sdone

.text_18
	ctxt "Nr. 13: Wenn dem"
	line "so ist<...>"

	para "Dann gebe ich dem"
	line "Boss lieber mal"
	cont "bescheid."
	sdone

.text_19
	ctxt "Nr. 08: Wir werden"
	line "uns darum kümmern."
	sdone

.text_20
	ctxt "Nr. 13: macht euch"
	line "keine Sorgen."
	sdone

.text_21
	ctxt "Nr. 08: Nunja,"
	line "haltet uns "
	para "weiterhin am"
	line "laufenden<...>"

	para "Wir sind kurz"
	line "davor, das Projekt"
	cont "abzuschließen."
	sdone

.text_22
	ctxt "Grün: Das war"
	line "aber mal ein"
	cont "geplänkel<...>"
	sdone

.text_23
	ctxt "Gelb: Ja, aber"
	line "warum kanntest du"
	para "mein Geschlecht"
	line "nicht? Wir sind so"
	para "lange zusammen!"
	sdone

.text_24
	ctxt "Grün: WAS sind"
	line "wir?<...> WIE"
	cont "kommst du darauf?"
	sdone

.text_25
	ctxt "Gelb: <...>"
	prompt

.text_26
	ctxt "Grün: Warte mal,"
	line "es ist schwer was"
	para "zu verstehen mit"
	line "diesem Helm."
	sdone

MilosB1F_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $21, $21, 8, MILOS_F1
	warp_def $3, $3, 1, MILOS_B2F
	warp_def $21, $7, 5, MILOS_F1
	warp_def $11, $3, 1, MILOS_B2FB
	warp_def $4, $8, 3, MILOS_B2F
	warp_def $5, $8, 3, MILOS_B2F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 7
	person_event SPRITE_POKEFAN_M, 6, 36, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MilosB1FFluteDude, -1
	person_event SPRITE_PALETTE_PATROLLER, 6, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 2, MilosB1F_YellowPatroller, EVENT_MILOS_B1F_TRAINER_1
	person_event SPRITE_PALETTE_PATROLLER, 31, 33, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_SCIENTIST, 29, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_PALETTE_PATROLLER, 31, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_PALETTE_PATROLLER, 31, 32, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
	person_event SPRITE_SCIENTIST, 29, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MILOS_CUTSCENE
