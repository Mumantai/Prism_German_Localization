LaurelGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelGymPrincessStatues:
	ctxt "Princess Brooklyn!"
	done

LaurelGymLeader:
	faceplayer
	checkevent EVENT_POKEONLY_TOTODILE
	sif false
		jumptext .totodile_missing_text
	checkevent EVENT_LAUREL_CITY_GOT_TOTODILE
	sif true
		jumptext .player_got_totodile_text
	checkflag ENGINE_CHARMBADGE
	sif true
		jumptext .after_badge_text
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	loadtrainer BROOKLYN, 1
	startbattle
	reloadmapafterbattle
	setflag ENGINE_CHARMBADGE
	opentext
	writetext .got_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	special RestartMapMusic
	writetext .after_battle_text
	givetm TM_ATTRACT + RECEIVED_TM
	setevent EVENT_MAN_BLOCKING_MAGIKARP_CAVERNS
	closetextend

.totodile_missing_text
	ctxt "HEY!"

	para "Who said you could"
	line "barge in here?"

	para "<...>"

	para "WHAT?"

	para "<``>Be nice?<''>"

	para "My baby is MISS-"
	line "ING, you creep!"

	para "<...>"

	para "Why, by baby I"
	line "mean my Totodile."

	para "I refuse to battle"
	line "anyone until my"
	cont "baby is returned."

	para "Want my badge?"

	para "Then you better"
	line "go look for my"
	cont "sweet Totodile."

	para "NOW!"
	done

.player_got_totodile_text
	ctxt "MY TOTODILE IS"
	line "GONE AGAIN!!!"

	para "<...>"

	para "What do you mean,"
	line "<``>you won't help"
	cont "me find it<''>?"

	para "GET OUT!"
	done

.after_badge_text
	ctxt "If you excuse me,"
	line "I need to put on"
	para "dresses for my"
	line "cute darling"
	cont "little Totodile!"
	done

.before_battle_text
	ctxt "Thank you for"
	line "finding my sweet"
	cont "little Totodile!"

	para "Later, I'm going"
	line "to put some makeup"
	para "on it and make it"
	line "look very pretty"
	para "and hold it all"
	line "day long!"

	para "Oh, right, you"
	line "want my badge?"

	para "Well, fine, let's"
	line "do this."

	para "I'm Brooklyn, and"
	line "I train Fairy-"
	cont "type #mon."

	para "They're just so"
	line "adorable that I"
	para "just can't resist"
	line "this type!"
	prompt

.battle_won_text
	ctxt "Alright, alright,"
	line "so you beat me."

	para "Fine, take this"
	line "gram of metal."
	done

.got_badge_text
	ctxt "<PLAYER> received"
	line "Charm Badge!"
	done

.after_battle_text
	ctxt "So, for some"
	line "reason, the Charm"
	para "Badge will let"
	line "your #mon use"
	para "Strength outside"
	line "of battle."

	para "Also, since I'm"
	line "such a little"
	para "angel, I'll let you"
	line "have this."
	sdone

LaurelGym_Trainer_1:
	trainer EVENT_LAUREL_GYM_TRAINER_1, CHEERLEADER, 2, .before_battle_text, .battle_won_text

	ctxt "Your reputation"
	line "here is done for!"
	done

.before_battle_text
	ctxt "A battle with me!"

	para "Lucky you!"
	done

.battle_won_text
	ctxt "You burned this"
	line "bridge forever."
	done

LaurelGym_Trainer_2:
	trainer EVENT_LAUREL_GYM_TRAINER_2, CHEERLEADER, 1, .before_battle_text, .battle_won_text

	ctxt "OK, like<...>"

	para "Totally, whatever."
	done

.before_battle_text
	ctxt "You're being rude"
	line "by coming in here"
	cont "unannounced."
	done

.battle_won_text
	ctxt "That's totally"
	line "disrespectful."
	done

LaurelGymGuide:
	faceplayer
	opentext
	checkevent EVENT_POKEONLY_TOTODILE
	sif false
		jumptext .initial_intro_text
	checkevent EVENT_LAUREL_CITY_GOT_TOTODILE
	sif true
		jumptext .player_got_totodile_text
	jumptext .after_saving_totodile_text

.after_saving_totodile_text
	ctxt "Thank goodness you"
	line "saved her"
	cont "Totodile."

	para "I was getting a"
	line "headache from her"
	para "whining, and this"
	line "job doesn't pay"
	cont "enough."
	done

.initial_intro_text
	ctxt "Hey there!"

	para "Brooklyn is the"
	line "Gym Leader here."

	para "She can be loud"
	line "and annoying when"
	para "she doesn't get her"
	line "way."

	para "<...>"

	para "Oh, so you need"
	line "Brooklyn's badge?"
	cont "Well, shoot<...>"

	para "She is having some"
	line "personal troubles"
	para "right now, and I"
	line "don't know much."

	para "All I can remember"
	line "is, some abduc-"
	para "tions have been"
	line "going on in this"
	para "town in the last"
	line "few months."

	para "One person cited"
	line "that one of the"
	para "kidnappers seemed"
	line "to be a scientist."

	para "Another said they"
	line "saw some shadowy"
	para "figure carry their"
	line "#mon away to"
	para "the forest, to the"
	line "south of town."

	para "You might want to"
	line "look there<...>"
	done

.player_got_totodile_text
	ctxt "Oh geeze, not"
	line "again<...>"
	done

LaurelGym_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $8, 8, LAUREL_CITY
	warp_def $11, $9, 8, LAUREL_CITY

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 3, 4, SIGNPOST_TEXT, LaurelGymPrincessStatues
	signpost 3, 13, SIGNPOST_TEXT, LaurelGymPrincessStatues

.ObjectEvents
	db 4
	person_event SPRITE_WHITNEY, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LaurelGymLeader, -1
	person_event SPRITE_CHEERLEADER, 6, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, LaurelGym_Trainer_1, -1
	person_event SPRITE_CHEERLEADER, 10, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, LaurelGym_Trainer_2, -1
	person_event SPRITE_GYM_GUY, 12, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LaurelGymGuide, -1
