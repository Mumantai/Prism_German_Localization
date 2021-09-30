ApartmentsF2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ApartmentsF2Sign1A:
	text "1-A"
	done

ApartmentsF2Sign1B:
	text "1-B"
	done

ApartmentsF2Sign1C:
	text "1-C"
	done

ApartmentsF2Sign1D:
	text "1-D"
	done

ApartmentsF2_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def 5, 2, 3, APARTMENTS_F1
	warp_def 5, 18, 4, APARTMENTS_F1
	warp_def 18, 1, 1, APARTMENTS_F3
	warp_def 18, 19, 2, APARTMENTS_F3
	warp_def 2, 14, 1, APARTMENTS_1B
	warp_def 16, 6, 1, APARTMENTS_1C

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 2, 5, SIGNPOST_TEXT, ApartmentsF2Sign1A
	signpost 2, 15, SIGNPOST_TEXT, ApartmentsF2Sign1B
	signpost 16, 7, SIGNPOST_TEXT, ApartmentsF2Sign1C
	signpost 16, 13, SIGNPOST_TEXT, ApartmentsF2Sign1D

.ObjectEvents
	db 0
