HaywardEarthquakeLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HaywardEarthquakeLabNPC1:
	ctxt "When an earthquake"
	line "is about to hit,"
	para "we send a warning"
	line "to everybody so"
	para "they can get"
	line "somewhere safe."

	para "Unfortunately, we"
	line "can't detect them"
	para "as early as other"
	line "natural disasters."
	done

HaywardEarthquakeLabNPC2:
	start_asm
	ld a, [wOptions2]
	and 1 << 2
	ld de, .kilometers_text
	jr z, .selected
	ld de, .miles_text
.selected
	push bc
	call CopyName1
	pop bc
	ld hl, .text
	ret

.kilometers_text
	db "kilometers@"
.miles_text
	db "miles@"

.text
	ctxt "People buried some"
	line "strange orbs in"
	cont "Naljo."

	para "While buried, the"
	line "orbs' powers"
	para "flowed through the"
	line "plates for several"
	cont "<STRBF2>." ;selected unit of measurement

	para "But once they were"
	line "dug up, the plates"
	para "were suddenly"
	line "without their"
	cont "powers."

	para "This caused the"
	line "plates to shift,"
	para "which led to very"
	line "large earthquakes."

	para "The first orb was"
	line "found 5 years ago,"
	para "which triggered an"
	line "earthquake up in"
	cont "Johto."

	para "Goldenrod City was"
	line "destroyed, but I"
	para "hear they're almost"
	line "done rebuilding"
	cont "everything."
	done

HaywardEarthquakeLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 7, 2, 3, HAYWARD_CITY
	warp_def 7, 3, 3, HAYWARD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_SCIENTIST, 3, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardEarthquakeLabNPC1, -1
	person_event SPRITE_SCIENTIST, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardEarthquakeLabNPC2, -1
