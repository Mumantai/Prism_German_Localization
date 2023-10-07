OxalisMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OxalisMartNPC1:
	ctxt "Escape Ropes come"
	line "in handy inside"
	cont "caves!"
	done

OxalisMartNPC2:
	ctxt "Why do they sell"
	line "brick pieces?"

	para "I'd like a whole"
	line "brick, not pieces."
	done

OxalisMart_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $7, 11, OXALIS_CITY
	warp_def $7, $6, 11, OXALIS_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, OXALIS_STANDARD_MART, -1
	person_event SPRITE_BLACK_BELT, 2, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, OxalisMartNPC1, -1
	person_event SPRITE_YOUNGSTER, 7, 0, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, OxalisMartNPC2, -1
