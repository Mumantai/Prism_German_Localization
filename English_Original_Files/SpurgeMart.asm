SpurgeMart_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeMartATM:
	opentext
	special Special_SpurgeMartBank
	endtext

SpurgeMartNPC1:
	ctxt "Come look around,"
	line "I have games o'"
	cont "plenty here."

	para "If you see a game"
	line "you like, just let"
	cont "me know!"
	done

SpurgeMartNPC2:
	ctxt "Soda Pop isn't very"
	line "healthy, but it"
	para "costs less than"
	line "water."
	done

SpurgeMartNPC3:
	ctxt "Some very shady"
	line "guy all dressed in"
	para "red came by to buy"
	line "a meal."

	para "And when I say"
	line "red, I MEAN RED!"

	para "Helmet, jumpsuit."
	line "All of it red."

	para "He refused to take"
	line "the helmet off, so"
	para "he ordered his"
	line "food to go."
	done

SpurgeMartNPC4:
	ctxt "This food court"
	line "never fails to"
	para "fill my big belly"
	line "up real good."
	done

SpurgeMartNPC5:
	ctxt "My Snorlax loves"
	line "these burgers too."

	para "He can eat a lot"
	line "more than me."
	done

SpurgeMartNPC6:
	ctxt "I hear the milk"
	line "they sell here is"
	para "made in a small"
	line "farm in Johto."
	done

SpurgeMartNPC7:
	ctxt "I'm trying to get a"
	line "return on a game I"
	cont "bought for my son."

	para "Who is <``>Frigo<''>,"
	line "anyway? Seriously?"

	para "And #mon Quartz"
	line "had a lot of"
	cont "profanity in it!"

	para "It was rated E for"
	line "Everyone, too!"
	done

SpurgeMartNPC8:
	ctxt "I can't decide what"
	line "to buy!"
	done

SpurgeMart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $23, $14, 8, SPURGE_CITY
	warp_def $23, $15, 8, SPURGE_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 9, 10, SIGNPOST_RIGHT, SpurgeMartATM
	signpost 9, 11, SIGNPOST_LEFT, SpurgeMartATM

.ObjectEvents
	db 14
	person_event SPRITE_CLERK, 8, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_1, -1
	person_event SPRITE_CLERK, 19, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_2, -1
	person_event SPRITE_CLERK, 10, 35, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_3, -1
	person_event SPRITE_CLERK, 12, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_3, -1
	person_event SPRITE_CLERK, 30, 38, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_MART, 0, MART_STANDARD, SPURGE_STANDARD_MART_4, -1
	person_event SPRITE_CLERK, 24, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_MART, 0, MART_GOLDTOKEN, SPURGE_GOLD_TOKEN_MART, -1
	person_event SPRITE_CLERK, 28, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC1, -1
	person_event SPRITE_GENTLEMAN, 10, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC2, -1
	person_event SPRITE_R_GAMBLER, 15, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC3, -1
	person_event SPRITE_FISHER, 11, 33, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC4, -1
	person_event SPRITE_FISHER, 18, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC5, -1
	person_event SPRITE_R_JRTRAINERM, 18, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC6, -1
	person_event SPRITE_TEACHER, 26, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC7, -1
	person_event SPRITE_YOUNGSTER, 29, 19, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeMartNPC8, -1
