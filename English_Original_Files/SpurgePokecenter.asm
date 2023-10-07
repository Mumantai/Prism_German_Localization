SpurgePokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgePokecenterNPC1:
	ctxt "Oh, it's you again!"

	para "It's me, the talk"
	line "of the town!"

	para "You know, the guy"
	line "who blew up the"
	cont "rocks in the cave!"

	para "I think that"
	line "explosion might"
	para "have shifted"
	line "various parts of"
	cont "the cave<...>"
	done

SpurgePokecenterNPC2:
	ctxt "I'm too scared to"
	line "go outside."

	para "Who knows what"
	line "happens out there<...>"
	done

SpurgePokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 1, SPURGE_CITY
	warp_def $7, $5, 1, SPURGE_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_R_HIKER, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgePokecenterNPC1, -1
	person_event SPRITE_TEACHER, 4, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgePokecenterNPC2, -1
