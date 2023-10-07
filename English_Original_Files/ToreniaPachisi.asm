ToreniaPachisi_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

ToreniaPachisiGameOperator:
	farjump PachisiGameTorenia

ToreniaPachisiNPC:
	ctxt "This game is just"
	line "about pure luck<...>"

	para "Which is why I"
	line "always lose at"
	cont "this, naturally."

	para "Nope, no pity for"
	line "an old man<...>"
	done

ToreniaPachisi_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $1d, $10, 7, TORENIA_CITY
	warp_def $1d, $11, 7, TORENIA_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 26, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ToreniaPachisiGameOperator, -1
	person_event SPRITE_GRAMPS, 12, 18, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, ToreniaPachisiNPC, -1
