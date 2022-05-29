ToreniaMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ToreniaMart_GoldToken:
	dw EVENT_TORENIA_MART_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

ToreniaMartNPC1:
	ctxt "Die Bauarbeiten"
	line "pausieren grade."

	para "Sehr gut!"

	para "Die Geräusche waren"
	line "sehr nervig."
	done

ToreniaMartNPC2:
	ctxt "Ich kann mich"
	line "einfach nicht"
	cont "entscheiden <...>"

	para "So viel zu kaufen,"
	line "so wenig Geld!"
	done

ToreniaMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 1, TORENIA_CITY
	warp_def $7, $7, 1, TORENIA_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 1, 11, SIGNPOST_ITEM, ToreniaMart_GoldToken

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, TORENIA_STANDARD_MART, -1
	person_event SPRITE_GRANNY, 6, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, ToreniaMartNPC1, -1
	person_event SPRITE_COOLTRAINER_M, 2, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, ToreniaMartNPC2, -1
