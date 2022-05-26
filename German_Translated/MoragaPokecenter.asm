MoragaPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MoragaPokecenterNPC1:
	ctxt "Das Kraftwerk in"
	line "der Nähe wurde"
	cont "renoviert."

	para "Sie ließen sogar"
	line "die #Mon, die"
	cont "da waren, bleiben!"

	para "Ich habe da ein"
	line "Elektek gefangen!"

	done

MoragaPokecenterNPC2:
	ctxt "Du willst die"
	line "Orden von Rijon"
	cont "sammeln?"

	para "Da hast du aber"
	line "einen harten Weg"
	cont "vor dir."

	done

MoragaPokecenterNPC3:
	ctxt "Wenn ich jemals"
	line "eine Arena"
	para "eröffne, dann nur"
	line "für Jungs."

	para "Das wird alle"
	line "umhauen."

	done

MoragaPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 6, MORAGA_TOWN
	warp_def $7, $5, 6, MORAGA_TOWN
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC1, -1
	person_event SPRITE_FISHING_GURU, 5, 6, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC2, -1
	person_event SPRITE_GENTLEMAN, 4, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC3, -1
