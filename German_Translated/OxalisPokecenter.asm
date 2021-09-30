OxalisPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

OxalisPokecenterNPC1:
	ctxt "Shh!"

	para "<...>"

	para "Ich schlage mein"
	line "alten Rekord!"
	done

OxalisPokecenterNPC2:
	ctxt "Ich komme aus der"
	line "Sinnoh Region und"
	para "die #mon hier"
	line "sind ganz anders."

	para "Einige erkenne ich"
	line "wieder, aber die "
	para "meisten sind völ-"
	line "lig verschieden."
	done

OxalisPokecenterNPC3:
	ctxt "Ein Trainer lachte"
	line "mein #mon aus<...>"

	para "Aber ich denke,"
	line "Pummeluff ist die"
	cont "süsseste!"

	para "Vieleicht weil sie"
	line "in Rijon nicht in"
	cont "der Wildnis leben?"
	done

OxalisPokecenter_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $7, $4, 7, OXALIS_CITY
	warp_def $7, $5, 7, OXALIS_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_GAMEBOY_KID, 6, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OxalisPokecenterNPC1, -1
	person_event SPRITE_JUGGLER, 3, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OxalisPokecenterNPC2, -1
	person_event SPRITE_TWIN, 5, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OxalisPokecenterNPC3, -1
