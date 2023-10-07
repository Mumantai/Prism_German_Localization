BrownsHouseF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

BrownsHouseF1Mom:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_BROWN
	sif false
		jumptext .not_fought_yet_text
	checkevent EVENT_GOT_TM90
	sif true
		jumptext .already_gave_TM_text
	writetext .give_TM_text
	setevent EVENT_GOT_TM90
	givetm TM_PRISM_SPRAY + RECEIVED_TM
	jumptext .after_TM_text

.not_fought_yet_text
	ctxt "I'm worried sick"
	line "about my son"
	cont "Brown."

	para "If you ever find"
	line "him, please let"
	cont "me know he's OK."
	done

.give_TM_text
	ctxt "What?"

	para "Brown is in the"
	line "Mystery Zone?"

	para "He could have"
	line "called, but at"
	para "least I feel"
	line "better knowing he's"
	cont "safe."

	para "Take this gift,"
	line "please."
	sdone

.after_TM_text
	ctxt "This TM holds a"
	line "very special move,"
	cont "Prism Spray."

	para "This move's type is"
	line "randomized every"
	cont "time you use it!"
	done

.already_gave_TM_text
	ctxt "Thank you again"
	line "for putting a"
	para "widow's mind at"
	line "ease."
	done

BrownsHouseF1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $2, 1, SEASHORE_CITY
	warp_def $7, $3, 1, SEASHORE_CITY
	warp_def $0, $7, 1, BROWNS_HOUSE_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_BROWNS_MOM, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrownsHouseF1Mom, -1
