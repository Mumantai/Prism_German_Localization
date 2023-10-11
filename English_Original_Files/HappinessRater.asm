HappinessRater_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HappinessRater_GoldToken:
	dw EVENT_HAPPINESS_RATER_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

HappinessRaterNPC:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext .rating_text
	divideby 50
	anonjumptable
	dw .low_tier
	dw .D_tier
	dw .C_tier
	dw .B_tier
	dw .A_tier
	dw .S_tier

.S_tier
	writetext .S_tier_text
	checkevent EVENT_GOT_TM27
	sif false, then
		writetext .give_return_text
		givetm TM_RETURN + RECEIVED_TM
		setevent EVENT_GOT_TM27
	sendif
	closetextend

.A_tier
	jumptext .A_tier_text

.B_tier
	jumptext .B_tier_text

.C_tier
	jumptext .C_tier_text

.D_tier
	jumptext .D_tier_text

.low_tier
	checkevent EVENT_GOT_TM21
	sif false, then
		writetext .give_frustration_text
		givetm TM_FRUSTRATION + RECEIVED_TM
		setevent EVENT_GOT_TM21
	sendif
	closetextend

.rating_text
	ctxt "Hello, I am the"
	line "happiness rater."

	para "I can score your"
	line "#mon's happiness"
	cont "in an instant!"

	para "Can I see your"
	line "<STRBF3> for"
	cont "just a moment."
	cont "Please?"

	para "Hmm<...>"

	para "Your <STRBF3>"
	line "scored @"
	deciram hScriptVar, 1, 0
	text "/255."
	prompt

.S_tier_text
	ctxt "Grade: S!"

	para "This #mon"
	line "definitely loves"
	cont "you!"
	sdone

.A_tier_text
	ctxt "Grade: A"

	para "Your #mon"
	line "likes you a lot!"
	done

.B_tier_text
	ctxt "Grade: B"

	para "This #mon"
	line "looks happy."
	done

.C_tier_text
	ctxt "Grade: C"

	para "Your #mon"
	line "doesn't care much"
	para "about you either"
	line "way."
	done

.D_tier_text
	ctxt "Grade: D"

	para "Seems your #mon"
	line "isn't used to you"
	cont "yet."
	done

.give_return_text
	ctxt "Go ahead and take"
	line "this TM, you"
	cont "deserve it!"
	sdone

.give_frustration_text
	ctxt "If you take this"
	line "TM, will you get"
	cont "out of here?"
	sdone

HappinessRater_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $5, $2, 3, OXALIS_CITY
	warp_def $5, $3, 3, OXALIS_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 4, 0, SIGNPOST_ITEM, HappinessRater_GoldToken

.ObjectEvents
	db 1
	person_event SPRITE_TEACHER, 1, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HappinessRaterNPC, -1
