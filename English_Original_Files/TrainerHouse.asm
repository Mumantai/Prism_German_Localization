TrainerHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

TrainerHouse_Trainer_1:
	trainer EVENT_TRAINER_HOUSE_TRAINER_1, SUPER_NERD, 2, .before_battle_text, .battle_won_text

	ctxt "Looks like you're"
	line "not my friend!"
	done

.before_battle_text
	ctxt "I always come here"
	line "to train with my"
	cont "#mon friends."
	done

.battle_won_text
	ctxt "<...>Grumble<...>"
	done

TrainerHouse_Trainer_2:
	trainer EVENT_TRAINER_HOUSE_TRAINER_2, SUPER_NERD, 1, .before_battle_text, .battle_won_text

	ctxt "I know my #mon"
	line "type alignments."
	done

.before_battle_text
	ctxt "Having lots of"
	line "#mon helps you"
	cont "deal with multiple"
	cont "different types."

	para "Ultimately, you"
	line "have no clear type"
	cont "weaknesses left!"
	done

.battle_won_text
	ctxt "Ow, ow, ow!"
	done

TrainerHouse_Trainer_3:
	trainer EVENT_TRAINER_HOUSE_TRAINER_3, POKEMANIAC, 2, .before_battle_text, .battle_won_text

	ctxt "Geez, don't brag"
	line "about it!"
	done

.before_battle_text
	ctxt "What is it?"
	done

.battle_won_text
	ctxt "Aiyeeee!"
	done

TrainerHouse_Trainer_4:
	trainer EVENT_TRAINER_HOUSE_TRAINER_4, POKEMANIAC, 1, .before_battle_text, .battle_won_text

	ctxt "You gave me a"
	line "shock of my own."
	done

.before_battle_text
	ctxt "Ha!"

	para "Shocked you,"
	line "didn't I?"
	done

.battle_won_text
	ctxt "Gaah! I lost!"
	line "Now I'm mad!"
	done

TrainerHouseBoss:
	checkevent EVENT_RYU_GOT_CYNDAQUIL
	sif true
		jumptextfaceplayer .after_giving_cyndaquil
	faceplayer
	opentext
	checkevent EVENT_RYU_BEATEN
	sif false, then
		writetext .before_battle_text
		closetext
		winlosstext .battle_won_text, 0
		loadtrainer BLACKBELT_T, 1
		startbattle
		reloadmapafterbattle
		setevent EVENT_RYU_BEATEN
		opentext
	sendif
	writetext .after_battle_text
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	sif =, 6
		jumptextfaceplayer .party_full_text
	writetext .got_cyndaquil_text
	playwaitsfx SFX_CAUGHT_MON
	givepoke CYNDAQUIL, 10, ORAN_BERRY, 0
	setevent EVENT_RYU_GOT_CYNDAQUIL
	jumptext .after_giving_cyndaquil

.after_giving_cyndaquil
	ctxt "Cyndaquil is a"
	line "rare Fire-type."

	para "I'm happy you"
	line "have it now, but"
	para "I'm running out"
	line "of #mon to"
	cont "give challengers."

	para "I always lose!"
	done

.before_battle_text
	ctxt "Greetings. I give"
	line "gifts to talented"
	cont "Trainers."

	para "Do you have what"
	line "it takes? Then<...>"

	para "Prove it!"
	sdone

.battle_won_text
	ctxt "Waaaarggh!"
	line "I'm beaten!"
	done

.after_battle_text
	ctxt "Congratulations,"
	line "you earned this"
	cont "gift."

	para "I found this"
	line "#mon, and it"
	para "needs a young"
	line "Trainer such as"
	cont "yourself!"
	done

.got_cyndaquil_text
	ctxt "<PLAYER> got"
	line "Cyndaquil!"
	done

.party_full_text
	ctxt "You have no room"
	line "in your party!"

	para "Come back when"
	line "you have room and"
	para "I'll give you your"
	line "prize."
	done

TrainerHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 8
	warp_def $7, $3, 9, OXALIS_CITY
	warp_def $e, $1, 2, TRAINER_HOUSE_B1F
	warp_def $0, $4, 1, TRAINER_HOUSE_B1F
	warp_def $e, $7, 3, TRAINER_HOUSE_B1F
	warp_def $2d, $4, 8, OXALIS_CITY
	warp_def $7, $4, 9, OXALIS_CITY
	warp_def $26, $4, 4, TRAINER_HOUSE_B1F
	warp_def $2d, $3, 8, OXALIS_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_SUPER_NERD, 29, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 5, TrainerHouse_Trainer_1, -1
	person_event SPRITE_SUPER_NERD, 27, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 5, TrainerHouse_Trainer_2, -1
	person_event SPRITE_POKEMANIAC, 25, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 5, TrainerHouse_Trainer_3, -1
	person_event SPRITE_POKEMANIAC, 23, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 5, TrainerHouse_Trainer_4, -1
	person_event SPRITE_BLACK_BELT, 31, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrainerHouseBoss, -1
