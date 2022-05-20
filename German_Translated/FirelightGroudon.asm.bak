FirelightGroudon_MapScriptHeader;trigger count
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
	ctxt "Es ist scheinbar"
	line "die Statue eines"
	cont "mächtigen #mon."

	para "Merkwürdig<...>"
	
	para "Es streckt seine"
	line "Arme nach vorne<...>"

	para "Als würde es etwas"
	line "von uns erwarten<...>"

	done

.placed_orb_text
	ctxt "Rote Kugel in die"
	line "Hände der Statue"
	cont "platziert<...>"
	sdone

.groudon_wakes_up_text
	ctxt "Es bewegt sich!"

	para "DAS IST KEINE"
	line "STATUE!"
	
	para "Es ist ein echtes"
	line "#mon und es"
	para "will scheinbar"
	line "angreifen!"
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
