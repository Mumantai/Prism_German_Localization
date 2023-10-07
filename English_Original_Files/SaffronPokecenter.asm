SaffronPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronPokecenterNPC1:
	ctxt "Silph Co.'s CEO"
	line "used to be the"
	cont "champion of Kanto."

	para "Talk about an"
	line "impressive resume!"
	done

SaffronPokecenterNPC2:
	ctxt "The Magnet Train"
	line "has expanded over"
	para "the last couple of"
	line "years."

	para "It goes to four"
	line "regions now!"
	done

SaffronPokecenterNPC3:
	ctxt "I heard that some"
	line "legendary Trainers"
	para "live on a secret"
	line "island."

	para "It's a rumor since"
	line "nobody knows where"
	para "they are these"
	line "days."
	done

SaffronPokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 9, SAFFRON_CITY
	warp_def $7, $5, 9, SAFFRON_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_GENTLEMAN, 4, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC1, -1
	person_event SPRITE_FISHING_GURU, 5, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC2, -1
	person_event SPRITE_POKEFAN_F, 3, 0, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronPokecenterNPC3, -1
