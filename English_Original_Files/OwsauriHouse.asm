OwsauriHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OwsauriHouseNPC1:
	ctxt "Who says that"
	line "nobody reads"
	cont "anymore?"

	para "Not me!"
	done

OwsauriHouseNPC2:
	ctxt "The day care man"
	line "moved out a"
	cont "while back."

	para "The guy that"
	line "moved in can"
	para "tell you a fact"
	line "about your"
	cont "#mon instead."
	done

OwsauriHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $2, 6, OWSAURI_CITY
	warp_def $7, $3, 6, OWSAURI_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_SAGE, 2, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriHouseNPC1, -1
	person_event SPRITE_TEACHER, 4, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriHouseNPC2, -1
