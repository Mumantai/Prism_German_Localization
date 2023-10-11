GoldenrodUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodUnderground_NoEntrySign:
	ctxt "NO ENTRY BEYOND"
	line "THIS POINT"
	done

GoldenrodUnderground_Trainer_1:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_1, SUPER_NERD, 6, .before_battle_text, .defeated_text

	ctxt "You're trying to"
	line "complete the Naljo"
	cont "Dex?"

	para "Wow, that's a very"
	line "ambitious goal!"
	done

.before_battle_text
	ctxt "I want to see your"
	line "rare #mon!"
	done

.defeated_text
	ctxt "No reason to get"
	line "mad!"
	done

GoldenrodUnderground_Trainer_2:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_2, OFFICER, 2, .before_battle_text, .defeated_text

	ctxt "Keep the battles"
	line "civilized, or else"
	para "I'll seal this"
	line "place off."

	para "You want that on"
	line "your conscience?"
	done

.before_battle_text
	ctxt "I don't recognize"
	line "you."

	para "I hope you're not"
	line "causing any"
	cont "trouble."
	done

.defeated_text
	ctxt "Ah, well."
	done

GoldenrodUnderground_Trainer_3:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_3, SUPER_NERD, 7, .before_battle_text, .defeated_text

	ctxt "You can play five"
	line "games at the Game"
	cont "Corner!"
	done

.before_battle_text
	ctxt "Have you been to"
	line "the new Game"
	cont "Corner?"
	done

.defeated_text
	ctxt "I only asked a"
	line "question!"
	done

GoldenrodUnderground_Trainer_4:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_4, POKEMANIAC, 4, .before_battle_text, .battle_won_text

	ctxt "Are you making a"
	line "#dex? Here's a"
	cont "hot tip."

	para "Try visiting other"
	line "regions via the"
	cont "Magnet Train."

	para "I hear Naljo is"
	line "chock-full of rare"
	cont "#mon!"
	done

.before_battle_text
	ctxt "I think you have"
	line "some rare #mon"
	cont "with you."

	para "Let me see them!"
	done

.battle_won_text
	ctxt "Gaah! I lost!"
	line "That makes me mad!"
	done

GoldenrodUnderground_Trainer_5:
	trainer EVENT_GOLDENROD_UNDERGROUND_TRAINER_5, BURGLAR, 4, .before_battle_text, .battle_won_text

	ctxt "This abandoned"
	line "spot has been my"
	cont "hideout for ages."

	para "Now some kids"
	line "start showing up"
	cont "to beat me?"

	para "Can't a guy get"
	line "some privacy?"
	done

.before_battle_text
	ctxt "!"

	para "Who<...>!?"
	done

.battle_won_text
	ctxt "Mercy!"
	line "Have it your way!"
	done

GoldenrodUnderground_YoungerHaircutBrother:
	opentext
	checkcode VAR_WEEKDAY
	isinsingulararray .workdays_array
	sif false
		jumptext GoldenrodUnderground_HaircutBrothers_NotTodayText
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	sif true
		jumptext .already_cut_hair_text
	special PlaceMoneyTopRight
	writetext .welcome_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 300
	sif =, 2
		jumptext .not_enough_money_text
	writetext .select_mon_text
	buttonsound
	special Special_YoungerHaircutBrother
	sif <, 2
		jumptext .declined_text
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	takemoney 0, 300
	special PlaceMoneyTopRight
	writetext .go_text
	closetext
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	opentext
	writetext .done_text
	jump GoldenrodUnderground_HaircutBrothers_Finish

.workdays_array
	db SUNDAY, WEDNESDAY, FRIDAY, -1

.welcome_text
	ctxt "Welcome to the"
	line "#mon Salon!"

	para "I'm the younger"
	line "and less expensive"
	cont "of the two Haircut"
	cont "Brothers."

	para "I'll spiff up your"
	line "#mon for just"
	cont "¥300."

	para "So? How about it?"
	done

.not_enough_money_text
	ctxt "Sorry, you need"
	line "more money."
	done

.select_mon_text
	ctxt "OK, which #mon"
	line "should I do?"
	done

.already_cut_hair_text
	ctxt "My shift's over for"
	line "the day."
	done

.declined_text
	ctxt "No?"
	line "How sad."
	done

.go_text
	ctxt "OK! I'll make it"
	line "look cool!"
	sdone

.done_text
	ctxt "There we go!"
	line "All done!"
	sdone

