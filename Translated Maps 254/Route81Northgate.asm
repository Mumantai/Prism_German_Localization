Route81Northgate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route81NorthgateGuard:
	ctxt "Die Stadt im"
	line "Norden wird noch"
	cont "gebaut."

	para "Die haben diesen"
	line "großen Fleck Meer"
	para "gesehen und haben"
	line "sich gedacht <''>Hey!"
	para "Warum bauen wir da"
	line "nicht einfach eine"
	cont "Stadt hin?<''>"

	para "Die Vorstellung,"
	line "finde ich schon"
	cont "zum Lachen."
	done

Route81Northgate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $0, $4, 3, ACANIA_DOCKS
	warp_def $0, $5, 4, ACANIA_DOCKS
	warp_def $7, $4, 1, ROUTE_81
	warp_def $7, $5, 1, ROUTE_81

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route81NorthgateGuard, -1