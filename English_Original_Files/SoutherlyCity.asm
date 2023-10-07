SoutherlyCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SOUTHERLY_CITY
	return

SoutherlyCityGymSign:
	ctxt "#mon Gym"
	next "Leader: Ernest"
	nl   ""
	next "The guy with good"
	next "firepower!"
	done

SoutherlyCityBattleBuildingSign:
	ctxt "Battle Building"
	nl   ""
	next "Put your abilit-"
	next "ies to the test!"
	done

SoutherlyCityCitySign:
	ctxt "Gateway to"
	next "Paradise!"
	done

SoutherlyCityAirportSign:
	ctxt "Transport Hub"
	nl   ""
	next "Airport &"
	next "Magnet Train"
	done

SoutherlyCityBridgeBlock:
	faceperson PLAYER, LEFT
	scall SoutherlyCityBridgeGuard
	applymovement PLAYER, .move_away
	end

.move_away
	step_down
	step_end

SoutherlyCityBridgeGuard:
	jumptextfaceplayer .text

.text
	ctxt "The bridge is"
	line "under construction"
	cont "right now."
	done

SoutherlyCityRunwayGuard:
	ctxt "This is the runway"
	line "for our airport."

	para "I can't let you"
	line "pass unless you"
	para "check in with the"
	line "people inside."
	done

SoutherlyCityTeleporter:
	ctxt "The new Magnet"
	next "Train extension"
	next "is now open!"
	nl   ""
	next "<DOWN> Transport Hub"
	done

SoutherlyCityNPC1:
	ctxt "The airport has a"
	line "new plane!"

	para "The interiors and"
	line "exteriors are all"
	cont "#mon themed!"
	done

SoutherlyCityNPC2:
	ctxt "Every time you"
	line "think you've"
	para "figured out the"
	line "stamina challenge,"
	para "they throw you a"
	line "curveball!"

	para "I've been training"
	line "to beat it for"
	cont "years!"
	done

SoutherlyCityNPC3:
	ctxt "It's quite tough"
	line "getting across to"
	cont "Naljo."

	para "I'm hoping that"
	line "they'll eventually"
	cont "build a bridge."
	done

SoutherlyCityTyphlosion:
	faceplayer
	opentext
	writetext .text
	cry TYPHLOSION
	endtext

.text
	ctxt "Typhlosion: Rwar!"
	done

SoutherlyCityTyphlosionTrainer:
	ctxt "My Typhlosion is"
	line "my best friend!"

	para "I remember when he"
	line "was a cute little"
	cont "Cyndaquil!"
	done

SoutherlyCity_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def $7, $6, 1, SOUTHERLY_HOUSE2
	warp_def $7, $b, 1, SOUTHERLY_HOUSE
	warp_def $7, $16, 1, SOUTHERLY_BATTLE_HOUSE
	warp_def $11, $5, 1, SOUTHERLY_MART
	warp_def $11, $b, 1, SOUTHERLY_GYM
	warp_def $1b, $9, 1, SOUTHERLY_AIRPORT
	warp_def $11, $14, 1, SOUTHERLY_POKECENTER

.CoordEvents
	db 1
	xy_trigger 0, $4, $10, SoutherlyCityBridgeBlock

.BGEvents
	db 5
	signpost 17, 13, SIGNPOST_LOAD, SoutherlyCityGymSign
	signpost  7, 25, SIGNPOST_LOAD, SoutherlyCityBattleBuildingSign
	signpost  7, 15, SIGNPOST_LOAD, SoutherlyCityCitySign
	signpost 27, 13, SIGNPOST_LOAD, SoutherlyCityAirportSign
	signpost 17, 18, SIGNPOST_LOAD, SoutherlyCityTeleporter

.ObjectEvents
	db 7
	person_event SPRITE_LASS, 25, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC1, -1
	person_event SPRITE_BLACK_BELT, 8, 24, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC2, -1
	person_event SPRITE_FISHER, 28, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 9, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyCityTyphlosionTrainer, -1
	person_event SPRITE_TYPHLOSION, 9, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SoutherlyCityTyphlosion, -1
	person_event SPRITE_OFFICER, 32,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SoutherlyCityRunwayGuard, -1
	person_event SPRITE_OFFICER, 4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SoutherlyCityBridgeGuard, -1
