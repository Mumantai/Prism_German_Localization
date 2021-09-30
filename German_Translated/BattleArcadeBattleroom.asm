BattleArcadeBattleroom_MapScriptHeader
;trigger count
	db 0
 ;callback count
	db 0

BattleArcadeBattleroom_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 3, BATTLE_ARCADE_LOBBY
	warp_def $7, $4, 3, BATTLE_ARCADE_LOBBY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 9

	;facing left
	person_event SPRITE_SCIENTIST, 3, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_LASS, 5, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_YOUNGSTER, 6, 1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BLACK_BELT, 5, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	;facing right
	person_event SPRITE_BUG_CATCHER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_COOLTRAINER_F, 3, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_POKEFAN_F, 4, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_COOLTRAINER_M, 6, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	;in the back
	person_event SPRITE_GAMEBOY_KID, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
