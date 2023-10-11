TradeCenter_MapScriptHeader:
.MapTriggers
	db 2

	maptrigger .initialization_trigger
	maptrigger GenericDummyScript

.MapCallbacks
	db 1
	dbw MAPCALLBACK_OBJECTS, .set_which_sprite

.initialization_trigger
	priorityjump TradeCenter_Initialize
	end

.set_which_sprite
	special Special_CableClubCheckWhichChris
	sif true, then
		disappear 3
		appear 2
	selse
		disappear 2
		appear 3
	sendif
	return

TradeCenter_Initialize:
	dotrigger 1
	domaptrigger POKECENTER_BACKROOM, 1
	end

TradeCenterMachine:
	special Special_TradeCenter
	newloadmap MAPSETUP_LINKRETURN
	end

TradeCenterPlayerNPC:
	ctxt "Your friend is"
	line "ready."
	done

TradeCenter_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $4, 2, POKECENTER_BACKROOM
	warp_def $7, $5, 2, POKECENTER_BACKROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, TradeCenterMachine
	signpost 4, 5, SIGNPOST_LEFT, TradeCenterMachine

.PersonEvents:
	db 2
	person_event SPRITE_P0, 4, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, TradeCenterPlayerNPC, EVENT_LINKED_PLAYER_RIGHT
	person_event SPRITE_P0, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, TradeCenterPlayerNPC, EVENT_LINKED_PLAYER_LEFT
