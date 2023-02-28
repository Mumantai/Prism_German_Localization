Route53_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route53HiddenItem:
	dw EVENT_ROUTE_53_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route53Sign:
	ctxt "<UP> Maritima City"
	next "<DOWN> Kiesdorf"
	done

Route53ElixirGiveawayDude:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_53_ELIXIR_GUY
	sif true
		jumptext .already_gave_item_text
	writetext .before_giving_item_text
	verbosegiveitem ELIXIR, 1
	waitbutton
	sif false
		jumptext .no_room_for_item_text
	setevent EVENT_ROUTE_53_ELIXIR_GUY
	closetextend

.before_giving_item_text
	ctxt "Hi!"

	para "Der kieselinger"
	line "Markt verschenkt"
	cont "heute Kostproben!"

	para "Viel Spaß damit!"
	sdone

.already_gave_item_text
	ctxt "Tut mir leid,"
	line "alle Proben sind"
	cont "schon aus!"

	done

.no_room_for_item_text
	ctxt "Komm einfach"
	line "wieder, wenn du"
	cont "mehr Platz hast."

	done

Route53_MapEventHeader ;filler
	db 0, 0

;warps
	db 0

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 27, 9, SIGNPOST_LOAD, Route53Sign
	signpost 4, 16, SIGNPOST_ITEM, Route53HiddenItem

	;people-events
	db 2
	person_event SPRITE_SUPER_NERD, 17, 11, SPRITEMOVEDATA_00, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route53ElixirGiveawayDude, -1
	person_event SPRITE_FRUIT_TREE, 2, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_FRUITTREE, 0, 7, -1
