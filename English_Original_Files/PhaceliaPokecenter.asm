PhaceliaPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaPokecenterNPC1:
	ctxt "This #mon"
	line "Center was just"
	cont "built."

	para "It has that new"
	line "building smell."
	done

PhaceliaPokecenterNPC2:
	ctxt "The caverns used"
	line "to be a lot"
	para "bigger, until they"
	line "allocated some"
	para "space for the new"
	line "city."

	para "Some think that's"
	line "what's causing"
	para "all the recent"
	line "earthquakes."

	para "I think there's a"
	line "different reason;"
	para "we're nowhere near"
	line "a plate boundary."
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
