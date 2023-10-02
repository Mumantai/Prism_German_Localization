AzaleaCharcoal_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AzaleaCharcoalNPC1:
	ctxt "Unsere Familie"
	line "produziert schon"
	cont "lange Holzkohle."
	para "Unser Porenta"
	line "fällt Bäume vom"
	para "Steineichenwald,"
	line "um uns zu helfen."
	para "Würde es uns nur"
	line "nicht immer wieder"
	cont "davonlaufen <...>."
	done

AzaleaCharcoalNPC2:
	ctxt "Dieser Erdrutsch"
	line "im Osten blockiert"
	para "allen Reisenden"
	line "den Weg."
	para "Ich hab damit aber"
	line "kein Problem."
	para "Ich klettere"
	line "einfach drüber!"
	done

AzaleaCharcoal_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 7, AZALEA_TOWN
	warp_def $7, $3, 7, AZALEA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_YOUNGSTER, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaCharcoalNPC1, -1
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaCharcoalNPC2, -1