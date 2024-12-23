SpurgePokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgePokecenterNPC1:
	ctxt "Oh, du bist es ja!"
	para "Ich bins! Der,"
	line "über den hier alle"
	cont "reden!"
	para "Du weißt schon,"
	line "derjenige der die"
	cont "Felsen zerstörte!"
	para "Ich glaube diese"
	line "Explosion legte"
	para "auch andere Wege"
	line "in der Höhle frei."
	done

SpurgePokecenterNPC2:
	ctxt "Ich fürchte mich"
	line "vor der Außenwelt."
	para "Wer weiß, was dort"
	line "so alles"
	cont "passiert <...>"
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