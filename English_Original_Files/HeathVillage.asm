HeathVillage_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_HEATH_VILLAGE
	return

HeathVillageForestSign:
	ctxt "Rinji's Forest"
	done

HeathVillageRestHouseSign:
	ctxt "Rest house"
	done

HeathVillageVillageSign:
	ctxt "Holds rich"
	next "traditions"
	done

HeathVillageNPC1:
	ctxt "I can climb any"
	line "mountain in Naljo!"

	para "Maybe someday I"
	line "will be able to"
	para "climb other famed"
	line "mountains."
	done

HeathVillageNPC2:
	ctxt "Inside is a small"
	line "shrine dedicated"
	para "to the Guardians"
	line "of Naljo."

	para "Residents visit"
	line "daily in hopes"
	para "that they will"
	line "awaken and watch"
	cont "over us once more."
	done

HeathVillageNPC3:
	ctxt "I'm going to be a"
	line "Grass-type user,"
	cont "just like Rinji."

	para "Rinji loves"
	line "everything about"
	para "nature, and he's"
	line "livid about the"
	para "changes that are"
	line "happening to our"
	cont "dear region."
	done

HeathVillageNPC4:
	ctxt "I enjoy the vill-"
	line "age traditions."

	para "It's a nice change"
	line "of pace from the"
	para "modernization that"
	line "plagues society."
	done

HeathVillageBicycleNPC:
	faceplayer
	checkevent EVENT_GOT_BICYCLE
	sif true
		jumptext .already_gave_bicycle_text
	opentext
	writetext .introduction_text
	callasm .CheckStepCounter
	sif false
		jumptext .not_enough_steps_text
	writetext .give_bicycle_text
	verbosegiveitem BICYCLE, 1
	setevent EVENT_GOT_BICYCLE
	endtext

.CheckStepCounter
	xor a
	ldh [hScriptVar], a
	ld hl, wGlobalStepCounter + 3
	ld a, [hld]
	or [hl]
	jr nz, .enoughSteps
	dec hl
	ld a, [hld]
	cp HIGH(10000)
	ret c
	jr nz, .enoughSteps
.checkLower
	ld a, [hl]
	cp LOW(10000)
	ret c
.enoughSteps
	ld a, $1
	ldh [hScriptVar], a
	ret

.introduction_text
	ctxt "People these days"
	line "don't appreciate"
	cont "their legs enough."
	prompt

.not_enough_steps_text
	ctxt "Hmm<...> your shoes"
	line "aren't worn in"
	cont "enough."

	para "Come back once"
	line "you've shown an"

	para "appreciation for"
	line "the power of"
	cont "walking."
	done

.give_bicycle_text
	ctxt "I can tell by your"
	line "shoes that you've"
	cont "taken many steps."

	para "It's nice knowing"
	line "people that still"
	cont "use their feet."

	para "As a token of"
	line "gratitude, you can"
	cont "have this Bicycle!"
	sdone

.already_gave_bicycle_text
	ctxt "Having fun with"
	line "your bicycle?"

	para "It's astounding how"
	line "many things your"
	cont "legs can do!"
	done

HeathVillage_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def 19, 32, 4, HEATH_GYM_GATE
	warp_def 18, 32, 3, HEATH_GYM_GATE
	warp_def 1, 3, 1, HEATH_HOUSE_TM30
	warp_def 21, 11, 1, HEATH_HOUSE_TM35
	warp_def 9, 17, 1, HEATH_INN
	warp_def 25, 19, 1, HEATH_HOUSE_WEAVER
	warp_def 10, 33, 1, HEATH_GATE
	warp_def 11, 33, 2, HEATH_GATE

.CoordEvents
	db 0

.BGEvents
	db 3
	signpost 16, 32, SIGNPOST_LOAD, HeathVillageForestSign
	signpost 11, 15, SIGNPOST_LOAD, HeathVillageRestHouseSign
	signpost 23, 13, SIGNPOST_LOAD, HeathVillageVillageSign

.ObjectEvents
	db 5
	person_event SPRITE_BLACK_BELT, 12, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 8, PERSONTYPE_TEXTFP, 0, HeathVillageNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 26, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HeathVillageNPC2, -1
	person_event SPRITE_YOUNGSTER, 14, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathVillageNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 31, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8, PERSONTYPE_TEXTFP, 0, HeathVillageNPC4, -1
	person_event SPRITE_BLACK_BELT, 24, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HeathVillageBicycleNPC, -1
