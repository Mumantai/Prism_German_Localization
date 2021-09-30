JaeruGoldTokenVendor_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

JaeruGoldTokenVendorNPC:
	ctxt "Mein Vater"
	line "sammelte "
	cont "Goldmünzen."

	para "Es wurde aber nur"
	line "eine begrenzte"
	para "Menge davon"
	line "hergestellt, so"
	para "dass sie bei"
	line "Sammlern aus der"
	para "ganzen Welt"
	line "unglaublich"
	cont "begehrt sind."

	done

JaeruGoldTokenVendor_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 6, JAERU_CITY
	warp_def $7, $3, 6, JAERU_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_GRAMPS, 4, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_MART, 0, MART_GOLDTOKEN, JAERU_GOLD_TOKEN_MART, -1
	person_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, JaeruGoldTokenVendorNPC, -1
