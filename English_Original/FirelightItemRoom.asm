FirelightItemRoom_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

FirelightItemRoom_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $11, $5, 3, FIRELIGHT_F1
	warp_def $3, $7, 7, FIRELIGHT_ROOMS
	warp_def $5, $7, 3, PROVINCIAL_PARK

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 14, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SWAGGER, 0, EVENT_FIRELIGHT_ITEMROOM_TM
