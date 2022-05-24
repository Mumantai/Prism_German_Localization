FirelightRooms_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

FirelightRooms_Trainer_1:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_1, COOLTRAINERM, 4, .before_battle_text, .battle_won_text

	ctxt "Aber wenn man sich"
	line "als Verlierer <...>"

	para "bezeichnet, dann"
	line "glauben das alle!"
	done

.before_battle_text
	ctxt "Wenn man sich"
	line "'cool' nennt, ist"
	cont "das dann arrogant?"
	done

.battle_won_text
	ctxt "Diese Ironie <...>"
	done

FirelightRooms_Trainer_2:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_2, COOLTRAINERF, 2, .before_battle_text, .battle_won_text

	ctxt "Ich schwitze <...>"

	para "wie ein Traumato"
	line "in der Sauna!"
	done

.before_battle_text
	ctxt "Es ist so schwül"
	line "hier, dass ich"
	cont "schon schwitze!"
	done

.battle_won_text
	ctxt "Jetzt bin ich"
	line "durchnässt <...>."
	done

FirelightRooms_Trainer_3:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_3, COOLTRAINERM, 5, .before_battle_text, .battle_won_text

	ctxt "Wenn es doch nur"
	line "Schuhe gäbe, mit"
	para "denen du über Lava"
	line "gehen könntest <...>"
	
	para "Das wäre was!"
	done

.before_battle_text
	ctxt "Die Lava steigt"
	line "immer bis zu der"
	para "Stelle, an der"
	line "wir gerade stehen!"

	para "Das nenne ich"
	line "leben am Limit!"
	done

.battle_won_text
	ctxt "Verdammt!"
	done

FirelightRooms_Trainer_4:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_4, FIREBREATHER, 2, .before_battle_text, .battle_won_text

	ctxt "Mein Magmar und"
	line "ich lieben es,"
	cont "Feuer zu spucken!"
	
	para "Ich habe Jahre"
	line "gebraucht, um es"
	para "so gut wie Magmar"
	line "hinzubekommen!"
	done

.before_battle_text
	ctxt "Mann kann hier"
	line "nichts verbrennen,"
	para "weshalb das hier"
	line "der beste Ort"
	cont "zum Üben ist!"
	done

.battle_won_text
	ctxt "Hmm, so sollte"
	line "das eigentlich"
	cont "nicht ausgehen."
	done

FirelightRooms_Trainer_5:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_5, FIREBREATHER, 3, .before_battle_text, .battle_won_text

	ctxt "Ganz ehrlich, wer"
	line "baut denn bitte"
	para "direkt neben einen"
	line "aktiven Vulkan so"
	cont "einen Park hin?"
	done

.before_battle_text
	ctxt "Ich wurde aus dem"
	line "Park geworfen."

	para "Sie lassen mich"
	line "da einfach nicht"
	cont "Feuer spucken!"
	done

.battle_won_text
	text "Uff."
	done

FirelightRooms_Trainer_6:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_6, COOLTRAINERF, 3, .before_battle_text, .battle_won_text
	ctxt "Ach, der heiße Ort"
	line "im Süd-Westen <...>"
	para "'Heiß' im Sinne"
	line "von sehenswürdig."
	para "Nicht wegen der"
	line "Temperatur dort."
	done

.before_battle_text
	ctxt "Im Süd-Westen von"
	line "hier ist ein sehr"
	cont "heißer Ort."

	para "Diese Region hat"
	line "schon sehr"
	para "interesannte"
	line "Landschaften."
	done

.battle_won_text
	ctxt "Ich hörte, hier"
	line "könne man sehr gut"
	cont "trainieren <...>"
	done

FirelightRooms_MapEventHeader:: db 0, 0

.Warps
	db 9
	warp_def 43, 33, 1, FIRELIGHT_PALLETPATH_B1F
	warp_def 33, 5, 1, FIRELIGHT_MINECART
	warp_def 49, 17, 2, FIRELIGHT_F1
	warp_def 7, 7, 8, FIRELIGHT_ROOMS
	warp_def 21, 25, 9, FIRELIGHT_ROOMS
	warp_def 51, 7, 1, FIRELIGHT_GROUDON
	warp_def 5, 47, 2, FIRELIGHT_ITEMROOM
	warp_def 37, 47, 4, FIRELIGHT_ROOMS
	warp_def 55, 53, 5, FIRELIGHT_ROOMS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_POKE_BALL, 25, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SUNNY_DAY, 0, EVENT_FIRELIGHT_ROOMS_TM
	person_event SPRITE_POKE_BALL, 19, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BLACKGLASSES, EVENT_FIRELIGHT_ROOMS_ITEM_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 53, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_FIRELIGHT_ROOMS_ITEM_ELIXIR
	person_event SPRITE_YOUNGSTER, 44, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_F, 55, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_2, -1
	person_event SPRITE_YOUNGSTER, 29, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, FirelightRooms_Trainer_3, -1
	person_event SPRITE_FISHER, 4, 32, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, FirelightRooms_Trainer_4, -1
	person_event SPRITE_FISHER, 13, 49, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_5, -1
	person_event SPRITE_COOLTRAINER_F, 28, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_6, -1
