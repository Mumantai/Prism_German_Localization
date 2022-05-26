LaurelCity_MapScriptHeader;trigger count
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
	ctxt "Karpador-"
	next "Bucht"
	done

LaurelCityLabSign:
	ctxt "Wir sind"
	next "Wissenschaftler!"
	done

LaurelCityNameRaterSign:
	ctxt "Haus vom"
	next "Namensbewerter"
	done

LaurelCityCitySign:
	ctxt "Die königliche"
	next "Stadt"
	done

LaurelCityNPC1:
	ctxt "Es gibt hier ein"
	line "Labor, in dem"
	para "Fossile wieder zum"
	line "Leben erwachen."
	done

LaurelCityNPC2:
	ctxt "Die Arenaleiterin"
	line "Brooklyn hat viel"
	cont "zu hohe Ansprüche."

	para "Ich sorge mich um"
	line "diese Generation <...>"
	done

LaurelCityNPC3:
	ctxt "Vor Kurzem öffnete"
	line "hier ein Laden."
	done

LaurelCityNPC4:
	ctxt "So erbärmlich!"

	para "Die Arenaleiterin"
	line "denkt, sie wäre"
	cont "eine Königin <...>"

	para "Ich kann sie nicht"
	line "leiden!"
	done

LaurelCityMagikarpCavernsGuard:
	ctxt "Du brauchst den"
	line "lokalen Orden, um"
	cont "zu passieren."
	done

LaurelCityTotodileRunsFromGym:
	checkcode VAR_BOXSPACE
	sif false, then
		checkcode VAR_PARTYCOUNT
		sif =, 6
			end
	sendif
	checkflag ENGINE_GULFBADGE
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
	ctxt "-Heult-"
	sdone

.totodile_joins_party_text
	ctxt "Karnimani möchte"
	line "sich dir"
	cont "anschließen!"
	done

LaurelCityTeleportation:
	opentext
	farwritetext FarText_BillsTeleportationSystem
	checkevent EVENT_REGISTERED_SOUTHERLY
	sif false
		jumptext .nothing_registered_text
	writetext .go_to_southerly_text
	yesorno
	closetext
	sif true
		warp SOUTHERLY_POKECENTER, 5, 5
	end

.nothing_registered_text
	ctxt "KEINE STÄDTE"
	line "REGISTRIERT!"
	done

.go_to_southerly_text
	ctxt "NACH SUNTIA CITY"
	line "TELEPORTIEREN?"
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
	db 8
	signpost 13, 35, SIGNPOST_LOAD, LaurelCityMagikarpCavernsSign
	signpost 6, 20, SIGNPOST_LOAD, LaurelCityLabSign
	signpost 27, 5, SIGNPOST_LOAD, LaurelCityNameRaterSign
	signpost 19, 25, SIGNPOST_LOAD, LaurelCityCitySign
	signpost 21, 12, SIGNPOST_ITEM, LaurelCity_GoldToken
	signpost 27, 24, SIGNPOST_JUMPSTD, pokecentersign
	signpost 21, 19, SIGNPOST_JUMPSTD, martsign
	signpost 27, 21, SIGNPOST_READ, LaurelCityTeleportation

.ObjectEvents
	db 7
	person_event SPRITE_FIREBREATHER, 12, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, LaurelCityNPC1, -1
	person_event SPRITE_GRAMPS, 28, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, LaurelCityNPC2, -1
	person_event SPRITE_GRAMPS, 12, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, LaurelCityMagikarpCavernsGuard, EVENT_MAN_BLOCKING_MAGIKARP_CAVERNS
	person_event SPRITE_TOTODILE, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAUREL_CITY_HIDDEN_TOTODILE
	person_event SPRITE_LASS, 23, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelCityNPC3, -1
	person_event SPRITE_LASS, 18, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, LaurelCityNPC4, -1
	person_event SPRITE_POKE_BALL, 21, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ICY_WIND, 0, EVENT_LAUREL_CITY_TM
