ToreniaGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

ToreniaGateGuard:
	ctxt "People need to"
	line "stop blaming me"
	para "for letting the"
	line "Palette Patrollers"
	cont "through here."

	para "I'm only human!"
	done

ToreniaGate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $0, $4, 12, TORENIA_CITY
	warp_def $0, $5, 13, TORENIA_CITY
	warp_def $7, $4, 6, ROUTE_77
	warp_def $7, $5, 6, ROUTE_77

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, ToreniaGateGuard, -1
