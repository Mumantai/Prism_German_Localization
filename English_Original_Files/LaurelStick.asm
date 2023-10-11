LaurelStick_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelStickGrandma:
	faceplayer
	opentext
	checkevent EVENT_LAUREL_CITY_STICK
	sif false, then
		writetext .before_giving_stick_text
		verbosegiveitem STICK, 1
		sif false
			closetextend
		setevent EVENT_LAUREL_CITY_STICK
		waitbutton
	sendif
	jumptext .after_giving_stick_text

.before_giving_stick_text
	ctxt "Hehehe<...>"

	para "I collect sticks."

	para "<...>"

	para "What's that?"
	line "Stickers?"

	para "Oh my, younglings"
	line "these day<...>"

	para "Here, you can have"
	line "one of my sticks."
	prompt

.after_giving_stick_text
	ctxt "Sticks can be"
	line "useful in the"
	cont "right place."
	done

LaurelStickNPC:
	ctxt "Oh, grandma<...>"

	para "Is your memory"
	line "really gone?"
	done

LaurelStick_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 2, LAUREL_CITY
	warp_def $7, $3, 2, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LaurelStickGrandma, -1
	person_event SPRITE_TEACHER, 2, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, LaurelStickNPC, -1
