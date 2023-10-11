TimeCapsule_MapScriptHeader:
.MapTriggers
	db 2
	maptrigger .initialization_trigger
	maptrigger GenericDummyScript

.MapCallbacks
	db 1
	dbw MAPCALLBACK_OBJECTS, .show_correct_player_NPC

.initialization_trigger
	priorityjump TimeCapsule_Initialize
	end

.show_correct_player_NPC
	special Special_CableClubCheckWhichChris
	sif true, then
		disappear 3
		appear 2
	selse
		disappear 2
		appear 3
	sendif
	return

TimeCapsule_Initialize:
	dotrigger 1
	domaptrigger POKECENTER_BACKROOM, 3
	end

TimeCapsuleMachine:
	special Special_TimeCapsule
	newloadmap MAPSETUP_LINKRETURN
	end

TimeCapsulePlayerNPC:
	ctxt "Your friend is"
	line "ready."
	done

TimeCapsule_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $4, 4, POKECENTER_BACKROOM
	warp_def $7, $5, 4, POKECENTER_BACKROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, TimeCapsuleMachine
	signpost 4, 5, SIGNPOST_LEFT, TimeCapsuleMachine

.PersonEvents:
	db 2
	person_event SPRITE_P0, 4, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, TimeCapsulePlayerNPC, EVENT_LINKED_PLAYER_RIGHT
	person_event SPRITE_P0, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, TimeCapsulePlayerNPC, EVENT_LINKED_PLAYER_LEFT
