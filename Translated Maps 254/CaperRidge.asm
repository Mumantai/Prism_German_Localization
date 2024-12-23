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
	ctxt "Die Stadt unter"
	next "einer ewigen"
	next "Schneedecke"
	done

CaperRidgeLabSign:
	ctxt "Prof. Ilks Labor"
	done

CaperRidgeNPC1:
	ctxt "Prof. Ilk lebt"
	line "in dieser Stadt!"
	para "Er ist ein"
	line "#mon-Genie!"
	para "Er ist nicht nur"
	line "ein geschätzter"
	cont "#mon-Professor,"
	para "<...> sondern auch ein"
	line "guter Historiker!"
	done

CaperRidgeNPC2:
	ctxt "Dich hab ich hier"
	line "noch nie gesehen <...>"
	para "Von wo bist du"
	line "denn hergekommen?"
	para "<...>"
	para "Mmhmm <...>"
	para "Davon hab ich noch"
	line "nie gehört."
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
	ctxt "Ich schaufel den"
	line "Schnee zur Seite."
	para "Wenn ich fertig"
	line "bin, kannst du"
	cont "gerne durch."
	sdone

CaperRidgeRoute71WestBlock:
	ctxt "Pass auf!"
	para "Das ist sehr"
	line "dünnes Eis!"
	para "Ich versuche mich"
	line "nicht zu bewegen,"
	cont "damit das Eis"
	cont "nicht bricht"
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