ToreniaDrifloomTrade_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

ToreniaDrifloomTradeDude:
	ctxt "Those people in"
	line "Botan City sure"
	cont "are rude."
	done

ToreniaDrifloomTrade_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 8, TORENIA_CITY
	warp_def $7, $3, 8, TORENIA_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, ToreniaDrifloomTradeDude, -1
	person_event SPRITE_YOUNGSTER, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_JUMPSTD, 0, trade, 0, -1
