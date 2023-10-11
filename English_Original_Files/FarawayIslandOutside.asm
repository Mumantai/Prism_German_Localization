FarawayIslandOutside_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FarawayIslandOutsideSign:
	ctxt "The writing is"
	line "fading, as if it"
	para "had been written a"
	line "long time ago<...>"

	para "<...>"

	para "<...>ber, 6th day."
	line "If any human<...>"
	para "sets foot here<...>"
	line "again<...> et it"
	para "be a kindhearted"
	line "pers<...>"

	para "<...>with that"
	line "hope, I depar<...>"

	para "<...> <...>"
	line "<...>ji"
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
