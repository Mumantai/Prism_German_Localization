DreamSequence_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_OBJECTS, .FixSelfImageSprite

.FixSelfImageSprite
	scriptstartasm
	ld a, [wPlayerCharacteristics]
	and $f
	add LOW(PlayerSprites)
	ld l, a
	adc HIGH(PlayerSprites)
	sub l
	ld h, a
	ld a, [hl]
	ld [wMap3ObjectSprite], a
	scriptstopasm
	return

DreamSequenceNPC1:
	ctxt "Ich bins, Mama."
	para "Wo bist du?"
	para "Ich vermisse dich!"
	line "Bitte komm zurück!"
	para "Du bist alles, was"
	line "ich habe!"
	done

DreamSequenceNPC2:
	ctxt "Verlierer und"
	line "Verräter."
	para "Dafür ist deine"
	line "Familie bekannt <...>"
	done

DreamSequenceNPC3:
	faceplayer
	showtext .text
	warp DREAM_NEW_BARK, 23, 5
	jumptext .after_warp_text

.after_warp_text
	ctxt "Fiktion oder"
	line "Realität?"
	done

.text
	ctxt "Du bist nun in"
	line "Demenzia."
	para "Dies ist die"
	line "Traumdimension."
	para "Willst du aus"
	line "deinem Schlummer"
	cont "erwachen?"
	para "Dann musst du eine"
	line "große Erleuchtung"
	cont "erfahren."
	para "Ich weiß, wo deine"
	line "Antworten warten."
	para "Entspann dich und"
	line "lass dich von"
	para "deinen Gedanken"
	line "treiben <...>"
	sdone

DreamSequence_MapEventHeader:: db 0, 0

.Warps
	db 0

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 3
	person_event SPRITE_BIRD, 19, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, DreamSequenceNPC1, -1
	person_event SPRITE_NURSE, 16, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, DreamSequenceNPC2, -1
	person_event SPRITE_P0, 25, 25, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_SCRIPT, 0, DreamSequenceNPC3, -1