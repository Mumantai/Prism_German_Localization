AzaleaKurtBasement_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

AzaleaKurtBasementBallMakingTools:
	farjump BallMakingBasementScript

AzaleaKurtBasement_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 3, AZALEA_KURT
	warp_def $7, $4, 3, AZALEA_KURT

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 2, 2, SIGNPOST_READ, AzaleaKurtBasementBallMakingTools

.ObjectEvents
	db 0
