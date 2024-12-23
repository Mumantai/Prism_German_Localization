TrainerHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

TrainerHouse_Trainer_1:
	trainer EVENT_TRAINER_HOUSE_TRAINER_1, SUPER_NERD, 2, .before_battle_text, .battle_won_text
	ctxt "Anscheinend bist"
	line "du kein freund!"
	done

.before_battle_text
	ctxt "Ich komme oft her,"
	line "um mit freunden"
	cont "zu trainieren."
	done

.battle_won_text
	text "Wrrrr <...>"
	done

TrainerHouse_Trainer_2:
	trainer EVENT_TRAINER_HOUSE_TRAINER_2, SUPER_NERD, 1, .before_battle_text, .battle_won_text
	ctxt "Ich kenne die Stä-"
	line "rken aller Typen."
	done

.before_battle_text
	ctxt "Mit verschiedenen"
	line "#mon bestehst"
	cont "du eher gegen"
	cont "Typ-schwächen."
	para "Im besten Fall"
	line "hast du keine Typ-"
	cont "schwäche mehr!"
	done

.battle_won_text
	ctxt "Ow, ow, ow!"
	done

TrainerHouse_Trainer_3:
	trainer EVENT_TRAINER_HOUSE_TRAINER_3, POKEMANIAC, 2, .before_battle_text, .battle_won_text
	ctxt "Ja, hör auf zu"
	line "Prahlen!"
	done

.before_battle_text
	ctxt "mal schauen <...>"
	done

.battle_won_text
	ctxt "Ohyemine!"
	done

TrainerHouse_Trainer_4:
	trainer EVENT_TRAINER_HOUSE_TRAINER_4, POKEMANIAC, 1, .before_battle_text, .battle_won_text
	ctxt "Du hast mich"
	line "geschockt <...>"
	done

.before_battle_text
	ctxt "Boo!"
	para "Und? Geschockt?"
	done

.battle_won_text
	ctxt "NEIN! Verloren!"
	line "Man bin ich sauer!"
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
	ctxt "Feurigel ist ein"
	line "Feuer-Typ #mon."
	para "Ich freu mich für"
	line "euch, aber so"
	para "langsam gehen mir"
	line "die #mon aus <...>"
	para "Ich verliere nur!"
	done

.before_battle_text
	ctxt "Grüß dich, ich"
	line "belohne gute"
	cont "Trainer."
	para "Hast du das Zeug"
	line "zum Trainer? <...>"
	para "Wir werden sehen!"
	sdone

.battle_won_text
	ctxt "WAAS!"
	line "besiegt <...>"
	done

.after_battle_text
	ctxt "Glückwunsch,"
	line "Das ist für dich."
	para "Ich fand dieses"
	line "#mon und möchte"
	para "es einem starken"
	line "Trainer wie dir"
	cont "überreichen!"
	done

.got_cyndaquil_text
	ctxt "<PLAYER> erhält"
	line "Feurigel!"
	done

.party_full_text
	ctxt "Du hast kein Platz"
	line "im Team!"
	para "Komm wieder wenn"
	line "du Platz hast."
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