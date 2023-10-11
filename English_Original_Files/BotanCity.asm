BotanCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_BOTAN_CITY
	return

BotanCity_GoldToken:
	dw EVENT_BOTAN_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

BotanCityCitySign:
	ctxt "The city of"
	next "nostalgia"
	done

BotanCityMagnetTrainSign:
	signpostheader 8
	done

BotanCityNPC1:
	ctxt "The ghosts up to"
	line "the north keep"
	para "playing nasty"
	line "pranks on people."

	para "I wish they'd mind"
	line "their manners!"
	done

BotanCityNPC2:
	ctxt "You better not be"
	line "from Naljo."
	done

BotanCityNPC3:
	ctxt "#mon Centers"
	line "aren't allowed to"
	cont "exist here<...>"

	para "It's a strong"
	line "belief that<...>"

	para "<...><``>they<''><...>"

	para "don't like #mon"
	line "to be healed that"
	cont "way."
	done

BotanCityNPC4:
	ctxt "We're the only"
	line "town that still"
	cont "bothers to farm."
	done

BotanCityNPC5:
	ctxt "I was a construc-"
	line "tion worker for"
	cont "<``>that<''> building."

	para "I now regret it."
	done

BotanCityNPC6:
	ctxt "Quarantined, yet"
	line "again."

	para "Sigh<...>"
	done

BotanCityNPC7:
	ctxt "Please don't tell"
	line "anybody about this"
	cont "place."
	done

BotanCityNPC8:
	ctxt "This city has to"
	line "be Rijon's"
	cont "strangest city."

	para "No other cities"
	line "have to deal with"
	para "the surprises we"
	line "always get."
	done

BotanCity_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def  5, 17, 1, BOTAN_HOUSE
	warp_def  9,  8, 4, ROUTE_59_GATE
	warp_def 17, 21, 1, BOTAN_MART
	warp_def 13, 38, 1, BOTAN_PACHISI
	warp_def 19, 39, 1, BOTAN_POKECENTER
	warp_def  3, 24, 3, HAUNTED_FOREST_GATE
	warp_def 23,  8, 1, BOTAN_MAGNET_TRAIN
	warp_def 23,  9, 2, BOTAN_MAGNET_TRAIN

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 11, 27, SIGNPOST_LOAD, BotanCityCitySign
	signpost 23,  7, SIGNPOST_JUMPSTD, magnettrainsign
	signpost  8, 20, SIGNPOST_ITEM, BotanCity_GoldToken
	signpost 11, 19, SIGNPOST_JUMPSTD, qrcode, QR_BOTAN
	signpost 21, 23, SIGNPOST_LOAD, BotanCityMagnetTrainSign

.ObjectEvents
	db 8
	person_event SPRITE_POKEFAN_F, 18, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanCityNPC1, -1
	person_event SPRITE_FISHING_GURU, 29, 13, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, BotanCityNPC2, -1
	person_event SPRITE_ROCKER, 12, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, BotanCityNPC3, -1
	person_event SPRITE_POKEFAN_F, 11, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, BotanCityNPC4, -1
	person_event SPRITE_FISHER, 12, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, BotanCityNPC5, -1
	person_event SPRITE_YOUNGSTER, 26,  5, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, BotanCityNPC6, -1
	person_event SPRITE_YOUNGSTER, 21, 37, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, BotanCityNPC7, -1
	person_event SPRITE_SAGE,  8, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, BotanCityNPC8, -1
