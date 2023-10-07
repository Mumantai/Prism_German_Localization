MersonBirdHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonBirdHouseDude:
	faceplayer
	opentext
	checkevent EVENT_TM62
	sif true
		jumptext .after_TM_text
	writetext .before_TM_text
	givetm TM_SKY_ATTACK + RECEIVED_TM
	setevent EVENT_TM62
	closetextend

.before_TM_text
	ctxt "Ha!"

	para "The swiftness of"
	line "a bird #mon"
	para "cannot be"
	line "outmatched!"

	para "You seem like a"
	line "traveler just"
	para "like me, just"
	line "bursting with"
	cont "courage!"

	para "It feels like you"
	line "can love this TM"
	cont "just like I do!"
	sdone

.after_TM_text
	ctxt "TM62 is Sky"
	line "Attack!"

	para "It takes one turn"
	line "to charge, but"
	para "afterwards, it"
	line "deals a very"
	para "devastating blow"
	line "to your foe!"
	done

MersonBirdHouseSwellow:
	faceplayer
	opentext
	writetext .text
	cry SWELLOW
	endtext

.text
	ctxt "Swellow: Kaw!"
	done

MersonBirdHouseXatu:
	faceplayer
	opentext
	writetext .text
	cry XATU
	endtext

.text
	ctxt "Xatu: tu!!!"
	done

MersonBirdHousePidgeot:
	faceplayer
	opentext
	writetext .text
	cry PIDGEOT
	endtext

.text
	ctxt "Pidgeot: Ott ot!"
	done

MersonBirdHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 5, MERSON_CITY
	warp_def $7, $3, 5, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_SWELLOW, 7, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MersonBirdHouseSwellow, -1
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MersonBirdHouseDude, -1
	person_event SPRITE_XATU, 2, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MersonBirdHouseXatu, -1
	person_event SPRITE_PIDGEOT, 4, 0, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MersonBirdHousePidgeot, -1
