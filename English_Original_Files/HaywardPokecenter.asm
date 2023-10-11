HaywardPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardPokecenterNPC1:
	ctxt "Hayward is right"
	line "on the Rijon fault"
	cont "line."

	para "We can only hope"
	line "that the next big"
	para "one doesn't destroy"
	line "the earthquake"
	cont "lab."
	done

HaywardPokecenterNPC2:
	ctxt "Route 51 goes all"
	line "the way to Old"
	para "Route 47, which is"
	line "in Johto."
	done

HaywardPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 6, HAYWARD_CITY
	warp_def $7, $5, 6, HAYWARD_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_SUPER_NERD, 7, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardPokecenterNPC1, -1
	person_event SPRITE_LASS, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardPokecenterNPC2, -1
