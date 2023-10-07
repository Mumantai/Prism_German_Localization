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
	ctxt "A small quake hit"
	line "the island"
	cont "recently."

	para "The dock was"
	line "damaged, so we're"
	para "stranded here for"
	line "the time being."
	done

OlcanPokecenterNPC2:
	ctxt "I could reach"
	line "Southerly by"
	para "surfing, but the"
	line "high sea is"
	para "infested with sea"
	line "monsters!"

	para "At least this"
	line "Center is cozy."
	done

OlcanPokecenterNPC3:
	ctxt "Rankor residents"
	line "are such a nice"
	para "and hospitable"
	line "community."

	para "I hope for them"
	line "they get to keep"
	cont "their sovereignty."
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
