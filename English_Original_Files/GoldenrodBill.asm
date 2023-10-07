GoldenrodBill_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodBillBrother:
	ctxt "My brother Bill"
	line "made the PC"
	para "#mon storage"
	line "system."
	done

GoldenrodBillFather:
	ctxt "I'm so proud of"
	line "my son."
	done

GoldenrodBill_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 4, GOLDENROD_CITY
	warp_def $7, $3, 4, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, GoldenrodBillBrother, -1
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodBillFather, -1
