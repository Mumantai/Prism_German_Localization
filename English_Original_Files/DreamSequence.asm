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
	ctxt "It's Mom!"

	para "Where are you?"

	para "I miss you, please"
	line "come home!"

	para "You're all I have!"
	done

DreamSequenceNPC2:
	ctxt "Forsake and"
	line "betrayal."

	para "That's all your"
	line "family is known"
	cont "for<...>"
	done

DreamSequenceNPC3:
	faceplayer
	showtext .text
	warp DREAM_NEW_BARK, 23, 5
	jumptext .after_warp_text

.after_warp_text
	ctxt "Fiction or"
	line "Non-fiction?"
	done

.text
	ctxt "You are now in"
	line "dementia."

	para "That is, the"
	line "dream dimension."

	para "You want to awaken"
	line "from your slumber?"

	para "To do that, you"
	line "must encounter a"
	cont "strong epiphany."

	para "I know where you"
	line "can find that."

	para "Relax and go"
	line "wherever your mind"
	cont "takes you<...>"
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
