PrisonBaths_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PrisonBathsHiddenItem:
	dw EVENT_PRISON_BATHS_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonBathsNPC:
	ctxt "Did you know?"

	para "People often lose"
	line "stuff in the bath."

	para "If you're looking"
	line "for something,"
	para "it's worth it to"
	line "look inside those."
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
