AcaniaLighthouseF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaLighthouseF1NPC:
	ctxt "People are always"
	line "throwing stuff in"
	para "the fire at the"
	line "top of this tower."

	para "It's vital that"
	line "the light keeps"
	para "burning bright."
	line "Otherwise, ships"
	cont "will wreck here."

	para "If fuel is low,"
	line "people will just"
	cont "throw anything in!"

	para "Some weirdos from"
	line "the government"
	para "want to replace it"
	line "with an electronic"
	cont "light."

	para "Ha!"

	para "Newfangled techno"
	line "nonsense!"
	done

AcaniaLighthouseF1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $11, $8, 6, ACANIA_DOCKS
	warp_def $11, $9, 6, ACANIA_DOCKS
	warp_def $b, $9, 1, ACANIA_LIGHTHOUSE_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SAILOR, 11,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, AcaniaLighthouseF1NPC, -1
