BattleCenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

BattleCenterSignpost:
	special Special_TimeCapsule
	newloadmap 248
	end

BattleCenterNPC:
	ctxt "Your friend is"
	line "ready."
	done

BattleCenter_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $4, 3, POKECENTER_BACKROOM
	warp_def $7, $5, 3, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, BattleCenterSignpost
	signpost 4, 5, SIGNPOST_LEFT, BattleCenterSignpost

.ObjectEvents
	db 2
	person_event SPRITE_P0, 4, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, BattleCenterNPC, EVENT_BATTLE_CENTER_NPC_1
	person_event SPRITE_P0, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXT, 0, BattleCenterNPC, EVENT_BATTLE_CENTER_NPC_2
