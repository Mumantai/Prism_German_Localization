HauntedForest_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
 	db 1
	dbw MAPCALLBACK_NEWMAP, .reset_var

.reset_var
	seteventvar EVAR_TEMP, 0
	return

HauntedForest_Trainer_1:
	trainer EVENT_HAUNTED_FOREST_TRAINER_1, SAGE, 2, .before_battle_text, .battle_won_text

	ctxt "A jug fills drop"
	line "by drop."
	done

.before_battle_text
	ctxt "An insincere and"
	line "evil friend is"
	para "more to be feared"
	line "than a wild beast."

	para "A wild beast may"
	line "wound your body,"

	para "but an evil friend"
	line "- he will wound"
	cont "your very mind."
	done

.battle_won_text
	ctxt "Ambition is like"
	line "love, impatient"
	para "both of delays"
	line "and rivals."
	done

HauntedForest_Trainer_2:
	trainer EVENT_HAUNTED_FOREST_TRAINER_2, SAGE, 1, .before_battle_text, .battle_won_text

	ctxt "Hatred does not"
	line "cease by hatred,"
	cont "but only by love."

	para "This is the true"
	line "eternal rule."
	done

.before_battle_text
	ctxt "For those who live"
	line "wisely in life,"
	para "even death itself"
	line "isn't to be feared."
	done

.battle_won_text
	ctxt "He is able who"
	line "thinks he is able."
	done

HauntedForest_Trainer_3:
	trainer EVENT_HAUNTED_FOREST_TRAINER_3, MEDIUM, 1, .before_battle_text, .battle_won_text

	ctxt "Better than a"
	line "thousand hollow"
	para "words, is one word"
	line "that brings peace."
	done

.before_battle_text
	ctxt "Believe nothing,"
	line "no matter where"
	para "you read it, or"
	line "who said it, no"
	para "matter if I have"
	line "said it - unless"
	para "it agrees with"
	line "your own reason"
	para "and your own"
	line "common sense."
	done

.battle_won_text
	ctxt "Have compassion"
	line "for all beings,"
	para "rich and poor"
	line "alike. Each has"
	cont "their suffering."

	para "Some suffer too"
	line "much, others far"
	cont "too little."
	done

HauntedForestRedGravestone:
	writehalfword HauntedForestRedGravestoneText
	switch 0
HauntedForestGreyGravestone:
	writehalfword HauntedForestGreyGravestoneText
	switch 1
HauntedForestBlueGravestone:
	writehalfword HauntedForestBlueGravestoneText
	switch 2
HauntedForestYellowGravestone:
	writehalfword HauntedForestYellowGravestoneText
	switch 3
HauntedForestBrownGravestone:
	writehalfword HauntedForestBrownGravestoneText
	switch 4
HauntedForestTealGravestone:
	writehalfword HauntedForestTealGravestoneText
	writebyte 5
	sendif

	pushvar
	opentext
	writetext -1
	checkevent EVENT_HAUNTED_MANSION_KEY
	sif false, then
		writetext .touch_it_text
		yesorno
		sif true, then
			pullvar
			compareeventvar EVAR_TEMP
			sif true, then
				waitsfx
				playsound SFX_WRONG
				writetext .wrong_text
				waitsfx
				seteventvar EVAR_TEMP, 0
			selse
				pullvar
				addvar 1
				writeeventvar EVAR_TEMP
				sif =, 6, then
					writetext .got_key_text
					verbosegiveitem MANSION_KEY, 1
					waitbutton
					setevent EVENT_HAUNTED_MANSION_KEY
				selse
					waitsfx
					playsound SFX_GLASS_TING
					writetext .right_text
					waitsfx
				sendif
			sendif
		sendif
	sendif
	popvar
	closetextend

.touch_it_text
	ctxt "Touch it?"
	done

.right_text
	ctxt "That sound is"
	line "reassuring!"
	sdone

.wrong_text
	ctxt "That doesn't sound"
	line "right."
	sdone

.got_key_text
	ctxt "A hand reaches out"
	line "of the ground and"
	cont "hands you a key!"
	sdone

HauntedForestRedGravestoneText:
	ctxt "It's a red"
	line "gravestone."
	sdone

HauntedForestGreyGravestoneText:
	ctxt "It's a grey"
	line "gravestone."
	sdone

HauntedForestBlueGravestoneText:
	ctxt "It's a blue"
	line "gravestone."
	sdone

HauntedForestYellowGravestoneText:
	ctxt "It's a yellow"
	line "gravestone."
	sdone

HauntedForestBrownGravestoneText:
	ctxt "It's a brown"
	line "gravestone."
	sdone

HauntedForestTealGravestoneText:
	ctxt "It's a teal"
	line "gravestone."
	sdone

HauntedForest_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $26, $d, 1, HAUNTED_FOREST_GATE
	warp_def $27, $d, 2, HAUNTED_FOREST_GATE
	warp_def $5, $6, 1, HAUNTED_MANSION

.CoordEvents
	db 0

.BGEvents
	db 6
	signpost $14, $06, SIGNPOST_READ, HauntedForestRedGravestone
	signpost $02, $21, SIGNPOST_READ, HauntedForestTealGravestone
	signpost $06, $26, SIGNPOST_READ, HauntedForestGreyGravestone
	signpost $06, $09, SIGNPOST_READ, HauntedForestYellowGravestone
	signpost $16, $23, SIGNPOST_READ, HauntedForestBrownGravestone
	signpost $18, $25, SIGNPOST_READ, HauntedForestBlueGravestone

.ObjectEvents
	db 5
	person_event SPRITE_POKE_BALL, 38, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_NIGHT_SHADE, 0, EVENT_GOT_TM05
	person_event SPRITE_POKE_BALL, 19, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, STARDUST, EVENT_HAUNTED_FOREST_ITEM_STARDUST
	person_event SPRITE_SAGE, 11, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_1, -1
	person_event SPRITE_SAGE, 29, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_2, -1
	person_event SPRITE_GRANNY, 10, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, HauntedForest_Trainer_3, -1
