PrisonBaths_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PrisonBathsHiddenItem:
	dw EVENT_PRISON_BATHS_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonBathsNPC:
	ctxt "Wusstest du?"
	para "Die Leute hier"
	line "lassen oft Ihre"
	para "Wertsachen im"
	line "Bad liegen."
	para "Wenn du etwas"
	line "suchst, könntest"
	para "du es in den"
	line "Bädern finden."
	done

PrisonBathsCigaretteGuy:
	faceplayer
	opentext
	checkevent EVENT_PRISON_BATHS_METAL_COAT
	sif true
		jumptext .already_got_metal_coat_text
	writetext .intro_text
	yesorno
	sif false
		jumptext .said_no_text
	checkitem CIGARETTE
	sif false
		jumptext .no_cigarette_text
	verbosegiveitem METAL_COAT, 1
	waitbutton
	sif false
		jumptext .no_room_text
	takeitem CIGARETTE, 1
	setevent EVENT_PRISON_BATHS_METAL_COAT
	jumptext .gave_cigarette_text

.already_got_metal_coat_text
	ctxt "Ich bin im"
	line "Geschmacksland<...>"
	done

.intro_text
	ctxt "Hey, denkst"
	line "du, du könntest"
	para "mir etwas vom Mart"
	line "reinschmuggeln?"
	para "Ich könnte"
	line "wirklich eine"
	para "Zigarette"
	line "gebrauchen."
	para "Ich verspreche, es"
	line "wird sich für dich"
	cont "lohnen<...>"
	done

.said_no_text
	ctxt "Ach komm schon,"
	line "bitte?"
	done

.no_cigarette_text
	ctxt "Geh einfach zum"
	line "Markt. Kostet nur"
	cont "¥1000."
	done

.gave_cigarette_text
	ctxt "Vielen Dank!"
	para "Das hier habe ich"
	line "in den unteren"
	cont "Zellen gefunden."
	para "Kannst du haben."
	done

.no_room_text
	ctxt "Äh, was?"
	line "Du hast keinen"
	cont "Platz mehr."
	para "Du musst es aber"
	line "annehmen, sonst"
	para "schulde ich dir"
	line "ja noch was."
	done

PrisonBaths_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $8, $13, 8, PRISON_F1
	warp_def $9, $13, 9, PRISON_F1

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 6, 12, SIGNPOST_ITEM, PrisonBathsHiddenItem

	;people-events
	db 2
	person_event SPRITE_SAILOR, 10, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonBathsNPC, -1
	person_event SPRITE_DELINQUENTM, 6, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PrisonBathsCigaretteGuy, -1