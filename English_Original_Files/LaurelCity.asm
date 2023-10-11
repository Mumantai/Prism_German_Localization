LaurelCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_LAUREL_CITY
	return

LaurelCity_GoldToken:
	dw EVENT_LAUREL_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

LaurelCityMagikarpCavernsSign:
	ctxt "Magikarp"
	next "Caverns"
	done

LaurelCityLabSign:
	ctxt "We are"
	next "scientists!"
	done

LaurelCityNameRaterSign:
	ctxt "Name Rater's"
	next "home"
	done

LaurelCityCitySign:
	ctxt "The city of"
	next "royalty"
	done

LaurelCityNPC1:
	ctxt "There's a lab"
	line "nearby that can"
	cont "revive fossils."
	done

LaurelCityNPC2:
	ctxt "Brooklyn, the"
	line "local Gym Leader,"
	cont "is too entitled."

	para "I fear for this"
	line "generation<...>"
	done

LaurelCityNPC3:
	ctxt "A new shop opened"
	line "here recently."
	done

LaurelCityNPC4:
	ctxt "It's so silly!"

	para "The Gym Leader"
	line "thinks she's some"
	cont "sort of queen<...>"

	para "I can't stand it!"
	done

LaurelCityMagikarpCavernsGuard:
	ctxt "The city's badge is"
	line "needed to enter"
	cont "this cave."
	done

LaurelCityTotodileRunsFromGym:
	checkcode VAR_BOXSPACE
	sif false, then
		checkcode VAR_PARTYCOUNT
		sif =, 6
			end
	sendif
	checkflag ENGINE_CHARMBADGE
	sif false
		end
	checkevent EVENT_LAUREL_CITY_GOT_TOTODILE
	sif true
		end
	cry TOTODILE
	appear 5
	applymovement 5, .totodile_moves_to_player
	spriteface PLAYER, UP
	spriteface 5, DOWN
	opentext
	writetext .totodile_whines_text
	writetext .totodile_joins_party_text
	playwaitsfx SFX_FANFARE_2
	waitbutton
	givepoke TOTODILE, 15, ORAN_BERRY, 0
	disappear 5
	setevent EVENT_LAUREL_CITY_GOT_TOTODILE
	closetextend

.totodile_moves_to_player
	step_down
	step_down
	step_right
	step_end

.totodile_whines_text
	ctxt "-whines-"
	sdone

.totodile_joins_party_text
	ctxt "Totodile has"
	line "decided to join"
	cont "your party!"
	done

LaurelCityMagnetTrainPoster:
	ctxt "It's an old,"
	line "peeling poster."

	para "<...>"

	para "Naljo opens to the"
	line "world at last!"

	para "Discover the new"
	line "Magnet Train!"

	para "Travel to other"
	line "regions in a"
	cont "flash!"

	para "Opening soon in"
	line "Torenia City."

	para "Naljo's new"
	line "gateway!"
	done

LaurelCity_MapEventHeader:: db 0, 0

.Warps
	db 12
	warp_def $11, $2, 4, LAUREL_GATE
	warp_def $b, $f, 1, LAUREL_STICK
	warp_def $b, $22, 15, MAGIKARP_CAVERNS_MAIN
	warp_def $1, $15, 1, ORPHANAGE
	warp_def $5, $16, 1, LAUREL_LAB
	warp_def $1b, $17, 1, LAUREL_POKECENTER
	warp_def $1, $16, 1, SPURGE_HOUSE
	warp_def $3, $2, 1, LAUREL_GYM
	warp_def $15, $12, 2, LAUREL_MART
	warp_def $21, $16, 1, ACANIA_HOUSE
	warp_def $17, $5, 1, LAUREL_NAMERATER
	warp_def $10, $2, 3, LAUREL_GATE

.CoordEvents
	db 1
	xy_trigger 0, $6, $3, LaurelCityTotodileRunsFromGym

.BGEvents
	db 6
	signpost 13, 35, SIGNPOST_LOAD, LaurelCityMagikarpCavernsSign
	signpost 6, 20, SIGNPOST_LOAD, LaurelCityLabSign
	signpost 27, 5, SIGNPOST_LOAD, LaurelCityNameRaterSign
	signpost 19, 25, SIGNPOST_LOAD, LaurelCityCitySign
	signpost 21, 12, SIGNPOST_ITEM, LaurelCity_GoldToken
	signpost 27, 21, SIGNPOST_TEXT, LaurelCityMagnetTrainPoster

.ObjectEvents
	db 7
	person_event SPRITE_FIREBREATHER, 12, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, LaurelCityNPC1, -1
	person_event SPRITE_GRAMPS, 28, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, LaurelCityNPC2, -1
	person_event SPRITE_GRAMPS, 12, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, LaurelCityMagikarpCavernsGuard, EVENT_MAN_BLOCKING_MAGIKARP_CAVERNS
	person_event SPRITE_TOTODILE, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAUREL_CITY_HIDDEN_TOTODILE
	person_event SPRITE_LASS, 23, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelCityNPC3, -1
	person_event SPRITE_LASS, 18, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, LaurelCityNPC4, -1
	person_event SPRITE_POKE_BALL, 21, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ICY_WIND, 0, EVENT_LAUREL_CITY_TM
