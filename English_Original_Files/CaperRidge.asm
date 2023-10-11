CaperRidge_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_CAPER_RIDGE
	return

CaperRidgeCitySign:
	ctxt "The town that's"
	next "always under a"
	next "white blanket"
	done

CaperRidgeLabSign:
	ctxt "Prof. Ilk's Lab"
	done

CaperRidgeNPC1:
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

CaperRidgeNPC2:
	ctxt "I don't recognize"
	line "you at all<...>"

	para "So, where did you"
	line "come from?"

	para "<...>"

	para "Mmhmm<...>"

	para "Huh. I've never"
	line "heard of it."
	done

CaperRidgeRoute70Block:
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
	ctxt "I'm shoveling snow"
	line "right now."

	para "When I'm done, it"
	line "should be safe to"
	cont "go past."
	sdone

CaperRidgeRoute71WestBlock:
	ctxt "Watch out!"

	para "This is really"
	line "thin ice!"

	para "I'm trying not to"
	line "move to stop it"
	cont "from cracking!"
	done

CaperRidge_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 9, 33, 1, CAPER_MART
	warp_def 7, 5, 1, ACQUA_EXITCHAMBER
	warp_def 9, 7, 1, CAPER_HOUSE
	warp_def 9, 17, 1, CAPER_POKECENTER
	warp_def 5, 26, 1, ILKS_LAB

.CoordEvents
	db 1
	xy_trigger 0, 8, 12, CaperRidgeRoute70Block

.BGEvents
	db 2
	signpost 5, 10, SIGNPOST_LOAD, CaperRidgeCitySign
	signpost 7, 22, SIGNPOST_LOAD, CaperRidgeLabSign

.ObjectEvents
	db 4
	person_event SPRITE_YOUNGSTER, 3, 11, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperRidgeNPC1, -1
	person_event SPRITE_BUG_CATCHER, 12, 9, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, CaperRidgeNPC2, -1
	person_event SPRITE_TEACHER, 8, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 8, PERSONTYPE_SCRIPT, 0, CaperRidgeRoute70Block, EVENT_CAPER_SHOVELING_SNOW
	person_event SPRITE_YOUNGSTER, 15, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, CaperRidgeRoute71WestBlock, EVENT_MET_ILK
