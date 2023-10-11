PhaceliaTM20_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaTM20NPC:
	faceplayer
	opentext
	checkevent EVENT_GET_TM20
	sif true
		jumptext .already_gave_TM_text
	writetext .before_giving_TM_text
	givetm TM_ENDURE + RECEIVED_TM
	setevent EVENT_GET_TM20
	closetextend

.before_giving_TM_text
	ctxt "Andre's tough,"
	line "right?"

	para "This move will"
	line "help your #mon"
	para "endure even his"
	line "toughest moves."
	sdone

.already_gave_TM_text
	ctxt "TM20 is Endure!"

	para "When your #mon"
	line "uses this move, it"
	para "won't get knocked"
	line "out by your foe's"
	cont "next move."
	done

PhaceliaTM20_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $2, 8, PHACELIA_CITY
	warp_def $7, $3, 8, PHACELIA_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_COOLTRAINER_M, 4, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhaceliaTM20NPC, -1
