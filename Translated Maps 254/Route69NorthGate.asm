Route69NorthGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route69NorthGateGuard:
	ctxt "Warum gibt es hier"
	line "überhaupt ein Tor?"
	para "Ziemlich"
	line "willkürlich."
	para "Was soll ich hier"
	line "überhaupt"
	cont "bewachen?"
	para "Wir sind mitten im"
	line "Nirgendwo."
	para "Der Hafen im"
	line "Norden ist"
	para "verlassen, und die"
	line "Route nach Süden"
	para "ist in einem"
	line "schlechten"
	cont "Zustand."
	para "Was mache ich"
	line "hier?"
	para "Warum ist hier"
	line "überhaupt jemand?"
	para "<...>"
	para "Das ist das letzte"
	line "Mal, dass ich mit"
	para "meinem"
	line "Vorgesetzten"
	cont "streite <...>"
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