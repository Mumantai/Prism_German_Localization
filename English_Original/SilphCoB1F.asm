SilphCoB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SilphCoB1F_MapEventHeader ;filler
	db 0, 0

;warps
	db 1
	warp_def $6, $6, 7, SILPH_CO

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_FRUIT_TREE, 2, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_FRUITTREE, 0, 10, -1
