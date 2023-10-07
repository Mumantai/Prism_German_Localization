MoragaMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaMartNPC:
	ctxt "They sell Leaf"
	line "Stones here."

	para "They're super cheap"
	line "too!"
	done

MoragaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 2, MORAGA_TOWN
	warp_def $7, $7, 2, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, MORAGA_STANDARD_MART, -1
	person_event SPRITE_BURGLAR, 4, 10, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaMartNPC, -1
