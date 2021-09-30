PhaceliaEastExit_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .reset_undercover_flags

.reset_undercover_flags
	; let's reset them just in case you whited out while in the undercover mission
	checkevent EVENT_IN_UNDERCOVER_MISSION
	sif false
		return
	setevent EVENT_ROUTE_85_POLICEMAN_GONE
	clearevent EVENT_PALETTE_BLACK_FOLLOWING
	return

PhaceliaEastExit_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $5, $3, 10, PHACELIA_CITY
	warp_def $5, $d, 1, ROUTE_85

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
