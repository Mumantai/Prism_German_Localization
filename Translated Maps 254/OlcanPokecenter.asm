OlcanPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_OLCAN_ISLE
	return

OlcanPokecenterNPC1:
	ctxt "Ein kleines Beben"
	line "hat die Insel"
	cont "getroffen."
	para "Der Hafen wurde"
	line "zerstört, also"
	para "sind wir hier fürs"
	line "erste gefangen."
	done

OlcanPokecenterNPC2:
	ctxt "Ich könnte bis"
	line "Südport City"
	para "surfen, aber die"
	line "hohe See ist"
	para "voll von See-"
	line "Monstern!"
	para "Hier ist es"
	line "zumindest"
	cont "gemütlich!"
	done

OlcanPokecenterNPC3:
	ctxt "Die Bewohner von"
	line "Rankor sind so"
	para "freundlich und"
	line "gastfreundlich."
	para "Ich hoffe für sie,"
	line "dass sie ihre"
	para "Souveränität"
	line "behalten können."
	done

OlcanPokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 2, OLCAN_ISLE
	warp_def $7, $5, 2, OLCAN_ISLE
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_LASS, 4, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OlcanPokecenterNPC1, -1
	person_event SPRITE_BEAUTY, 4, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OlcanPokecenterNPC2, -1
	person_event SPRITE_GENTLEMAN, 6, 2, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OlcanPokecenterNPC3, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1