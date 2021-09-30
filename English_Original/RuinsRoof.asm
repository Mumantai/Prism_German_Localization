RuinsRoof_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RuinsRoofRaiwato:
	opentext
	writetext .text
	cry RAIWATO
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_RAIWATO
	loadwildmon RAIWATO, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_RAIWATO
	disappear 2
	end

.text
	ctxt "Zut zutt!"
	done

RuinsRoof_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $8, $6, 2, RUINS_F5

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_RAIWATO, 4, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RuinsRoofRaiwato, EVENT_RAIWATO
