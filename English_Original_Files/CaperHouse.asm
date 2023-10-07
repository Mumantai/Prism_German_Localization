CaperHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CaperHouseNPC:
	ctxt "Oh, a new face."

	para "What brings you"
	line "to Caper Ridge?"

	para "<...>"

	para "What!?"

	para "You fell down the"
	line "hole in the mines?"

	para "I need to put a"
	line "ladder there<...>"
	done

CaperHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 3, CAPER_RIDGE
	warp_def $7, $3, 3, CAPER_RIDGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperHouseNPC, -1
