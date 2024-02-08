SoutherlyHouse2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyHouseNPC1:
	ctxt "Willkommen in der"
	line "Tunod-Region!"
	para "Dank der neuen"
	line "Süd-Passage kommen"
	para "jetzt viel mehr"
	line "Besucher zu uns!"
	done

SoutherlyHouseNPC2:
	ctxt "Hast du schon die"
	line "Psionlichtung"
	cont "besucht?"
	para "Viele Folipurba"
	line "leben dort!"
	done

SoutherlyHouse2_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 1, SOUTHERLY_CITY
	warp_def 7, 3, 1, SOUTHERLY_CITY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_TEACHER, 5, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyHouseNPC1, -1
	person_event SPRITE_TEACHER, 5, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SoutherlyHouseNPC2, -1