RijonUndergroundVertical_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonUndergroundVertical_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $2, $5, 1, MORAGA_GATE_UNDERGROUND
	warp_def $2d, $2, 1, ROUTE_56_GATE_UNDERGROUND

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
