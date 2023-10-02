PhaceliaPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaPokecenterNPC1:
	ctxt "Dieses #mon"
	line "Center wurde grad"
	cont "erst gebaut."
	para "Es riecht hier"
	line "auch nach einem"
	cont "neuen Gebäude."
	done

PhaceliaPokecenterNPC2:
	ctxt "Die Höhlen waren"
	line "eigentlich etwas"
	para "größer, bis sie"
	line "etwas davon"
	para "abbauten für das"
	line "Dorf hier."
	para "Manche sagen, das"
	line "wäre der Grund für"
	para "die ganzen Erd-"
	line "beben hier."
	para "Ich denke es ist"
	line "ETWAS anderes<...>"
	done

PhaceliaPokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 4, PHACELIA_CITY
	warp_def $7, $5, 4, PHACELIA_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_LASS, 4, 7, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaPokecenterNPC1, -1
	person_event SPRITE_SUPER_NERD, 6, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaPokecenterNPC2, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1