AcquaHiTide_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AcquaHiTide_IceHeal:
	dw EVENT_ACQUA_HITIDE_HIDDENITEM_ICE_HEAL
	db ICE_HEAL

AcquaHiTide_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def 3, 15, 1, ACQUA_PHLOXENTRANCE
	warp_def 17, 23, 4, ACQUA_ROOM
	dummy_warp 2, 1
	warp_def 3, 19, 1, ACQUA_LABBASEMENTPATH

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 29, 30, SIGNPOST_ITEM, AcquaHiTide_IceHeal

.ObjectEvents
	db 0
