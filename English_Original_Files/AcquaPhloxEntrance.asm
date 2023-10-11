AcquaPhloxEntrance_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .initialize

.initialize
	checkflag ENGINE_FLYPOINT_PHLOX_TOWN
	sif true, then
		setevent EVENT_0
	selse
		clearevent EVENT_0
	sendif
	writebyte 1
	farjump AcquaWarpMod

AcquaPhloxEntranceBlockingHiker:
	ctxt "Did you know? The"
	line "tides in this cave"
	para "change about three"
	line "times a day."
	done

AcquaPhloxEntrance_MapEventHeader:: db 0, 0

.Warps
	db 2
	dummy_warp 3, 5
	warp_def 5, 5, 7, PHLOX_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_HIKER, 5, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, AcquaPhloxEntranceBlockingHiker, EVENT_0
	person_event SPRITE_HIKER, 5, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, AcquaPhloxEntranceBlockingHiker, EVENT_0 | $8000
