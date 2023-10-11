SaffronCopycatsHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronCopycatsHousePikachuDoll:
	ctxt "It's a Pikachu"
	line "doll!"
	done

SaffronCopycatsHouseGengarDoll:
	ctxt "It's a Gengar"
	line "doll!"
	done

SaffronCopycatsHouseCaterpieDoll:
	ctxt "It's a Caterpie"
	line "doll!"
	done

SaffronCopycatsHouseLarvitarDoll:
	ctxt "It's a Larvitar"
	line "doll!"

	para "Ah, memories<...>"
	done

SaffronCopycat:
	ctxt "Hi there!"

	para "I'm called Copycat."

	para "I don't mimic many"
	line "people anymore,"
	para "but I collect"
	line "#mon dolls!"
	done

SaffronCopycatsHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $7, $2, 4, SAFFRON_CITY
	warp_def $7, $3, 4, SAFFRON_CITY
	warp_def $0, $2, 4, SAFFRON_COPYCATS_HOUSE
	warp_def $e, $3, 3, SAFFRON_COPYCATS_HOUSE

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaffronCopycat, -1
	person_event SPRITE_PIKACHU, 15, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SaffronCopycatsHousePikachuDoll, -1
	person_event SPRITE_GENGAR, 15, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, SaffronCopycatsHouseGengarDoll, -1
	person_event SPRITE_CATERPIE, 15, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXT, 0, SaffronCopycatsHouseCaterpieDoll, -1
	person_event SPRITE_LARVITAR, 19, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXT, 0, SaffronCopycatsHouseLarvitarDoll, -1
