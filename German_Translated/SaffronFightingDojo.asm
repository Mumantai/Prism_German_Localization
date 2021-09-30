SaffronFightingDojo_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaffronFightingDojo_Trainer_1:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_1, BLACKBELT_T, 7, .before_battle_text, .battle_won_text

	ctxt "Hier trainieren"
	line "die besten Kämpfer"
	cont "des Landes."


	done

.before_battle_text
	ctxt "Und von wo kommst"
	line "du denn?"

	done

.battle_won_text
	ctxt "Hergekommen, um"
	line "unseren Meister zu"
	cont "sehen, was?"

	done

SaffronFightingDojo_Trainer_2:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_2, BLACKBELT_T, 8, .before_battle_text, .battle_won_text

	ctxt "Psychische Kraft"
	line "macht uns Angst!"

	done

.before_battle_text
	ctxt "Lässt du lieber"
	line "deinen Mund oder"
	para "deine Fäuste "
	line "sprechen?"

	done

.battle_won_text
	ctxt "Ich glaube, es ist"
	line "Letzteres."

	done

SaffronFightingDojo_Trainer_3:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_3, BLACKBELT_T, 9, .before_battle_text, .battle_won_text

	ctxt "Warte nur, bis du"
	line "unserem Meister "
	cont "begegnest!"

	done

.before_battle_text
	ctxt "Bist du bereit,"
	line "dem Meister ins"
	cont "Auge zu sehen?"

	done

.battle_won_text
	ctxt "Ja!"

	para "Bist du!"

	done

SaffronFightingDojoMaster:
	faceplayer
	opentext
	checkevent EVENT_FIGHTING_DOJO_WIN
	sif false, then
		writetext .before_battle_text
		winlosstext .battle_won_text, 0
		setlasttalked 255
		writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
		loadtrainer BLACKBELT_T, 10
		startbattle
		reloadmapafterbattle
		playmapmusic
		opentext
		setevent EVENT_FIGHTING_DOJO_WIN
	sendif
	checkevent EVENT_FIGHTING_DOJO_GOT_ITEM
	sif true
		jumptext .already_battled_text
	writetext .earned_item_text
	verbosegiveitem BLACKBELT, 1
	sif false
		jumptext .no_room_for_item_text
	setevent EVENT_FIGHTING_DOJO_GOT_ITEM
	jumptext .received_item_text

.already_battled_text
	ctxt "Immer weiter "
	line "Trainieren!"

	para "Das werde ich auch"
	line "machen!"

	done

.before_battle_text
	ctxt "Hey!"

	para "Ich bin Kiyo, der "
	line "Karate-König!"

	cont "Du!"

	para "Kämpfen!"

	line "Hayaa!"

	sdone

.battle_won_text
	ctxt "Ich wurde besiegt!"

	para "Waaaarggh!"

	done

.earned_item_text
	ctxt "Ich bin am Ende!"

	para "Du hast dir diesen"
	line "Gürtel verdient!"

	sdone

.received_item_text
	ctxt "Es wird deine"
	line "Kampf-#mon noch"
	cont "stärker machen!"

	done

.no_room_for_item_text
	ctxt "Du dummes Kind,"
	line "mach Platz!"

	done

SaffronFightingDojo_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $f, $9, 1, SAFFRON_CITY
	warp_def $f, $a, 1, SAFFRON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_BLACK_BELT, 10, 4, $9, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, SaffronFightingDojo_Trainer_1, -1
	person_event SPRITE_BLACK_BELT, 8, 7, $8, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, SaffronFightingDojo_Trainer_2, -1
	person_event SPRITE_BLACK_BELT, 6, 4, $9, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, SaffronFightingDojo_Trainer_3, -1
	person_event SPRITE_BLACK_BELT, 2, 5, $3, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SaffronFightingDojoMaster, -1
