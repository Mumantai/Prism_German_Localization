Route67_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SENECA_CAVERNS
	return

Route67HiddenItem:
	dw EVENT_ROUTE_67_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route67RouteSign:
	ctxt "Seneca Cavefront"
	next "Pathway to the"
	next "Rijon League!"
	done

Route67MagnetTrainSign:
	signpostheader 8
	done

Route67_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $b, $6, 3, ROUTE_67_GATE
	warp_def $7, $23, 5, SENECACAVERNSF1
	warp_def $7, $27, 1, SENECACAVERNSF1
	warp_def $7, $2b, 1, ROUTE_67_POKECENTER
	warp_def $d, $25, 1, ROUTE_67_HOUSE
	warp_def $8, $2f, 1, EMBER_BROOK_GATE
	warp_def $9, $2f, 2, EMBER_BROOK_GATE

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 16, 21, SIGNPOST_ITEM, Route67HiddenItem
	signpost 12, 20, SIGNPOST_LOAD, Route67RouteSign
	signpost 10, 28, SIGNPOST_LOAD, Route67MagnetTrainSign
	signpost 11, 32, SIGNPOST_LOAD, Route67MagnetTrainSign

	;people-events
	db 0
