SaxifragePokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaxifragePokecenterNPC1:
	ctxt "They don't allow"
	line "the locked up"
	para "#mon to use"
	line "the #mon"
	cont "Center<...>"

	para "I believe some"
	line "#mon don't know"
	cont "any better."

	para "Most of them were"
	line "poorly raised"
	para "and abused by"
	line "their Trainers."
	done

SaxifragePokecenterNPC2:
	ctxt "This island is"
	line "very unkempt."

	para "Wild #mon still"
	line "roam freely and"
	para "bother anyone"
	line "choosing to visit."
	done

SaxifragePokecenterNPC3:
	ctxt "I think the"
	line "conditions for"
	para "the prisoners"
	line "are very cruel."

	para "Both humans and"
	line "#mon can go"
	para "days without"
	line "being given a"
	cont "meal."
	done

SaxifragePokecenter_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $7, $4, 3, SAXIFRAGE_ISLAND
	warp_def $7, $5, 3, SAXIFRAGE_ISLAND
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_BLACK_BELT, 7, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SaxifragePokecenterNPC1, -1
	person_event SPRITE_TEACHER, 6, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifragePokecenterNPC2, -1
	person_event SPRITE_YOUNGSTER, 4, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaxifragePokecenterNPC3, -1
