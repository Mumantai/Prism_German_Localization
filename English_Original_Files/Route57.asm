Route57_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route57HiddenItem:
	dw EVENT_ROUTE_57_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route57GymSign:
	signpostheader 4
	ctxt "#mon Gym"
	next "Leader: Joe"
	nl   ""
	next "The most normal"
	next "Trainer you'll"
	next "ever meet!"
	done

Route57_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $17, $6, 4, ROUTE_56_GATE
	warp_def $19, $10, 1, ROUTE_57_GYM
	warp_def $3, $10, 10, EAGULOU_PARK_2
	warp_def $1, $6, 2, CASTRO_FOREST_GATE_SOUTH

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 27, 13, SIGNPOST_LOAD, Route57GymSign
	signpost 12, 10, SIGNPOST_ITEM, Route57HiddenItem

	;people-events
	db 0
