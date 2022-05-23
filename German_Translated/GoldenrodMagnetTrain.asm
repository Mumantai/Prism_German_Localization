GoldenrodMagnetTrain_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodMagnetTrainEmployee:
	checkitem MAGNET_PASS
	sif false
		jumptext .no_pass_text
	farjump MagnetTrainScript

.no_pass_text
	ctxt "Hallo."

	para "Leider kannst du"
	line "diese Station ohne"
	para "einen Fahrschein"
	line "nicht benutzen."

	para "Komm wieder, wenn"
	line "du einen hast."

	done

GoldenrodMagnetTrainPresident:
	ctxt "Ich bin der"
	line "Präsident dieser"
	cont "Bahngesellschaft."

	para "Dieser Zug ist"
	line "schneller als"
	para "jedes #mon und"
	line "bringt Sie"
	para "blitzschnell nach"
	line "Rijon oder Naljo!"

	para "Wenn Sie einen"
	line "Sonderausweis"
	para "haben, kann er Sie"
	line "auch nach Kanto"
	cont "bringen."

	para "Wir planen, in"
	line "Zukunft auch in"
	para "andere Regionen zu"
	line "expandieren."

	done

GoldenrodMagnetTrain_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $8, 5, GOLDENROD_CITY
	warp_def $11, $9, 5, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodMagnetTrainEmployee, -1
	person_event SPRITE_GENTLEMAN, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodMagnetTrainPresident, -1
