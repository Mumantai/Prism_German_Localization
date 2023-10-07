Route69NorthGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route69NorthGateGuard:
	ctxt "Why is there even"
	line "a gate out here?"

	para "Seems kind of"
	line "arbitrary to me."

	para "What am I supposed"
	line "to be guarding?"

	para "We're in the middle"
	line "of nowhere."

	para "The docks in the"
	line "north are clearly"
	para "abandoned, and the"
	line "route to the south"
	para "is in such a bad"
	line "state."

	para "Why am I here?"

	para "Why is anyone"
	line "here?"

	para "<...>"

	para "That's the last"
	line "time I have an"
	para "argument with my"
	line "supervisor<...>"
	done

Route69NorthGate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 0, 4, 1, ROUTE_69_NORTH
	warp_def 0, 5, 2, ROUTE_69_NORTH
	warp_def 7, 4, 5, ROUTE_69_SOUTH
	warp_def 7, 5, 5, ROUTE_69_SOUTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER,  3,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Route69NorthGateGuard, -1
