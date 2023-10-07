HeathGymGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGymGateNPC:
	ctxt "Ages ago, this"
	line "region was watched"
	para "over by the so-"
	line "called Guardians."

	para "Only descendants"
	line "of The Messenger"
	para "would be able to"
	line "tame them."

	para "The only known"
	line "descendant is a"
	cont "strong Trainer."

	para "He moved away a"
	line "long time ago,"
	para "along with his"
	line "family."
	done

HeathGymGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $9, $d, 1, HEATH_GYM
	warp_def $9, $e, 1, HEATH_GYM
	warp_def $6, $13, 2, HEATH_VILLAGE
	warp_def $7, $13, 1, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_KIMONO_GIRL, 5, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathGymGateNPC, -1
