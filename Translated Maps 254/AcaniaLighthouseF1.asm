AcaniaLighthouseF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaLighthouseF1NPC:
	ctxt "Die leute werfen"
	line "immer sachen in"
	para "das Feuer auf der"
	line "Spitze diesen"
	cont "Turmes."
	para "Es ist wichtig,"
	line "dass das Feuer"
	para "hell leuchtet."
	line "Sonst würden die"
	para "Schiffe ihr Ziel"
	line "nicht finden."
	para "Die Kosten sind"
	line "auch gering, da"
	para "die Leute hier"
	line "einfach Ihren Müll"
	cont "entsorgen."
	para "Elektronisches"
	line "Licht wäre daher"
	cont "Unsinn! HA!"
	para "Neumodischer"
	line "Technik-Quatsch!"
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