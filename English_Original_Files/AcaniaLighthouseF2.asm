AcaniaLighthouseF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

AcaniaLighthouseF2OldMan:
	faceplayer
	opentext
	checkevent EVENT_GIVEN_HM03
	sif true
		jumptextfaceplayer .thanks_text
	writetext .give_HM_text
	givetm HM_SURF + RECEIVED_TM
	setevent EVENT_GIVEN_HM03
	jumptext .explain_HM_text

.thanks_text
	ctxt "I appreciate you"
	line "taking your time"
	para "to talk to an"
	line "old man who has"
	para "nothing but this"
	line "lighthouse left<...>"
	done

.give_HM_text
	ctxt "Hello, young one!"

	para "Nobu sent you?"

	para "<...>"

	para "Have I seen the"
	line "Naljo Guardian,"
	cont "Varaneous?"

	para "Yes, I have."

	para "I'm in charge of"
	line "this lighthouse,"
	cont "and I see all."

	para "Varaneous went"
	line "to Saxifrage,"
	para "the prison island"
	line "in the southeast."

	para "It looks like it's"
	line "going to awaken"
	para "Fambaco, who's been"
	line "sleeping there"
	cont "for centuries."

	para "Hmm<...> it looks"
	line "like you need help"
	cont "getting there."

	para "This HM should"
	line "be of assistance."
	sdone

.explain_HM_text
	ctxt "HM03 is Surf."

	para "It's a move that"
	line "lets #mon swim"
	cont "across the water."
	sdone

AcaniaLighthouseF2FireWithDisc:
	opentext
	writetext .askWater
	yesorno
	sif false
.exit
		closetextend
	checkpokemontype WATER
	anonjumptable
	dw .notWater
	dw .foundWater
	dw .exit

.askWater
	ctxt "The fire's keeping"
	line "the lighthouse"
	cont "bright."

	para "Better not mess"
	line "with it!"

	para "Wait a second<...>"

	para "There appears to"
	line "be something"
	cont "inside of this."

	para "Douse the fire"
	line "with a Water-type"
	cont "#mon or move?"
	done

.notWater
	jumptext .notWaterText
.notWaterText
	ctxt "This isn't a Water"
	line "#mon or move."
	done

.foundWater
	giveitem DUBIOUS_DISC, 1
	sif false
		jumptext .fullBagText
	writetext .doused
	disappear 3
	waitbutton
	setevent EVENT_ACANIA_LIGHTHOUSE_FIRE
	jumptext .gotDisc

.fullBagText
	ctxt "Free up some"
	line "space first."
	done

.doused
	ctxt "Doused the fire!"
	done

.gotDisc
	ctxt "Wow, it's a"
	line "Dubious Disc!"

	para "It must have been"
	line "pretty sturdy to"
	para "survive that"
	line "harsh fire<...>"

	para "There must be a"
	line "reason as to why"
	para "somebody tried to"
	line "burn this<...>"
	done

AcaniaLighthouseF2Fire:
	ctxt "The fire's keeping"
	line "the lighthouse"
	cont "bright."

	para "Better not mess"
	line "with it!"
	done

AcaniaLighthouseF2_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def 7, 9, 3, ACANIA_LIGHTHOUSE_F1

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_SAGE, 13, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AcaniaLighthouseF2OldMan, -1
	person_event SPRITE_FIRE, 6, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcaniaLighthouseF2FireWithDisc, EVENT_ACANIA_LIGHTHOUSE_FIRE
	person_event SPRITE_FIRE, 11, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 15, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 15, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 11, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 6, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 2, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
	person_event SPRITE_FIRE, 2, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_TEXT, 0, AcaniaLighthouseF2Fire, -1
