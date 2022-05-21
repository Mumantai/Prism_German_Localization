HeathHouseTM30_MapScriptHeader;trigger count
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
	ctxt "Ich hab hier was"
	line "dolles für dich."

	para "Ich habe dieses"
	line "Item bereits bei  "
	para "all meinen Geist"
	line "#mon benutzt."
	para "Jetzt kannst du"
	line "es nutzen!"
	sdone

.already_gave_TM_text
	ctxt "TM30 ist"
	line "Spukball."

	para "Es ist eine"
	line "mächtige Geist-"
	para "Attacke welches"
	line "die gegnerische"
	para "spezial Vert."
	line "senken könnte."
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
