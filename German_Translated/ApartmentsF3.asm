ApartmentsF3_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ApartmentsF3Sign2A:
	text "2-A"
	done

ApartmentsF3Sign2B:
	text "2-B"
	done

ApartmentsF3Sign2C:
	ctxt "2-C"
	done

ApartmentsF3Sign2D:
	ctxt "2-D"
	done

ApartmentsF3_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def 12, 1, 3, APARTMENTS_F2
	warp_def 12, 17, 4, APARTMENTS_F2
	warp_def 0, 9, 1, APARTMENTS_2D

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 4, 2, SIGNPOST_TEXT, ApartmentsF3Sign2A
	signpost 12, 8, SIGNPOST_TEXT, ApartmentsF3Sign2B
	signpost 4, 16, SIGNPOST_TEXT, ApartmentsF3Sign2C
	signpost 0, 8, SIGNPOST_TEXT, ApartmentsF3Sign2D

.ObjectEvents
	db 0
