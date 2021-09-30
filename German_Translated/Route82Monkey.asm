Route82Monkey_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route82MonkeyFambaco:
	faceplayer
	opentext
	writetext .text
	cry FAMBACO
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_FAMBACO
	loadwildmon FAMBACO, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_FAMBACO
	disappear 2
	end

.text
	text "<...>"
	done

Route82Monkey_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $9, $7, 3, ROUTE_82

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_FAMBACO, 5, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route82MonkeyFambaco, EVENT_FAMBACO
