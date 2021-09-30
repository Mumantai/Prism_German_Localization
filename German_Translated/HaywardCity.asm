HaywardCity_MapScriptHeader;trigger count
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
	ctxt "Paläoseismologie"
	next "Labor"

	done

HaywardCityIllegibleSign:
	ctxt "Dieses Schild ist "
	line "voller Graffiti."

	para "Es ist nicht mehr "
	line "lesbar."

	done

HaywardCityNPC1:
	ctxt "Ich kann dieses "
	line "Schild nicht "
	cont "lesen!"

	para "Das macht mich "
	line "wütend!"

	done

HaywardCityNPC2:
	ctxt "Diese Stadt hat "
	line "sich verändert."

	para "Ich fühle mich "
	line "nicht sicher, wenn"
	para "ich ohne #mon "
	line "durch die Stadt "
	cont "gehe."

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
	ctxt "Ach, Sie sind's."

	para "Ich denke gerade "
	line "über unsere "
	para "Geschichte des "
	line "Scheiterns nach."

	para "Wenn man bedenkt, "
	line "dass alles hier "
	para "begann, in dieser "
	line "Stadt<...> Bevor ich "
	para "kam, übernahm die "
	line "mächtige Rote "
	para "Patrouille das "
	line "Team Rocket, bis "
	para "ein Junge namens "
	line "Brown dem ein Ende"
	cont "setzte."

	para "Im letzten halben "
	line "Jahrzehnt hat er "
	para "versucht, die "
	line "Scherben "
	cont "aufzusammeln."

	para "Aber jetzt will "
	line "der Rest der "
	para "Paletten- "
	line "Patrouille nichts "
	para "mehr mit unseren "
	line "Ambitionen zu tun "
	cont "haben."

	para "Es liegt alles an "
	line "mir."

	para "Lass mich sehen, "
	line "ob du gut genug "
	para "bist, um "
	line "Ehrenpatrouille zu"
	cont "werden."

	para "Mein Team ist seit"
	line "dem letzten Mal "
	cont "gewachsen."

	done

.battle_won_text
	ctxt "Hey, du hast "
	line "meinen Respekt."

	done

.put_on_suit_text
	ctxt "Sieht gut aus!"

	para "Der Anzug sitzt!"

	line "Wenn du ihn "
	para "ausziehen möchten,"
	line "musst du den Salon"
	para "in Oxalia City "
	line "besuchen."

	para "Ich verstehe "
	line "jedoch nicht, "
	para "warum du das tun "
	line "solltest."

	done

.offer_suit_text
	ctxt "Jetzt, wo du "
	line "Ehrenmitglied der "
	para "Paletten "
	line "Patrouille bist<...> "
	para "Willst du unsere "
	line "Ausrüstung tragen?"

	para "Du siehst sicher "
	line "schick aus darin<...> "
	done

.declined_text
	ctxt "Kein Ding."

	para "Ich habe es hier, "
	line "falls du deine "
	para "Meinung ändern "
	line "solltest."

	done

.already_wearing_suit_text
	ctxt "Sieht gut aus!"

	para "Als würde ich in "
	line "den Spiegel "
	cont "schauen!"

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
	db 6
	signpost 15, 18, SIGNPOST_JUMPSTD, martsign
	signpost 25, 35, SIGNPOST_LOAD, HaywardCityLabSign
	signpost 19, 23, SIGNPOST_TEXT, HaywardCityIllegibleSign
	signpost 23, 28, SIGNPOST_JUMPSTD, pokecentersign
	signpost 22, 10, SIGNPOST_ITEM, HaywardCity_GoldToken
	signpost 11, 8, SIGNPOST_ITEM, HaywardCity_GoldEgg

.ObjectEvents
	db 4
	person_event SPRITE_LASS, 19, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardCityNPC1, -1
	person_event SPRITE_FISHER, 16, 32, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HaywardCityNPC2, -1
	person_event SPRITE_PALETTE_PATROLLER, 12, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, HaywardCity_PaletteBlue, -1
	person_event SPRITE_POKE_BALL, 8, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, KINGS_ROCK, EVENT_HAYWARD_CITY_ITEM_KINGS_ROCK