GoldenrodUnderground_OlderHaircutBrother:
	opentext
	checkcode VAR_WEEKDAY
	isinsingulararray GoldenrodUnderground_OlderHaircutBrother_Workdays
	sif false
		jumptext GoldenrodUnderground_HaircutBrothers_NotTodayText
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	sif true
		jumptext GoldenrodUnderground_OlderHaircutBrother_ShiftOverText
	special PlaceMoneyTopRight
	writetext GoldenrodUnderground_OlderHaircutBrother_WelcomeText
	yesorno
	sif false
		jumptext GoldenrodUnderground_OlderHaircutBrother_DeclinedText
	checkmoney 0, 500
	sif =, 2
		jumptext GoldenrodUnderground_OlderHaircutBrother_NeedMoreMoneyText
	writetext GoldenrodUnderground_OlderHaircutBrother_WhichMonText
	buttonsound
	special Special_YoungerHaircutBrother
	sif <, 2
		jumptext GoldenrodUnderground_OlderHaircutBrother_DeclinedText
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	takemoney 0, 500
	special PlaceMoneyTopRight
	writetext GoldenrodUnderground_OlderHaircutBrother_LetsGoText
	closetext
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	opentext
	writetext GoldenrodUnderground_OlderHaircutBrother_DoneText
GoldenrodUnderground_HaircutBrothers_Finish:
	sif =, 2
		writetext .little_happier
	selse
		sif =, 3
			writetext .happy
		selse
			writetext .delighted
		sendif
	sendif
	special PlayCurMonCry
	endtext

.little_happier
	text_from_ram wStringBuffer1
	ctxt " looks a"
	line "little happier."
	done

.happy
	text_from_ram wStringBuffer1
	ctxt " looks"
	line "happy."
	done

.delighted
	text_from_ram wStringBuffer1
	ctxt " looks"
	line "delighted!"
	done

GoldenrodUnderground_OlderHaircutBrother_Workdays:
	db TUESDAY, THURSDAY, SATURDAY, -1

GoldenrodUnderground_OlderHaircutBrother_WelcomeText:
	ctxt "Welcome!"

	para "I run the #mon"
	line "Salon!"

	para "I'm the older and"
	line "better of the two"
	cont "Haircut Brothers."

	para "I can make your"
	line "#mon beautiful"
	cont "for just ¥500."

	para "Would you like me"
	line "to do that?"
	done

GoldenrodUnderground_OlderHaircutBrother_NeedMoreMoneyText:
	ctxt "You'll need more"
	line "money than that."
	done

GoldenrodUnderground_OlderHaircutBrother_WhichMonText:
	ctxt "Which #mon"
	line "should I work on?"
	done

GoldenrodUnderground_OlderHaircutBrother_ShiftOverText:
	ctxt "I do only one"
	line "haircut a day."

	para "I'm done for today."
	done

GoldenrodUnderground_OlderHaircutBrother_DeclinedText:
	ctxt "Is that right?"
	line "That's a shame!"
	done

GoldenrodUnderground_OlderHaircutBrother_LetsGoText:
	ctxt "OK! Watch it"
	line "become beautiful!"
	sdone

GoldenrodUnderground_OlderHaircutBrother_DoneText:
	ctxt "There! All done!"
	sdone

GoldenrodUnderground_HaircutBrothers_NotTodayText:
	ctxt "I don't work today."
	done

GoldenrodUnderground_MapEventHeader:: db 0, 0

.Warps
	db 6
	warp_def $2, $1, 3, GOLDENROD_UNDERGROUND_ENTRY_A
	warp_def $22, $1, 3, GOLDENROD_UNDERGROUND_ENTRY_B
	warp_def $6, $12, 4, GOLDENROD_UNDERGROUND
	warp_def $23, $f, 3, GOLDENROD_UNDERGROUND
	warp_def $23, $10, 3, GOLDENROD_UNDERGROUND
	warp_def $1f, $10, 1, GOLDENROD_SWITCHES

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 6, 19, SIGNPOST_TEXT, GoldenrodUnderground_NoEntrySign

.ObjectEvents
	db 7
	person_event SPRITE_SUPER_NERD, 15, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodUnderground_YoungerHaircutBrother, -1
	person_event SPRITE_SUPER_NERD, 11, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodUnderground_OlderHaircutBrother, -1
	person_event SPRITE_SUPER_NERD, 29,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, GoldenrodUnderground_Trainer_1, -1
	person_event SPRITE_OFFICER, 23,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, GoldenrodUnderground_Trainer_2, -1
	person_event SPRITE_SUPER_NERD,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, GoldenrodUnderground_Trainer_3, -1
	person_event SPRITE_POKEMANIAC, 18,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, GoldenrodUnderground_Trainer_4, -1
	person_event SPRITE_BURGLAR, 33, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GoldenrodUnderground_Trainer_5, -1
