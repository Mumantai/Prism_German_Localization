HeathHouseTM30_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathHouseTM30NPC:
	faceplayer
	opentext
	checkevent EVENT_GET_TM30
	sif true
		jumptext .already_gave_TM_text
	writetext .give_TM_text
	givetm TM_SHADOW_BALL + RECEIVED_TM
	setevent EVENT_GET_TM30
	closetextend

.give_TM_text
	ctxt "You are quite the"
	line "young swimmer."

	para "I have already"
	line "used this item"
	para "on all of my"
	line "ghost #mon;"
	para "let me pass it"
	line "down to you!"
	sdone

.already_gave_TM_text
	ctxt "TM30 is Shadow"
	line "Ball."

	para "It's a powerful"
	line "ghost attack"
	para "that can even"
	line "lower your foe's"
	cont "special defense!"
	done

HeathHouseTM30_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 3, HEATH_VILLAGE
	warp_def $7, $4, 3, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HeathHouseTM30NPC, -1
