HeathVillage_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_HEATH_VILLAGE
	return

HeathVillageForestSign:
	ctxt "Rinjis Wald"
	done

HeathVillageRestHouseSign:
	ctxt "Gaststätte"
	done

HeathVillageVillageSign:
	ctxt "Reich an"
	next "Traditionen!"
	done

HeathVillageNPC1:
	ctxt "Ich kann jeden"
	line "Berg in Naljo"
	cont "erklimmen!"

	para "Vieleicht werde"
	line "ich noch andere"
	para "berühmte Berge"
	line "besteigen."
	done

HeathVillageNPC2:
	ctxt "Innen befindet"
	line "sich ein Schrein,"
	para "der den Wärchtern"
	line "von Naljo gewidmet"
	cont "ist."

	para "Einwohner kommen"
	line "täglich her mit"
	para "der Hoffnung, dass"
	line "sie eines Tages"
	cont "wieder erwachen."
	done

HeathVillageNPC3:
	ctxt "Ich werde ein"
	line "Pflanzen-#mon"
	para "Trainer, genau wie"
	line "Rinji auch!"

	para "Rinji liebt die"
	line "Natur und er ist"
	para "es leid, mit anzu-"
	line "sehen, was mit"
	para "unserer Region"
	line "passiert."
	done

HeathVillageNPC4:
	ctxt "Ich mag die"
	line "Dorftraditionen."

	para "Das ist eine nette"
	line "Abwechslung zu der"
	para "Modernisierung,"
	line "die unsere Gesell-"
	para "schaft bloß"
	line "vergiftet."
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
	cp 10000 >> 8
	ret c
	jr nz, .enoughSteps
.checkLower
	ld a, [hl]
	cp 10000 & $ff
	ret c
.enoughSteps
	ld a, $1
	ldh [hScriptVar], a
	ret

.introduction_text
	ctxt "Die Leute heut-"
	line "zutage schätzen"
	cont "ihre Beine nicht."
	prompt

.not_enough_steps_text
	ctxt "Hmm <...> deine Schuhe"
	line "sind ja gar nicht"
	cont "eingelaufen."

	para "Komm wieder, so-"
	line "bald du das Laufen"
	para "wertschätzen"
	line "gelernt hast."
	done

.give_bicycle_text
	ctxt "Ich sehe an deinen"
	line "Schuhen, dass du"
	cont "viele Schritte"
	cont "gelaufen bist."

	para "Gut zu wissen,"
	line "dass es noch Leute"
	para "gibt, die Ihre"
	line "Gesundheit zu"
	cont "schätzen wissen."

	para "Dafür kriegst du"
	line "dieses Fahrrad!"
	sdone

.already_gave_bicycle_text
	ctxt "Hast du Spaß an"
	line "deinem Fahrrad?"
  
	para "Schon wunderlich,"
	line "zu was Beine alles"
	cont "im Stande sind!"
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
	person_event SPRITE_COOLTRAINER_F, 26, 22, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, HeathVillageNPC2, -1
	person_event SPRITE_YOUNGSTER, 14, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathVillageNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 31, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 8, PERSONTYPE_TEXTFP, 0, HeathVillageNPC4, -1
	person_event SPRITE_BLACK_BELT, 24, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HeathVillageBicycleNPC, -1
