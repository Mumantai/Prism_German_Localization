OlcanIsle_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OlcanIsleSeagallop:
	ctxt "Seesprint-Fähre"
	nl   ""
	next "Leider derzeit"
	next "außer Betrieb."
	done

OlcanIsleTritorch:
	ctxt "<UP> Trifackelberg"
	done

OlcanIsleNPC1:
	ctxt "Rankor umfasst"
	line "alle Inseln"
	para "zwischen Tunod und"
	line "Johto."
	para "Es scheint nicht"
	line "viel zu sein, aber"
	para "sie haben ihre"
	line "eigene Liga und"
	para "die Sehenswürdig-"
	line "keiten sind"
	cont "atemberaubend!"
	done

OlcanIsle_Trainer_1:
	trainer EVENT_OLCAN_ISLE_TRAINER_1, BLACKBELT_T, 12, .before_battle_text, .battle_won_text
	ctxt "Rankors Trainer"
	line "sind im Durch-"
	para "schnitt die"
	line "stärksten der"
	cont "Welt."
	para "Hoffe du bist"
	line "vorbereitet."
	done

.before_battle_text
	ctxt "Hey, Trainer!"
	para "Du hast gerade"
	line "die Rankor-Region"
	cont "betreten."
	para "Zeig mal, was"
	line "du drauf hast."
	done

.battle_won_text
	ctxt "Ich sehe du bist"
	line "was besonderes."
	done

OlcanIsle_Trainer_2:
	trainer EVENT_OLCAN_ISLE_TRAINER_2, HIKER, 16, .before_battle_text, .battle_won_text
	ctxt "Die Ulka-Insel hat"
	line "den Trifackelberg,"
	para "einen aktiven"
	line "Vulkan."
	para "Das Wetter hier"
	line "ist daher sehr"
	cont "heiß!"
	done

.before_battle_text
	ctxt "Tunod?"
	para "Sorry, kiddo,"
	line "Diese Insel ist"
	para "Teil des Rankor"
	line "Archipels."
	done

.battle_won_text
	ctxt "Wow! Du bist ja"
	line "gar kein Tourist!"
	done

OlcanIsle_Trainer_3:
	trainer EVENT_OLCAN_ISLE_TRAINER_3, POKEMANIAC, 5, .before_battle_text, .battle_won_text
	ctxt "Rankor ist die"
	line "Heimat von starken"
	cont "Trainern."
	para "Wir können es uns"
	line "nicht wegnehmen"
	cont "lassen!"
	done

.before_battle_text
	ctxt "Tunod versucht die"
	line "Rankor Region zu"
	cont "annektieren!"
	para "Aber wir Elite-"
	line "trainer werden"
	cont "dagegen ankämpfen!"
	done

.battle_won_text
	ctxt "Krass! Bleib bei"
	line "uns solange du"
	cont "willst."
	done

OlcanIsle_Trainer_4:
	trainer EVENT_OLCAN_ISLE_TRAINER_4, MINER, 6, .before_battle_text, .battle_won_text
	ctxt "Ein Felsbrocken"
	line "fiel herab und"
	para "hat den Weg zum"
	line "Trifackelberg"
	cont "versperrt."
	para "Die meisten Leute"
	line "konnten durch"
	para "Fliegen entkommen,"
	line "aber der Rest"
	para "blieb um zu"
	line "trainieren."
	para "Rankors Trainer"
	line "eben."
	done

.before_battle_text
	ctxt "Sorry, Trainer,"
	line "der Weg ist für"
	para "eine Weile noch"
	line "gesperrt."
	para "Wie wärs"
	line "stattdessen"
	cont "mit einem Kampf?"
	done

.battle_won_text
	ctxt "Puh<...> Die Hitze"
	line "nervt."
	done

OlcanIsle_Trainer_5:
	trainer EVENT_OLCAN_ISLE_TRAINER_5, SWIMMERF, 15, .before_battle_text, .battle_won_text
	ctxt "Das Wasser hier"
	line "ist wirklich warm!"
	para "Als ich hörte,"
	line "dass die Fähre"
	para "ausgefallen ist,"
	line "musste ich sofort"
	para "hier hin Surfen!"
	line "Endlich keine"
	cont "Touristen mehr!"
	done

.before_battle_text
	ctxt "Hallo!"
	para "Was bringt dich"
	line "hierher auf diese"
	cont "abgelegene Insel?"
	done

.battle_won_text
	ctxt "Du kommst all den"
	line "Weg aus Naljo?"
	done

OlcanIsle_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def 33, 42, 2, OLCAN_CHINE_ENTRANCE
	warp_def  9, 27, 1, OLCAN_POKECENTER
	warp_def 15,  8, 1, OLCAN_DOCK_EXIT
	warp_def 15,  9, 2, OLCAN_DOCK_EXIT

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost  9, 28, SIGNPOST_JUMPSTD, pokecentersign
	signpost 16,  6, SIGNPOST_LOAD, OlcanIsleSeagallop
	signpost  6, 12, SIGNPOST_LOAD, OlcanIsleTritorch

.ObjectEvents
	db 8
	person_event SPRITE_BLACK_BELT, 26, 26, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, OlcanIsle_Trainer_1, -1
	person_event SPRITE_HIKER, 21, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, OlcanIsle_Trainer_2, -1
	person_event SPRITE_POKEMANIAC,  9, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, OlcanIsle_Trainer_3, -1
	person_event SPRITE_MINER,  8, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, OlcanIsle_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 32, 35, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, OlcanIsle_Trainer_5, -1
	person_event SPRITE_HIKER, 16, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, OlcanIsleNPC1, -1
	person_event SPRITE_POKE_BALL, 14, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, RARE_CANDY, EVENT_OLCAN_ISLE_ITEM_1
	person_event SPRITE_POKE_BALL, 31, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SAFE_GOGGLES, EVENT_OLCAN_ISLE_ITEM_2