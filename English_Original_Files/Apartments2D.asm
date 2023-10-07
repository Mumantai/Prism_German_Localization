Apartments2D_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Apartments2DNPC:
	faceplayer
	opentext
	checkevent EVENT_SPURGE_APARTMENT_TM67
	sif true
		jumptext .after_giving_TM_text
	writetext .give_TM_text
	givetm TM_TRI_ATTACK + RECEIVED_TM
	setevent EVENT_SPURGE_APARTMENT_TM67
	closetextend

.give_TM_text
	ctxt "The world is"
	line "experiencing a"
	cont "constant change."

	para "Technology keeps"
	line "growing without"
	cont "signs of decline."

	para "Therefore, I must"
	line "get rid of this TM"
	para "to work against"
	line "the current trend."

	para "I also need to"
	line "make some room in"
	cont "my apartment<...>"
	sdone

.after_giving_TM_text
	ctxt "TM67 is called Tri"
	line "Attack."

	para "Its type is a"
	line "combination of"
	para "Fire, Ice and"
	line "Electric."

	para "It also has a"
	line "chance of burning,"
	para "freezing or"
	line "paralyzing your"
	cont "opponent."
	done

Apartments2D_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $9, $4, 3, APARTMENTS_F3
	warp_def $9, $5, 3, APARTMENTS_F3

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SCIENTIST, 5, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Apartments2DNPC, -1
