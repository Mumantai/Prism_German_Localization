PrisonBaths_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PrisonBathsHiddenItem:
	dw EVENT_PRISON_BATHS_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonBathsNPC:
	ctxt "Wusstest du?"

	para "Die Leute hier"
	line "lassen oft Ihre"
	para "Wertsachen im"
	line "Bad liegen."

	para "Wenn du etwas"
	line "suchst, könntest"
	para "du es in den"
	line "Bädern finden."
	done

PrisonBaths_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $8, $13, 8, PRISON_F1
	warp_def $9, $13, 9, PRISON_F1

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 6, 12, SIGNPOST_ITEM, PrisonBathsHiddenItem

	;people-events
	db 1
	person_event SPRITE_SAILOR, 10, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonBathsNPC, -1
