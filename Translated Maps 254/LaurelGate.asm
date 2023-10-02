LaurelGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelGateGuard:
	ctxt "Als Grenzwart"
	line "verdient man gut."
	para "Was wir dafür tun?"
	para "Den ganzen Tag nur"
	line "rumstehen!"
	para "Ein Hoch auf den"
	line "Kapitalismus!"
	done

LaurelGateNPC1:
	ctxt "Sie bauen überall"
	line "diese Durchgangs-"
	cont "häuser auf <...>"
	done

LaurelGateNPC2:
	ctxt "Früher gab es hier"
	line "in Naljo keine"
	cont "Menschen."
	para "Die 'Wächter'"
	line "brachten nur jene"
	para "her, die ein"
	line "reines Herz"
	cont "besaßen."
	done

LaurelGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 1, ROUTE_75
	warp_def $5, $0, 2, ROUTE_75
	warp_def $4, $9, 12, LAUREL_CITY
	warp_def $5, $9, 1, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelGateGuard, -1
	person_event SPRITE_ROCKER, 6, 8, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, LaurelGateNPC1, -1
	person_event SPRITE_TEACHER, 1, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8 + PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, LaurelGateNPC2, -1