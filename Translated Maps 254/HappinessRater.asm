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
	ctxt "Hallo, ich bewerte"
	line "die Zuneigung"
	cont "deiner #mon."
	para "Lass mich kurz"
	line "dein <STRBF3>"
	cont "sehen."
	para "Hmm <...>"
	para "Dein <STRBF3>"
	line "erreicht @"
	deciram hScriptVar, 1, 0
	text "/255."
	prompt

.S_tier_text
	ctxt "Rang: S!"
	para "Es sieht sehr"
	line "glücklich aus!"
	para "Es muss dich sehr"
	line "gern haben."
	sdone

.A_tier_text
	ctxt "Rang: A!"
	para "Ich habe den"
	line "Eindruck, dass es"
	para "dir wirklich"
	line "vertraut."
	done

.B_tier_text
	ctxt "Rang: B!"
	para "Es verhält sich"
	line "dir gegenüber sehr"
	para "freundlich."
	line "Es muss glücklich"
	cont "sein."
	done

.C_tier_text
	ctxt "Rang: C!"
	para "Es gewöhnt sich"
	line "langsam an dich."
	cont "Es glaubt an dich."
	done

.D_tier_text
	ctxt "Rang: D!"
	para "Du solltest es"
	line "besser behandeln."
	para "Es hat sich noch"
	line "nicht an dich"
	cont "gewöhnt."
	done

.give_return_text
	ctxt "Hier, nimm bitte"
	line "diese TM. Du hast"
	cont "sie dir verdient!"
	sdone

.give_frustration_text
	ctxt "Wenn ich dir diese"
	line "TM gebe, gehst du"
	para "dann bitte schnell"
	line "wieder weg?"
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