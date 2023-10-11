PrisonBaths_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PrisonBathsHiddenItem:
	dw EVENT_PRISON_BATHS_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonBathsNPC:
	ctxt "People often lose"
	line "stuff in the bath."

	para "If you're looking"
	line "for something, it's"
	para "worth it to look"
	line "inside those."
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
	ctxt "I'm in flavor"
	line "country<...>"
	done

.intro_text
	ctxt "Hey man, you think"
	line "you could sneak me"
	para "in something from"
	line "the Mart?"

	para "I could really use"
	line "a Cigarette."

	para "I promise I'll"
	line "make it worth your"
	cont "while<...>"
	done

.said_no_text
	ctxt "Aw man, pretty"
	line "please?"
	done

.no_cigarette_text
	ctxt "Just head over to"
	line "the Mart. It's only"
	cont "¥1000."
	done

.gave_cigarette_text
	ctxt "Thanks a dozen,"
	line "mate."

	para "I found this in"
	line "the lower cells."

	para "It's of no use to"
	line "me in here."
	done

.no_room_text
	ctxt "Aw, what?"
	line "You don't have"
	cont "room for it."

	para "I can't accept your"
	line "efforts without"
	para "giving back. It's"
	line "bad karma."
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
