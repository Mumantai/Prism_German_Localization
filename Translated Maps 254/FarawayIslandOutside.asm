FarawayIslandOutside_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FarawayIslandOutsideSign:
	ctxt "Die Schrift"
	line "verblasst, als ob"
	para "sie vor langer"
	line "Zeit geschrieben"
	cont "worden wäre<...>"
	para "<...>"
	para "<...>ber, 6. Tag."
	para "Wenn ein Mensch"
	line "<...> hierher<...>"
	para "tritt<...> es eine"
	para "gutherzige"
	line "Pers<...>"
	cont "<...>mit dieser"
	para "Hoffnung, verlasse"
	line "ich<...>"
	cont "<...> <...>"
	para "<...>ji"
	done

FarawayIslandOutside_MapEventHeader:
	;filler
	db 0,0

	;warps
	db 2
	warp_def 35, 10, 7, ROUTE_86_UNDERGROUND_PATH
	warp_def 9, 22, 1, FARAWAY_ISLAND_INSIDE

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 35,  5, SIGNPOST_TEXT, FarawayIslandOutsideSign

	;people-events
	db 0
