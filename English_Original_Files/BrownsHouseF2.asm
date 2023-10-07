BrownsHouseF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

BrownsHouseF2Nintendo64:
	ctxt "It's a dusty"
	line "Nintendo 64."
	done

BrownsHouseF2_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $0, $7, 3, BROWNS_HOUSE_F1

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 5, 3, SIGNPOST_TEXT, BrownsHouseF2Nintendo64

.ObjectEvents
	db 0
