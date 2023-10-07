AcaniaTM63_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaTM63NPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM63
	sif true
		jumptext .after_giving_TM_text
	writetext .before_giving_TM_text
	givetm TM_THUNDER_WAVE + RECEIVED_TM
	setevent EVENT_GOT_TM63
	closetextend

.before_giving_TM_text
	ctxt "Paralysis."

	para "It can massively"
	line "change the outcome"

	para "of battles with"
	line "#mon."

	para "See for yourself."
	sdone

.after_giving_TM_text
	ctxt "TM63 contains"
	line "Thunder Wave!"

	para "It'll paralyze the"
	line "foe, unless - of"

	para "course - the foe"
	line "is a Ground-type!"
	done

AcaniaTM63_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 8, ACANIA_DOCKS
	warp_def $7, $3, 8, ACANIA_DOCKS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_COOLTRAINER_M, 3, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, AcaniaTM63NPC, -1
