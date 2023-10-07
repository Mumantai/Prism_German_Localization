RijonHiddenBasement_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonHiddenBasementHiddenItem:
	dw EVENT_RIJON_HIDDEN_BASEMENT_HIDDENITEM_MAX_REVIVE
	db MAX_REVIVE

RijonHiddenBasementNPC:
	ctxt "A bunch of Diglett"
	line "popped out of the"
	para "ground! That was"
	line "shocking."
	done

RijonHiddenBasement_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 5
	warp_def $23, $4, 7, HAYWARD_CITY
	warp_def $23, $5, 7, HAYWARD_CITY
	warp_def $9, $3, 4, RIJON_HIDDEN_BASEMENT
	warp_def $21, $5, 3, RIJON_HIDDEN_BASEMENT
	warp_def $15, $11, 5, MT_BOULDER_B1F

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 11, 6, SIGNPOST_ITEM, RijonHiddenBasementHiddenItem

	;people-events
	db 1
	person_event SPRITE_POKEFAN_M, 20, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, RijonHiddenBasementNPC, -1
