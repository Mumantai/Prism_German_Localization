AcquaMedTide_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcquaMinesLibabeel:
	faceplayer
	opentext
	writetext .text
	cry LIBABEEL
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_LIBABEEL
	loadwildmon LIBABEEL, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_LIBABEEL
	disappear 2
	end

.text
	ctxt "Grrr!"
	done

AcquaMedTide_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def 3, 15, 1, ACQUA_PHLOXENTRANCE
	warp_def 17, 23, 4, ACQUA_ROOM
	warp_def 3, 29, 2, ACQUA_ROOM
	warp_def 3, 19, 1, ACQUA_LABBASEMENTPATH

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_LIBABEEL, 11, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcquaMinesLibabeel, EVENT_LIBABEEL
