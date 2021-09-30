SoutherlyCity_MapScriptHeader;trigger count
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
	ctxt "Airport"
	done

SoutherlyCityEspoForestBlock:
	faceperson PLAYER, UP
	scall SoutherlyCityEspoForestGuard
	applymovement PLAYER, .move_away
	end

.move_away
	step_right
	step_end

SoutherlyCityEspoForestGuard:
	jumptextfaceplayer .text

.text
	ctxt "Some weird things"
	line "have been"
	para "happening in"
	line "Espo Forest."

	para "I've been told to"
	line "guard the area"
	cont "for now."
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
	opentext
	farwritetext FarText_BillsTeleportationSystem
	checkevent EVENT_REGISTERED_SOUTHERLY
	sif false, then
		writetext .registered_city_text
		setevent EVENT_REGISTERED_SOUTHERLY
	sendif
	writetext .want_to_teleport_text
	yesorno
	closetext
	sif true
		warp LAUREL_POKECENTER, 5, 5
	end

.registered_city_text
	ctxt "Southerly City"
	line "was registered!"
	sdone

.want_to_teleport_text
	ctxt "Would you like to"
	line "teleport to"
	cont "Laurel City?"
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
	line "getting across"
	cont "to Naljo."

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

	para "I remember when"
	line "he was a cute"
	cont "little Cyndaquil!"
	done

SoutherlyCity_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def $7, $6, 1, SOUTHERLY_HOUSE2
	warp_def $7, $b, 1, SOUTHERLY_HOUSE
	warp_def $7, $16, 1, SOUTHERLY_BATTLE_HOUSE
	warp_def $11, $6, 1, SOUTHERLY_MART
	warp_def $11, $a, 1, SOUTHERLY_GYM
	warp_def $1b, $8, 1, SOUTHERLY_AIRPORT
	warp_def $f, $14, 1, SOUTHERLY_POKECENTER

.CoordEvents
	db 2
	xy_trigger 0, $13, $4, SoutherlyCityEspoForestBlock
	xy_trigger 0, $4, $10, SoutherlyCityBridgeBlock

.BGEvents
	db 6
	signpost 17, 14, SIGNPOST_LOAD, SoutherlyCityGymSign
	signpost 7, 18, SIGNPOST_LOAD, SoutherlyCityBattleBuildingSign
	signpost 7, 14, SIGNPOST_LOAD, SoutherlyCityCitySign
	signpost 16, 22, SIGNPOST_JUMPSTD, pokecentersign
	signpost 26, 12, SIGNPOST_LOAD, SoutherlyCityAirportSign
	signpost 16, 18, SIGNPOST_READ, SoutherlyCityTeleporter

.ObjectEvents
	db 8
	person_event SPRITE_LASS, 26, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC1, -1
	person_event SPRITE_BLACK_BELT, 8, 24, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC2, -1
	person_event SPRITE_FISHER, 28, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 9, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyCityTyphlosionTrainer, -1
	person_event SPRITE_TYPHLOSION, 9, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SoutherlyCityTyphlosion, -1
	person_event SPRITE_OFFICER, 33, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SoutherlyCityRunwayGuard, -1
	person_event SPRITE_OFFICER, 18, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SoutherlyCityEspoForestGuard, -1
	person_event SPRITE_OFFICER, 4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SoutherlyCityBridgeGuard, -1
