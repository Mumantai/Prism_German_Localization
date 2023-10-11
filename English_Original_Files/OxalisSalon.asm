OxalisSalon_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OxalisSalonStylistScript:
	opentext
	special PlaceMoneyTopRight
	writetext .introduction_text
	yesorno
	iffalse .no
	checkmoney 0, 1000
	sif =, 2
		jumptext .no_money_text
	waitsfx
	playsound SFX_TRANSACTION
	takemoney 0, 1000
	special PlaceMoneyTopRight
	writetext .said_yes_text
	closetext
	refreshscreen
	callasm OxalisSalonCustomization
	anonjumptable
	dw .giveBackMoney
	dw .done
	dw .didNotChange

.giveBackMoney
	givemoney 0, 1000
.no
	jumptext .said_no_text

.done
	jumptext .done_text

.didNotChange
	givemoney 0, 1000
	jumptext .no_change_text

.introduction_text
	ctxt "Hi there, sweetie!"

	para "Unhappy with the"
	line "way you look?"

	para "Your worries will"
	line "be over once I"
	para "give you a stylish"
	line "makeover!"

	para "It's only ¥1000!"
	done

.said_yes_text
	ctxt "Wonderful!"

	para "Let's get started!"
	sdone

.said_no_text
	ctxt "That's a big"
	line "disappointment."

	para "Please reconsider"
	line "in the future."
	done

.no_money_text
	ctxt "You can't pay with"
	line "piggy bank scraps."

	para "Come back when you"
	line "have enough."
	done

.done_text
	ctxt "There we go!"

	para "You look a lot"
	line "better now!"

	para "Come again!"
	done

.no_change_text
	ctxt "What? You didn't"
	line "change your look"
	cont "at all!"

	para "In that case, I'll"
	line "give you a refund."

	para "Come back when you"
	line "want a different"
	cont "look."
	done

OxalisSalonNPC1:
	ctxt "That lady is a"
	line "true genius!"

	para "You should see my"
	line "before picture!"
	done

OxalisSalonNPC2:
	ctxt "Try not to look"
	line "too different!"

	para "One time I got a"
	line "makeover, and my"
	para "#mon didn't even"
	line "recognize me!"
	done

OxalisSalonNPC3:
	ctxt "Hair like this"
	line "takes some proper"
	cont "time and care."

	para "Thus, I come here"
	line "all the time!"
	done

OxalisSalon_MapEventHeader: ;filler
	db 0, 0

;warps
	db 2
	warp_def $9, $6, 1, OXALIS_CITY
	warp_def $9, $7, 1, OXALIS_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 4
	person_event SPRITE_TEACHER, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, OxalisSalonStylistScript, -1
	person_event SPRITE_BUENA, 5, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC1, -1
	person_event SPRITE_POKEFAN_F, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC2, -1
	person_event SPRITE_ROCKER, 6, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, OxalisSalonNPC3, -1
