CaperHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CaperHouseNPC:
	ctxt "Oh, ein neues"
	line "Gesicht."

	para "Was bringt dich"
	line "nach Kaper City?"

	para "<...>"

	para "Was!?"

	para "Du bist in der"
	line "Mine durch einen"
	cont "Loch gefallen???"

	para "Ich muss da mal"
	line "eine Leiter auf-"
	cont "stellen<...>"
	done

CaperHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 3, CAPER_CITY
	warp_def $7, $3, 3, CAPER_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperHouseNPC, -1
