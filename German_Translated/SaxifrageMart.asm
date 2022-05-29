SaxifrageMart_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SaxifrageMartNPC1:
	ctxt "Mein Freund ist im"
	line "Gefängnis, weil er"
	para "einen Trank"
	line "geklaut hat, weil"
	para "seine #mon"
	line "verwundet waren."
	

	para "<...>"

	para "Wieso er nicht in"
	line "ein #mon-Center"
	cont "gegangen ist?"

	para "Bist du nun der"
	line "Staatsanwalt oder"
	cont "was? <...>"
	done

SaxifrageMartNPC2:
	ctxt "Ein Markt auf ner"
	line "Gefängnis-Insel!"

	para "Shopping für die"
	line "Insassen oder was?"
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
