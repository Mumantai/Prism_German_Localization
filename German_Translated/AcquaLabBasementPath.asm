AcquaLabBasementPath_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .AcquaLabBasementPathWarpMod

.AcquaLabBasementPathWarpMod
	writebyte 4

AcquaWarpMod:
	pushvar
	checkcode VAR_HOUR
	divideby 6
	loadarray .TimeToTideArray
	popvar
	cmdwitharrayargs
	db warpmod_command, %10, -1, 0
	endcmdwitharrayargs
	return
	
.TimeToTideArray
	map ACQUA_LOWTIDE
.TimeToTideArrayEntrySizeEnd
	map ACQUA_MEDTIDE
	map ACQUA_HITIDE
	map ACQUA_MEDTIDE

AcquaLabBasementPathRhydon:
	faceplayer
	setevent EVENT_ACQUA_POKEMON_GUARD
	cry RHYDON
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon RHYDON, 50
	startbattle
	reloadmapafterbattle
	dontrestartmapmusic
	disappear 2
	end

AcquaLabBasementPath_MapEventHeader:: db 0, 0

.Warps
	db 8
	dummy_warp $3, $5
	warp_def $5, $3, 3, ACQUA_LABBASEMENTPATH
	warp_def $5, $d, 2, ACQUA_LABBASEMENTPATH
	warp_def $3, $f, 5, ACQUA_LABBASEMENTPATH
	warp_def $3, $19, 4, ACQUA_LABBASEMENTPATH
	warp_def $5, $17, 7, ACQUA_LABBASEMENTPATH
	warp_def $d, $17, 6, ACQUA_LABBASEMENTPATH
	warp_def $b, $5, 6, PHLOX_LAB_B1F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_RHYDON, 12, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, AcquaLabBasementPathRhydon, EVENT_ACQUA_POKEMON_GUARD
	person_event SPRITE_BOULDER, 14, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
