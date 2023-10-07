HaywardCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_HAYWARD_CITY
	return

HaywardCity_GoldToken:
	dw EVENT_HAYWARD_CITY_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

HaywardCity_GoldEgg:
	dw EVENT_HIDDEN_GOLD_EGG
	db GOLD_EGG

HaywardCityLabSign:
	ctxt "Paleoseismology"
	next "lab."
	done

HaywardCityIllegibleSign:
	ctxt "This sign is full"
	line "of graffiti."

	para "It isn't readable"
	line "anymore."
	done

HaywardCityMagnetTrainSign:
	signpostheader 8
	done

HaywardCityNPC1:
	ctxt "I can't read that"
	line "sign! I'm so mad!"
	done

HaywardCityNPC2:
	ctxt "This city sure has"
	line "changed."

	para "I don't feel safe"
	line "walking around"
	para "town without a"
	line "#mon to protect"
	cont "me."
	done

HaywardCity_PaletteBlue:
	trainer EVENT_HAYWARD_CITY_TRAINER_1, PATROLLER, 19, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	callasm .check_wearing_suit
	sif true
		jumptext .already_wearing_suit_text
	opentext
	writetext .offer_suit_text
	yesorno
	sif false
		jumptext .declined_text
	callasm .give_suit
	jumptext .put_on_suit_text

.check_wearing_suit
	ld a, [wPlayerGender]
	and $e
	cp $c
	sbc a
	inc a
	ldh [hScriptVar], a
	ret

.give_suit
	ld a, [wPlayerGender]
	and $f1
	add $c
	ld [wPlayerGender], a
	jp ReplaceKrisSprite

.before_battle_text
	ctxt "Oh, it's you."

	para "I'm just reflecting"
	line "on our history of"
	cont "failure."

	para "To think it all"
	line "started here, in"
	cont "this city<...>"

	para "Before I came"
	line "along, the mighty"
	para "Red Patroller took"
	line "over Team Rocket,"
	para "until some kid"
	line "named Brown put a"
	cont "stop to that."

	para "For the last half"
	line "decade, he's been"
	para "trying to pick up"
	line "the pieces."

	para "But now, the rest"
	line "of the Palette"
	para "Patrollers want"
	line "nothing to do with"
	para "our ambitions, I"
	line "guess. It's all up"
	cont "to me."

	para "Let me see if"
	line "you're good enough"
	para "to become an hono-"
	line "rary patroller."

	para "My team has grown"
	line "since last time."
	done

.battle_won_text
	ctxt "Hey now, you have"
	line "my respect."
	done

.put_on_suit_text
	ctxt "Lookin' good!"

	para "The suit's on"
	line "tight, so if you"
	para "want to take it"
	line "off, you'll have to"
	para "visit the salon in"
	line "Oxalis City."

	para "However, I don't"
	line "see why you'd want"
	cont "to take it off!"
	done

.offer_suit_text
	ctxt "Now that you're an"
	line "Honorary Palette"
	cont "Patroller<...>"

	para "Would you like to"
	line "wear our gear?"

	para "You'll certainly"
	line "look spiffy in the"
	cont "span--"

	para "I mean, garb."

	para "Interested?"
	done

.declined_text
	ctxt "No big deal."

	para "I'll keep it handy"
	line "in case you change"
	cont "your mind later."
	done

.already_wearing_suit_text
	ctxt "Lookin' good!"

	para "It's like looking"
	line "into a mirror!"
	done

HaywardCity_MapEventHeader:: db 0, 0

.Warps
	db 9
	warp_def $f, $d, 1, HAYWARD_MART_F1
	warp_def $f, $10, 5, HAYWARD_MART_F1
	warp_def $17, $20, 1, HAYWARD_EARTHQUAKE_LAB
	warp_def $d, $1d, 1, HAYWARD_MAWILE
	warp_def $21, $10, 1, ROUTE_52_GATE
	warp_def $17, $1b, 1, HAYWARD_POKECENTER
	warp_def $b, $4, 1, RIJON_HIDDEN_BASEMENT
	warp_def $d, $1, 1, HAYWARD_HOUSE
	warp_def $21, $11, 1, ROUTE_52_GATE

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 25, 35, SIGNPOST_LOAD, HaywardCityLabSign
	signpost 19, 23, SIGNPOST_TEXT, HaywardCityIllegibleSign
	signpost 22, 10, SIGNPOST_ITEM, HaywardCity_GoldToken
	signpost 11, 8, SIGNPOST_ITEM, HaywardCity_GoldEgg
	signpost  8, 21, SIGNPOST_LOAD, HaywardCityMagnetTrainSign

.ObjectEvents
	db 4
	person_event SPRITE_LASS, 19, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardCityNPC1, -1
	person_event SPRITE_FISHER, 16, 32, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardCityNPC2, -1
	person_event SPRITE_PALETTE_PATROLLER, 12, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, HaywardCity_PaletteBlue, -1
	person_event SPRITE_POKE_BALL,  9, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, KINGS_ROCK, EVENT_HAYWARD_CITY_ITEM_KINGS_ROCK
