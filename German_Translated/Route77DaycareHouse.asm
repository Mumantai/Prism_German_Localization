Route77DaycareHouse_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route77DaycareHouseMan:
	faceplayer
	opentext
	special Special_DayCareLady
	endtext

Route77DaycareHouseWoman:
	faceplayer
	opentext
	special Special_DayCareMan
	endtext

Route77DaycareHouse_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $5, $0, 1, ROUTE_77_DAYCARE_GARDEN
	warp_def $6, $0, 2, ROUTE_77_DAYCARE_GARDEN
	warp_def $7, $2, 3, ROUTE_77
	warp_def $7, $3, 3, ROUTE_77

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 1, 0, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 1, 1, SIGNPOST_JUMPSTD, difficultbookshelf

	;people-events
	db 2
	person_event SPRITE_PHARMACIST, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 8 + PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route77DaycareHouseMan, -1
	person_event SPRITE_LASS, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 8 + PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route77DaycareHouseWoman, -1
