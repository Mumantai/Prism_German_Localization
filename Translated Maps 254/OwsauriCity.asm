OwsauriCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_OWSAURI_CITY
	return

OwsauriCityStatExpAnalyzerSign:
	ctxt "#mon-Einblicke"
	done

OwsauriCityNameRaterSign:
	ctxt "Namensbewerter"
	done

OwsauriCityGymSign:
	ctxt "#mon-Arena"
	next "Leiterin: Lily"
	nl   ""
	next "Die kalte und"
	next "eisige Trainerin!"
	done

OwsauriCityNPC1:
	ctxt "Wegen den  Klima-"
	line "anlagen in der"
	para "Arena, musste man"
	line "das Kraftwerk"
	cont "renovieren."
	para "Die Eis-#mon"
	line "da drinnen, fühlen"
	para "sich bestimmt"
	line "pudelwohl."
	done

OwsauriCityNPC2:
	ctxt "Ich pflege nur den"
	line "Garten <...>"
	para "Ich habe diese"
	line "Blumen aus Johto!"
	done

OwsauriCityNPC3:
	ctxt "Sie haben ne Menge"
	line "neue Spiele in der"
	cont "Spielhalle" 
	cont "hinzugefügt."
	para "Ich hatte schon"
	line "keine Lust mehr"
	cont "auf die alten"
	cont "Spielautomaten."
	done

OwsauriCityNPC4:
	ctxt "Nach dem großen"
	line "Erdbeben damals,"
	para "sind viele Bewohn-"
	line "er aus Dukatia"
	para "City hier her"
	line "gezogen, während"
	para "die Gebäude dort"
	line "wieder aufgebaut"
	cont "wurden."
	para "Nach dem Wieder-"
	line "aufbau sind einige"
	para "zurückgegangen,"
	line "aber andere sind"
	cont "auch geblieben."
	para "Mir gefällt diese"
	line "Vielfalt wirklich!"
	done

OwsauriCity_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 21, 3, 1, OWSAURI_NAMERATER
	warp_def 23, 17, 1, OWSAURI_MART
	warp_def 23, 33, 1, OWSAURI_POKECENTER
	warp_def 31, 32, 1, OWSAURI_GYM
	warp_def 9, 12, 1, OWSAURI_STATEXP
	warp_def 23, 9, 1, OWSAURI_HOUSE
	warp_def 23, 21, 1, OWSAURI_GAME_CORNER

.CoordEvents: db 0

.BGEvents: db 3
	signpost 11, 13, SIGNPOST_LOAD, OwsauriCityStatExpAnalyzerSign
	signpost 23, 5, SIGNPOST_LOAD, OwsauriCityNameRaterSign
	signpost 33, 33, SIGNPOST_LOAD, OwsauriCityGymSign

.ObjectEvents: db 5
	person_event SPRITE_LASS, 26, 32, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OwsauriCityNPC1, -1
	person_event SPRITE_KIMONO_GIRL, 18, 6, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OwsauriCityNPC2, -1
	person_event SPRITE_FISHER, 15, 19, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, OwsauriCityNPC3, -1
	person_event SPRITE_SUPER_NERD, 12, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, OwsauriCityNPC4, -1
	person_event SPRITE_FRUIT_TREE, 16, 31, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_FRUITTREE, 0, BLUE_APRICORN_TREE_1, -1