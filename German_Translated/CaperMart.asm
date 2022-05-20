CaperMart_MapScriptHeader;trigger count
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
	ctxt "Entschuldige."

	para "Unser Lager wird"
	line "gerade aufgefüllt."

	para "Komm bitte später"
	line "wieder."
	done

CaperMartNPC1:
	ctxt "Ich wurde mal des"
	line "Ladendiebstahls"
	cont "beschuldigt <...>"

	para "Dabei war ich nur"
	line "am Überlegen, was"
	cont "ich alles brauche!"
	done

CaperMartNPC2:
	ctxt "Es ist viel zu"
	line "kalt draußen!"

	para "Ich bleibe drin,"
	line "bis das Wetter"
	cont "wärmer wird!"
	done

CaperMartNPC3:
	ctxt "Ich bin viel zu"
	line "beschäftigt!"
	done

CaperMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 1, CAPER_CITY
	warp_def $7, $7, 1, CAPER_CITY

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
