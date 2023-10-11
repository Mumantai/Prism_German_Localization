SaffronGates_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronGatesGuard:
	ctxt "Sorry, nobody is"
	line "allowed past this"
	cont "point for now."

	para "Feel free to enjoy"
	line "everything Saffron"
	cont "City has to offer!"
	done

SaffronGates_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 8
	warp_def $5, $3, 10, SAFFRON_CITY
	warp_def $5, $4, 10, SAFFRON_CITY
	warp_def $a, $3, 13, SAFFRON_CITY
	warp_def $a, $4, 14, SAFFRON_CITY
	warp_def $3, $c, 15, SAFFRON_CITY
	warp_def $4, $c, 16, SAFFRON_CITY
	warp_def $d, $11, 11, SAFFRON_CITY
	warp_def $e, $11, 12, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 8
	person_event SPRITE_OFFICER, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 12, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 12, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 3, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 4, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 13, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
	person_event SPRITE_OFFICER, 14, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronGatesGuard, -1
