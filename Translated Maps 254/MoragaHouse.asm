MoragaHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaHouseNPC1:
	ctxt "Papa spielt gerne"
	line "den Nostalgiker."
	done

MoragaHouseNPC2:
	ctxt "Die Kriminalitäts-"
	line "rate dieser Stadt"
	para "ist gestiegen,"
	line "seitdem es in"
	para "Botania City den"
	line "Bahnhof gibt."
	done

MoragaHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 5, MORAGA_TOWN
	warp_def $7, $3, 5, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_YOUNGSTER, 4, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaHouseNPC1, -1
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaHouseNPC2, -1