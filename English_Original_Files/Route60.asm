Route60_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route60HiddenItem:
	dw EVENT_ROUTE_60_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route60DirectionsSign:
	ctxt "Powerline Road"
	next "<UP> Power Plant"
	next "<UP><RIGHT>Moraga Town"
	next "<DOWN> Route 61"
	done

Route60_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $b, $a, 1, POWER_PLANT_LOBBY
	warp_def $3, $b, 2, ROUTE_60_GATE
	warp_def $d, $a, 3, ROUTE_61_GATE_SOUTH
	warp_def $d, $b, 3, ROUTE_61_GATE_SOUTH

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 13, 9, SIGNPOST_LOAD, Route60DirectionsSign
	signpost 2, 11, SIGNPOST_ITEM, Route60HiddenItem

	;people-events
	db 0
