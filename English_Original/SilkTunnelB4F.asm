SilkTunnelB4F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SilkTunnelB4F_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $f, $3, 1, SILK_TUNNEL_B3F
	warp_def $f, $f, 1, SILK_TUNNEL_B5F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
