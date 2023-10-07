GoldenrodCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag:
	setflag ENGINE_FLYPOINT_GOLDENROD_CITY
	return

GoldenrodCity_GoldToken:
	dw EVENT_GOLDENROD_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

GoldenrodCity_GymSign:
	ctxt "#mon Gym"
	next "Leader: Whitney"
	nl   ""
	next "The Incredibly"
	next "Pretty Girl!"
	done

GoldenrodCity_CitySign:
	ctxt "The Festive City"
	next "of Opulent Charm"
	done

GoldenrodCity_CapeSign:
	ctxt "<LEFT> Goldenrod Cape"
	done

GoldenrodCity_GameCornerSign:
	ctxt "Goldenrod Game"
	next "Corner"
	nl   ""
	next "Your Playground!"
	done

GoldenrodCity_UndergroundSign:
	ctxt "Underground"
	next "Entrance"
	done

GoldenrodCityNPC1:
	ctxt "This magnet train"
	line "is amazing!"

	para "It goes up moun-"
	line "tains, under the"
	para "ocean, and every-"
	line "where between!"
	done

GoldenrodCityNPC2:
	ctxt "I was sad when the"
	line "department store"
	cont "was destroyed."

	para "However, they're"
	line "building a new"
	cont "one!"

	para "The basement"
	line "should be fine,"
	para "but nobody has"
	line "been down there in"
	cont "years."
	done

GoldenrodCityNPC3:
	ctxt "If your #mon is"
	line "happy enough, a"
	para "woman will teach"
	line "it a special move."

	para "Most #mon won't"
	line "be able to learn"
	para "that move from"
	line "leveling up, or"
	cont "even TMs!"
	done

GoldenrodCityNPC4:
	ctxt "There used to be"
	line "a Radio Tower."

	para "DJ Ben was the"
	line "coolest!"

	para "I heard he'll start"
	line "a new show when"
	para "they rebuild the"
	line "Radio Tower."

	para "I can't wait!"
	done

GoldenrodCityNPC5:
	ctxt "I remember when"
	line "Team Rocket tried"
	para "to take over the"
	line "town."

	para "A child named Gold"
	line "saved everybody."
	done

GoldenrodCityNPC6:
	ctxt "Not even an earth-"
	line "quake can stop us."

	para "No matter what"
	line "happens, we will"
	para "always stand tall"
	line "and stay gold."
	done

GoldenrodCityNPC7:
	ctxt "I heard that, far"
	line "away, a special"
	para "ring will open a"
	line "portal to another"
	cont "dimension."

	para "That would be so"
	line "interesting to"
	cont "visit!"
	done

GoldenrodCityGuard:
	ctxt "I'm sorry. I can't"
	line "allow you to pass"
	para "unless you're a"
	line "Johto citizen."

	para "We've had to crack"
	line "down on security,"
	para "because rumor has"
	line "it that a criminal"
	para "from a faraway"
	line "region is hiding"
	cont "out here."
	done

GoldenrodCity_MapEventHeader:: db 0, 0

.Warps
	db 14
	warp_def $7, $8, 1, GOLDENROD_GYM
	warp_def $17, $17, 1, GOLDENROD_MART
	warp_def $17, $f, 1, GOLDENROD_POKECENTER
	warp_def $5, $21, 1, GOLDENROD_BILL
	warp_def $d, $9, 1, GOLDENROD_MAGNET_TRAIN
	warp_def $d, $a, 2, GOLDENROD_MAGNET_TRAIN
	warp_def $10, $4, 3, GOLDENROD_CAPE_GATE
	warp_def $11, $4, 4, GOLDENROD_CAPE_GATE
	warp_def $17, $1f, 1, GOLDENROD_HAPPINESS_MOVE_TEACHER
	warp_def $23, $9, 9, SAXIFRAGE_POKECENTER
	warp_def $23, $18, 1, GOLDENROD_MAGNET_TRAIN
	warp_def $17, $7, 1, GOLDENROD_GAME_CORNER
	warp_def $5, $d, 1, GOLDENROD_UNDERGROUND_ENTRY_A
	warp_def $1d, $b, 1, GOLDENROD_UNDERGROUND_ENTRY_B

.CoordEvents
	db 0

.BGEvents
	db 9
	signpost 13, 11, SIGNPOST_JUMPSTD, magnettrainsign
	signpost 26, 26, SIGNPOST_JUMPSTD, qrcode, QR_GOLDENROD
	signpost 10, 33, SIGNPOST_ITEM, GoldenrodCity_GoldToken
	signpost 8, 10, SIGNPOST_LOAD, GoldenrodCity_GymSign
	signpost 18, 22, SIGNPOST_LOAD, GoldenrodCity_CitySign
	signpost 18, 6, SIGNPOST_LOAD, GoldenrodCity_CapeSign
	signpost 24, 6, SIGNPOST_LOAD, GoldenrodCity_GameCornerSign
	signpost 6, 14, SIGNPOST_LOAD, GoldenrodCity_UndergroundSign
	signpost 30, 12, SIGNPOST_LOAD, GoldenrodCity_UndergroundSign

.ObjectEvents
	db 8
	person_event SPRITE_POKEFAN_M, 10, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC1, -1
	person_event SPRITE_YOUNGSTER, 16, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC2, -1
	person_event SPRITE_COOLTRAINER_F, 18, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 26, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC4, -1
	person_event SPRITE_YOUNGSTER, 28, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC5, -1
	person_event SPRITE_LASS, 8, 18, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC6, -1
	person_event SPRITE_GRAMPS, 25, 19, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodCityNPC7, -1
	person_event SPRITE_OFFICER, 4, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, GoldenrodCityGuard, -1
