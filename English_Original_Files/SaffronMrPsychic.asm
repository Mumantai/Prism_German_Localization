SaffronMrPsychic_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaffronMrPsychicNPC:
	faceplayer
	opentext
	checkevent EVENT_MR_PSYCHIC
	sif true
		jumptext .after_giving_TM_text
	writetext .before_giving_TM_text
	givetm TM_PSYCHIC + RECEIVED_TM
	setevent EVENT_MR_PSYCHIC
	closetextend

.before_giving_TM_text
	ctxt "You were expecting"
	line "this, right?"
	sdone

.after_giving_TM_text
	ctxt "TM29 is Psychic."

	para "It may lower the"
	line "target's Special"
	cont "Defense."
	done

SaffronMrPsychic_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $2, 3, SAFFRON_CITY
	warp_def $7, $3, 3, SAFFRON_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SaffronMrPsychicNPC, -1
