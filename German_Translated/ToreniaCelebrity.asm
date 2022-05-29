ToreniaCelebrity_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ToreniaCelebrityNPC:
	faceplayer
	opentext
	checkevent EVENT_TORENIA_CITY_CELEB
	sif true
		jumptext .already_gave_item_text
	writetext .before_giving_apricorn_text
	buttonsound
	verbosegiveitem SHNYAPRICORN, 1
	sif true
		setevent EVENT_TORENIA_CITY_CELEB
	endtext

.before_giving_apricorn_text
	ctxt "<...>"

	para "Ich hasse es,"
	line "berühmt zu sein."

	para "Wenn du mein Haus"
	line "verlässt, gebe ich"
	cont "dir das."
	done

.already_gave_item_text
	ctxt "Wieso denken die"
	line "Leute, es wäre OK"
	para "einfach ohne"
	line "Erlaubnis in mein"
	cont "Haus zu kommen?"
	done

ToreniaCelebrityFearow:
	opentext
	writetext .cry_text
	cry FEAROW
	endtext

.cry_text
	ctxt "IBITAK: Ibii!"
	done

ToreniaCelebrity_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def 7, 2, 10, TORENIA_CITY
	warp_def 7, 3, 10, TORENIA_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_COOLTRAINER_F, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ToreniaCelebrityNPC, -1
	person_event SPRITE_FEAROW, 6, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ToreniaCelebrityFearow, -1
