LongTunnelPath_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

LongTunnelPath_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def 3, 5, 2, ROUTE_70
	warp_def 3, 197, 4, ROUTE_58
	warp_def 3, 89, 1, LONG_TUNNEL_SIDESCROLL
	warp_def 3, 141, 5, SILK_TUNNEL_1F
	warp_def 3, 97, 2, LONG_TUNNEL_SIDESCROLL

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 0
