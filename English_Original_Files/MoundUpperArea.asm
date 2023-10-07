MoundUpperArea_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoundUpperAreaNPC:
	faceplayer
	opentext
	checkevent EVENT_MOUND_CAVE_MYSTIC_WATER_NPC
	sif true
		jumptext .after_item_text
	writetext .before_item_text
	buttonsound
	verbosegiveitem MYSTIC_WATER, 1
	sif true
		setevent EVENT_MOUND_CAVE_MYSTIC_WATER_NPC
	closetextend

.before_item_text
	ctxt "You need a #mon"
	line "to get across the"
	cont "water?"

	para "Can't you swim"
	line "yourself?"

	para "You like my blue"
	line "necklace?"

	para "I found them under"
	line "water. Here, take"
	cont "one."
	done

.after_item_text
	ctxt "You need to learn"
	line "how to swim!"
	done

MoundUpperArea_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 25, 1, ROUTE_83
	warp_def 5, 3, 4, ROUTE_69_SOUTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_COOLTRAINER_M, 2, 17, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoundUpperAreaNPC, -1
	person_event SPRITE_POKE_BALL, 7, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_MUD_SLAP, 0, EVENT_MOUND_CAVE_TM31
	person_event SPRITE_POKE_BALL, 15, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_EARTHQUAKE, 0, EVENT_MOUND_CAVE_TM65
