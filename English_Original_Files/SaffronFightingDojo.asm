SaffronFightingDojo_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronFightingDojo_Trainer_1:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_1, BLACKBELT_T, 7, .before_battle_text, .battle_won_text

	ctxt "The prime fighters"
	line "across the land"
	cont "train here."
	done

.before_battle_text
	ctxt "Hoohah!"

	para "Where might you"
	line "come from?"
	done

.battle_won_text
	ctxt "Came to seek out"
	line "our master, huh?"
	done

SaffronFightingDojo_Trainer_2:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_2, BLACKBELT_T, 8, .before_battle_text, .battle_won_text

	ctxt "We fear nothing"
	line "tough, but psychic"
	para "power frightens"
	line "us!"
	done

.before_battle_text
	ctxt "This Fighting Dojo"
	line "belonged to the"
	para "Elite Four's very"
	line "own Koichi!"

	para "Don't underestimate"
	line "us!"
	done

.battle_won_text
	ctxt "Master Koichi, I"
	line "have failed you!"
	done

SaffronFightingDojo_Trainer_3:
	trainer EVENT_SAFFRON_FIGHTING_DOJO_TRAINER_3, BLACKBELT_T, 9, .before_battle_text, .battle_won_text

	ctxt "Wait <'>til you see"
	line "our master!"
	done

.before_battle_text
	ctxt "Do you like your"
	line "mouth or fists"
	cont "doing the talking?"
	done

.battle_won_text
	ctxt "I take it it's the"
	line "latter."
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
	ctxt "Keep on getting"
	line "stronger, because"
	para "I'll always be"
	line "training too!"
	done

.before_battle_text
	ctxt "Hey!"

	para "I am Kiyo, the"
	line "Karate King!"

	para "Koichi's number one"
	line "disciple!"

	para "You!"

	para "Battle time!"

	para "Hwaaarggh!"
	sdone

.battle_won_text
	ctxt "I'm beaten!"

	para "Waaaarggh!"
	done

.earned_item_text
	ctxt "I'm crushed!"

	para "You earned this"
	line "belt!"
	sdone

.received_item_text
	ctxt "It'll make your"
	line "fighting #mon"
	para "even more"
	line "powerful!"
	done

.no_room_for_item_text
	ctxt "You foolish child,"
	line "make some room!"
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
	person_event SPRITE_BLACK_BELT, 2, 6, $3, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SaffronFightingDojoMaster, -1
