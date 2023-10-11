CaperMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CaperMart_GoldToken:
	dw EVENT_CAPER_MART_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

CaperMartAttendant:
	checkevent EVENT_MET_ILK
	sif false
		jumptextfaceplayer .closed_text
	pokemart MART_STANDARD, CAPER_STANDARD_MART

.closed_text
	ctxt "Sorry."

	para "We're stocking"
	line "up on inventory."

	para "Please come back"
	line "later."
	done

CaperMartNPC1:
	ctxt "I was once accused"
	line "of shoplifting."

	para "I was just trying"
	line "to figure out what"
	cont "I wanted to buy!"
	done

CaperMartNPC2:
	ctxt "It's waaay too"
	line "cold outside."

	para "I'm staying indoors"
	line "until things start"
	cont "warming up."
	done

CaperMartNPC3:
	ctxt "Can't you see I'm"
	line "busy here?"
	done

CaperMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 1, CAPER_RIDGE
	warp_def $7, $7, 1, CAPER_RIDGE

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 1, 10, SIGNPOST_ITEM, CaperMart_GoldToken

.ObjectEvents
	db 4
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CaperMartAttendant, -1
	person_event SPRITE_PSYCHIC, 6, 2, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperMartNPC1, -1
	person_event SPRITE_BUG_CATCHER, 7, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperMartNPC2, -1
	person_event SPRITE_GAMEBOY_KID, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, CaperMartNPC3, -1
