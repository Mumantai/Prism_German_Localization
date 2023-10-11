CaperPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CaperPokecenterNPC1:
	ctxt "I wish I could"
	line "meet Prof. Ilk."

	para "He's always busy"
	line "with his work<...>"
	done

CaperPokecenterNPC2:
	ctxt "#mon Centers"
	line "are great!"

	para "They heal your"
	line "#mon in no"
	cont "time at all!"
	done

CaperPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 4, CAPER_RIDGE
	warp_def $7, $5, 4, CAPER_RIDGE
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_LASS, 7, 0, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, CaperPokecenterNPC1, -1
	person_event SPRITE_BOARDER, 4, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, CaperPokecenterNPC2, -1
