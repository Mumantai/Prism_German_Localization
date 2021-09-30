LaurelStick_MapScriptHeader;trigger count
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

	para "Ihr jungen leute"
	line "und euer Fastfood!"

	para "<...>"

	para "Hier was gesundes"
	line "für dich!"

	para "setzte es weise"
	line "ein<...>"

	prompt

.after_giving_stick_text
	ctxt "Eine Lauchstange"
	line "kann man taktisch"
	cont "im Kampf nutzen."
	done

LaurelStickNPC:
	ctxt "Oh, Oma<...>"

	para "Erinnerst du dich"
	line "an nichts mehr?"
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
