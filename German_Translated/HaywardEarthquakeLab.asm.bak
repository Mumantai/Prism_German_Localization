HaywardEarthquakeLab_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

HaywardEarthquakeLabNPC1:
	ctxt "Wenn sich ein "
	line "Erdbeben anbahnt, "
	para "senden wir eine "
	line "Warnung an alle, "
	para "damit sie sich in "
	line "Sicherheit bringen"
	cont "können."

	para "Leider können wir "
	line "es nicht so früh "
	para "erkennen wie "
	line "andere "
	cont "Naturkatastrophen."

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
	ctxt "In Naljo wurden "
	line "einige seltsame "
	cont "Kugeln vergraben."

	para "Unter der Erde "
	line "flossen die Kräfte"
	para "der Kugeln mehrere"
	line "<STRBF2> durch"
	cont "die Erd-Platten."

	para "Aber als sie "
	line "ausgegraben "
	para "wurden, verloren "
	line "die Platten "
	para "plötzlich ihre "
	line "Kräfte."

	para "Dies führte zu "
	line "einer Verschiebung"
	para "der Platten, was "
	line "sehr grosse "
	para "Erdbeben zur Folge"
	line "hatte."

	para "Die erste Kugel "
	line "wurde vor 5 Jahren"
	para "gefunden, was ein "
	line "Erdbeben oben in "
	cont "Johto auslöste."

	para "Dukatia City wurde"
	line "zerstört, aber wie"
	para "ich hörte, sind "
	line "sie mit dem "
	para "Wiederaufbau schon"
	line "fast fertig."

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
