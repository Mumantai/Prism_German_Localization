PrisonElectricChair_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, SetPrisonElectricBlocks

SetPrisonElectricBlocks:
	scall PrisonElectricDoor
	return

PrisonElectricDoor:
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_1
	sif false
		end
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_2
	sif false
		end
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_3
	sif false
		end
	changeblock 8, 0, $5b
	end

PrisonElectricDoorSign:
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_1
	iffalse .print_text
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_2
	iffalse .print_text
	checkevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_3
	sif false
.print_text
		jumptext .text
	end

.text
	ctxt "Electricity is"
	line "being fed into"
	cont "the door."

	para "Perhaps that's"
	line "what's keeping"
	cont "it locked?"
	done

PrisonElectricChairFlaaffy:
	faceplayer
	cry FLAAFFY
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon FLAAFFY, 30
	startbattle
	reloadmapafterbattle
	disappear 2
	setevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_3
	jump PrisonElectricDoor

PrisonElectricChairRaichu:
	faceplayer
	cry RAICHU
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon RAICHU, 30
	startbattle
	reloadmapafterbattle
	disappear 3
	setevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_2
	jump PrisonElectricDoor

PrisonElectricChairElectabuzz:
	faceplayer
	cry ELECTABUZZ
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon ELECTABUZZ, 30
	startbattle
	reloadmapafterbattle
	disappear 4
	setevent EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_1
	jump PrisonElectricDoor

PrisonElectricChair_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def 14, 19, 3, PRISON_F2
	warp_def 15, 19, 4, PRISON_F2
	warp_def 1, 9, 1, PRISON_CONTAINMENT

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 1, 9, SIGNPOST_READ, PrisonElectricDoorSign

.ObjectEvents
	db 3
	person_event SPRITE_FLAAFFY, 9, 16, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonElectricChairFlaaffy, EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_3
	person_event SPRITE_RAICHU, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonElectricChairRaichu, EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_2
	person_event SPRITE_ELECTABUZZ, 9, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, PrisonElectricChairElectabuzz, EVENT_PRISON_ELECTRIC_CHAIR_POKEMON_1
