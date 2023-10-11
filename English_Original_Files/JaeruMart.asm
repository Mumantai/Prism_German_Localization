JaeruMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

JaeruMartNPC1:
	ctxt "Don't drink too"
	line "much of that beer."

	para "It's strange, but"
	line "#mon enjoy it"
	cont "too!"

	para "Ha!"
	done

JaeruMartNPC2:
	ctxt "Thunderstones are"
	line "so pretty!"

	para "I like to collect"
	line "them!"
	done

JaeruMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 5, JAERU_CITY
	warp_def $7, $7, 5, JAERU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, JAERU_STANDARD_MART, -1
	person_event SPRITE_HIKER, 6, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, JaeruMartNPC1, -1
	person_event SPRITE_R_JRTRAINERF, 3, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, JaeruMartNPC2, -1
