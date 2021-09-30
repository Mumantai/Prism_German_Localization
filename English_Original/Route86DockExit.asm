Route86DockExit_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route86DockExit_MapEventHeader ;filler
	db 0, 0

;warps
	db 5
	warp_def $0, $4, 2, ROUTE_86
	warp_def $0, $5, 3, ROUTE_86
	warp_def $5, $5, 4, ROUTE_86_DOCK_EXIT
	warp_def $e, $5, 3, ROUTE_86_DOCK_EXIT
	warp_def $24, $5, 1, ROUTE_86_DOCK

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
