CaperCity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_CAPER_CITY
	return

CaperCityCitySign:
	ctxt "The town that's"
	next "always under a"
	next "white blanket"
	done

CaperCityLabSign:
	ctxt "Prof. Ilk's Lab"
	done

CaperCityNPC1:
	ctxt "Prof. Ilk lives"
	line "in this town!"

	para "That man is a"
	line "#mon genius!"

	para "Not only is he a"
	line "revered #mon"
	cont "professor<...>"

	para "<...>he's also a"
	line "famed historian."
	done

CaperCityNPC2:
	ctxt "I don't recognize"
	line "you at all<...>"

	para "So, where did"
	line "you come from?"

	para "<...>"

	para "Mmhmm<...>"

	para "Huh. I've never"
	line "heard of it."
	done

CaperCityRoute70Block:
	checkevent EVENT_CAPER_SHOVELING_SNOW
	sif true
		end
	checkcode VAR_XCOORD
	sif =, 12, then
		spriteface PLAYER, RIGHT
		spriteface 4, LEFT
	selse
		faceplayer
	sendif
	showtext .text
	checkcode VAR_XCOORD
	sif =, 12
		applymovement PLAYER, .walk_down
	end

.walk_down
	step_down
	step_end

.text
	ctxt "I'm shoveling"
	line "snow right now."
	
	para "When I'm done, it"
	line "should be safe to"
	cont "go past."
	sdone

CaperCityRoute71Block:
	ctxt "Watch out!"

	para "This is really"
	line "thin ice!"

	para "I'm trying not to"
	line "move to stop it"
	cont "from cracking!"
	done

CaperCity_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 9, 33, 1, CAPER_MART
	warp_def 7, 5, 1, ACQUA_EXITCHAMBER
	warp_def 9, 7, 1, CAPER_HOUSE
	warp_def 9, 17, 1, CAPER_POKECENTER
	warp_def 5, 26, 1, ILKS_LAB

.CoordEvents
	db 1
	xy_trigger 0, 8, 12, CaperCityRoute70Block

.BGEvents
	db 4
	signpost 5, 10, SIGNPOST_LOAD, CaperCityCitySign
	signpost 7, 22, SIGNPOST_LOAD, CaperCityLabSign
	signpost 9, 18, SIGNPOST_JUMPSTD, pokecentersign
	signpost 9, 34, SIGNPOST_JUMPSTD, martsign

.ObjectEvents
	db 4
	person_event SPRITE_YOUNGSTER, 3, 11, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperCityNPC1, -1
	person_event SPRITE_BUG_CATCHER, 12, 9, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, CaperCityNPC2, -1
	person_event SPRITE_TEACHER, 8, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 8, PERSONTYPE_SCRIPT, 0, CaperCityRoute70Block, EVENT_CAPER_SHOVELING_SNOW
	person_event SPRITE_YOUNGSTER, 15, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, CaperCityRoute71Block, EVENT_MET_ILK
