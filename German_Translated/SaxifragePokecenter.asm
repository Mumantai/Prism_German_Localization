SaxifragePokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaxifragePokecenterNPC1:
	ctxt "Den eingesperrten"
	line "#mon wird die"
	para "Nutzung des"
	line "#mon-Centers"
	cont "verwehrt <...>"

	para "Sie kennen es"
	line "auch nicht anders."

	para "Sie wurden von"
	line "ihren Trainern"
	para "ohnehin ständig"
	line "misshandelt <...>"
	done

SaxifragePokecenterNPC2:
	ctxt "Diese Insel ist"
	line "echt ungepflegt."

	para "Wilde #mon"
	line "laufen frei herum"
	para "und nerven jeden,"
	line "der diese Insel"
	cont "betritt <...>"
	done

SaxifragePokecenterNPC3:
	ctxt "Meiner Meinung"
	line "nach sind die"
	para "Bedingungen für"
	line "die Gefangenen"
	cont "sehr grausam."

	para "Menschen und"
	line "#mon können"
	para "auch mal tagelang"
	line "nichts zu essen"
	cont "bekommen."
	done

SaxifragePokecenter_MapEventHeader ;filler
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
