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
	ctxt "#mon in-depth"
	done

OwsauriCityNameRaterSign:
	ctxt "Name Rater"
	done

OwsauriCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Lily"
	nl   ""
	next "The cold 'n icy"
	next "Trainer!"
	done

OwsauriCityNPC1:
	ctxt "All those air"
	line "conditioners in"
	para "that Gym forced"
	line "various people to"
	para "renovate the local"
	line "Power Plant."

	para "I guess the ice"
	line "#mon must be"
	para "comfortable in"
	line "there."
	done

OwsauriCityNPC2:
	ctxt "I'm just tending to"
	line "the garden<...>"

	para "I got these"
	line "flowers from"
	cont "Johto!"
	done

OwsauriCityNPC3:
	ctxt "They added a bunch"
	line "of new games to"
	cont "the Game Corner."

	para "I was getting"
	line "tired of only"
	cont "slots."
	done

OwsauriCityNPC4:
	ctxt "When that earth-"
	line "quake hit in"
	para "Goldenrod a couple"
	line "of years ago, and"
	para "they had to re-"
	line "build some of the"
	para "buildings there,"
	line "we had quite a few"
	para "of those people"
	line "move here."

	para "Some moved back"
	line "after the"
	para "construction, but"
	line "others stayed."

	para "I'm always open to"
	line "diversity!"
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
