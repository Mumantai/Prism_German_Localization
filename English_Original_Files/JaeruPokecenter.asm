JaeruPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

JaeruPokecenterNPC1:
	ctxt "Sparky used to fix"
	line "cars in a faraway"
	para "city called"
	line "Oceanview."

	para "Now he's managing"
	line "his own company"
	para "right here in"
	line "Jaeru!"
	done

JaeruPokecenterNPC2:
	ctxt "This city is the"
	line "pathway to the"
	cont "Rijon League!"
	done

JaeruPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 4, JAERU_CITY
	warp_def $7, $5, 4, JAERU_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_R_FISHER, 7, 0, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, JaeruPokecenterNPC1, -1
	person_event SPRITE_R_NERD, 4, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, JaeruPokecenterNPC2, -1
