CastroTyrogueTrade_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

CastroTyrogueTrade_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 9, CASTRO_VALLEY
	warp_def $7, $3, 9, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_JUMPSTD, 0, trade, 1, -1
