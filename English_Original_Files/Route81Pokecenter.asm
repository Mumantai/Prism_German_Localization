Route81Pokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route81PokecenterNPC1:
	ctxt "Just got GPS"
	line "support for my"
	cont "phone."

	para "We're at"
	line "32.206359,"
	cont "134.341771."

	para "Cool, huh?"
	done

Route81PokecenterNPC2:
	ctxt "No, I'm not a"
	line "Rocket anymore."

	para "I wear this purely"
	line "for nostalgia"
	cont "purposes."

	para "It's when I was in"
	line "the prime of my"
	cont "life<...>"
	done

Route81Pokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 6, ROUTE_81
	warp_def $7, $5, 6, ROUTE_81
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_ROCKER, 6, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route81PokecenterNPC1, -1
	person_event SPRITE_ROCKET, 4, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route81PokecenterNPC2, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
