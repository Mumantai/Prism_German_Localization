SaxifrageMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SaxifrageMartNPC1:
	ctxt "My boyfriend was"
	line "thrown in jail"
	para "because he stole"
	line "a Potion when his"
	cont "#mon was hurt."

	para "<...>"

	para "Why didn't he just"
	line "get a job?"

	para "Well, the economy<...>"
	done

SaxifrageMartNPC2:
	ctxt "A mart! And in a"
	line "prison town!"

	para "Do the prisoners"
	line "get to shop here?"
	done

SaxifrageMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $6, 4, SAXIFRAGE_ISLAND
	warp_def $7, $7, 4, SAXIFRAGE_ISLAND

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_CLERK, 3, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_STANDARD, SAXIFRAGE_STANDARD_MART, -1
	person_event SPRITE_COOLTRAINER_F, 3, 2, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaxifrageMartNPC1, -1
	person_event SPRITE_GENTLEMAN, 6, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifrageMartNPC2, -1
