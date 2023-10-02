Route87_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route87DirectionsSign:
	ctxt "<UP> Tunod Wasserpfad"
	next "<UP><UP> Südport City"
	next "<DOWN> Lauralia City"
	done

Route87IslandSign:
	signpostheader 5
	done

Route87_Trainer_1:
	trainer EVENT_ROUTE_87_TRAINER_1, SWIMMERM, 9, .before_battle_text, .battle_won_text
	ctxt "Vor dem schwimmen"
	line "solltest du dich"
	cont "immer dehnen."
	para "Ich mache es immer"
	line "vor den Mädels!"
	done

.before_battle_text
	ctxt "Das ist ein langer"
	line "Wasserpfad."
	para "Deine #mon sind"
	line "hoffentlich gut"
	cont "vorbereitet?"
	done

.battle_won_text
	ctxt "Das war sehr"
	line "intensiv!"
	done

Route87_Trainer_2:
	trainer EVENT_ROUTE_87_TRAINER_2, SWIMMERF, 7, .before_battle_text, .battle_won_text
	ctxt "Du hast ja deinen"
	line "ganzen Zorn raus-"
	cont "gelassen<...> Gut so!"
	done

.before_battle_text
	ctxt "Zeit für einen"
	line "entspannten Kampf"
	para "mit beruigenden"
	line "Meeresrauschen im"
	cont "Hintergrund."
	done

.battle_won_text
	ctxt "Du musst dich"
	line "entspannen."
	done

Route87_Trainer_3:
	trainer EVENT_ROUTE_87_TRAINER_3, SWIMMERM, 10, .before_battle_text, .battle_won_text
	ctxt "Mein Flug wurde um"
	line "4 Stunden"
	cont "verschoben."
	para "Ich bin also"
	line "umsonst so früh"
	cont "aufgestanden!"
	done

.before_battle_text
	ctxt "Der naheste Flug-"
	line "hafen nach Naljo"
	para "befindet sich in"
	line "der Süd-Stadt und"
	para "da muss man sehr"
	line "lange hin-"
	cont "schwimmen!"
	done

.battle_won_text
	ctxt "Oh, ich kriege"
	line "einen Anruf von"
	para "der"
	line "Fluggesellschaft<...>"
	done

Route87_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $37, $a, 16, MAGIKARP_CAVERNS_MAIN

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 48, 12, SIGNPOST_LOAD, Route87DirectionsSign
	signpost 53,  8, SIGNPOST_LOAD, Route87IslandSign

	;people-events
	db 3
	person_event SPRITE_SWIMMER_GUY, 40, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route87_Trainer_1, -1
	person_event SPRITE_SWIMMER_GIRL, 23, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, Route87_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 12, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, Route87_Trainer_3, -1