FarawayIslandInside_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FarawayIslandMew:
	faceplayer
	opentext
	writetext .cry_text
	cry MEW
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_MEW
	loadwildmon MEW, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_MEW
	disappear 2
	end

.cry_text
	text "Myuu <...>"
	done

FarawayIslandInside_MapEventHeader:: db 0, 0

	;warps
	db 1
	warp_def 25, 8, 2, FARAWAY_ISLAND_OUTSIDE

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_MEW, 10, 13, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, FarawayIslandMew, EVENT_MEW
