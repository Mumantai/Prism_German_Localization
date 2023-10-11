FirelightGroudon_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FirelightGroudonStatue:
	checkitem RED_ORB
	sif false
		jumptext .no_orb_text
	opentext
	writetext .placed_orb_text
	cry GROUDON
	takeitem RED_ORB, 1
	writetext .groudon_wakes_up_text
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadwildmon GROUDON, 50
	startbattle
	setevent EVENT_FOUGHT_GROUDON
	disappear 2
	reloadmapafterbattle
	end

.no_orb_text
	ctxt "It appears to be"
	line "a statue of a"
	cont "fierce #mon."

	para "It's strangely"
	line "holding out its"
	cont "arms<...>"

	para "Maybe it's"
	line "expecting a gift"
	cont "from someone?"
	done

.placed_orb_text
	ctxt "Placed the Red"
	line "Orb in the"
	cont "statue's hands."
	sdone

.groudon_wakes_up_text
	ctxt "It started"
	line "moving!"

	para "This isn't a"
	line "statue; it's a"
	para "living #mon,"
	line "and it looks like"
	para "it's going to"
	line "attack!"
	sdone

FirelightGroudon_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $11, $9, 6, FIRELIGHT_ROOMS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_GROUDON, 6, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FirelightGroudonStatue, EVENT_FOUGHT_GROUDON
	person_event SPRITE_POKE_BALL, 17, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAGMARIZER, EVENT_FIRELIGHT_GROUDON_ITEM_MAGMARIZER
