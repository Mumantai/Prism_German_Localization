EmberBrookGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EmberBrookGateNPC:
	ctxt "Eastward is Mt."
	line "Ember."

	para "Its structure"
	line "often changes"
	para "due to its many"
	line "eruptions."
	done

EmberBrookGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 6, ROUTE_67
	warp_def $5, $0, 7, ROUTE_67
	warp_def $4, $9, 1, EMBER_BROOK
	warp_def $5, $9, 2, EMBER_BROOK

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, EmberBrookGateNPC, -1
