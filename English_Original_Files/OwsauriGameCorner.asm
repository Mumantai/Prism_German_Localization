OwsauriGameCorner_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

OwsauriGameCorner_GoldToken:
	dw EVENT_OWSAURI_GAME_CORNER_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

OwsauriGameCornerMonExchange:
	faceplayer
	opentext
	special Special_DisplayCoinCaseBalance
	writetext GameCorner_Text_ExchangeGameCoins
	writetext GameCornerMonExchange_Text_WhichMon
	menuanonjumptable .menu
	dw .done
	dw .sneasel
	dw .absol
	dw .spiritomb
.done
	farjump GameCorner_SaveYourCoinsComeAgain

.menu
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db $3
	db "Sneasel      2500@"
	db "Absol        5000@"
	db "Spiritomb    7500@"

.sneasel
	writebyte SNEASEL
	copyvartobyte wScriptTemp
	checkcoins 2500
	farscall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 2500
	end

.absol
	writebyte ABSOL
	copyvartobyte wScriptTemp
	checkcoins 5000
	farscall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 5000
	end

.spiritomb
	writebyte SPIRITOMB
	copyvartobyte wScriptTemp
	checkcoins 7500
	farscall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 7500
	end

GameCornerMonExchange_Text_WhichMon::
	ctxt "Which #mon"
	line "would you like?"
	done

OwsauriGameCornerTMExchange:
	faceplayer
	opentext
	special Special_DisplayCoinCaseBalance
	writetext GameCorner_Text_ExchangeGameCoins
	writetext GameCornerTMExchange_Text_WhichTM
	menuanonjumptable .menu
	dw .done
	dw .tm84
	dw .tm85
	dw .tm86
.done
	farjump GameCorner_SaveYourCoinsComeAgain

.menu
	db $40 ; flags
	db 03, 05 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db $3
	db "TM84    3000@"
	db "TM85    3000@"
	db "TM86    3000@"

.tm84
	writebyte 84
	jump OwsauriGameCorner_TMExchange_DoExchange

.tm85
	writebyte 85
	jump OwsauriGameCorner_TMExchange_DoExchange

.tm86
	writebyte 86
	; fallthrough

OwsauriGameCorner_TMExchange_DoExchange::
	scriptstartasm
	ldh a, [hScriptVar]
	ld [wTempNumber], a
	ld [wCurTMHM], a
	ld hl, wTMsHMs
	ld c, a
	dec c
	ld b, CHECK_FLAG
	call FlagAction
	ld hl, .got_TM
	ret nz
	callba GetTMHMMove
	call GetMoveName
	scriptstopasm
	writetext .this_TM_is_move_text
	yesorno
	sif false
		closetextend
	checkcoins 3000
	sif =, 2
		jumptext GameCorner_Text_NeedMoreCoins
	takecoins 3000
	writetext GameCorner_Text_HereYouGo
	copybytetovar wTempNumber
	givetm 0 + RECEIVED_TM
	closetextend

.got_TM
	jumptext .already_have_TM_text

.this_TM_is_move_text
	ctxt "This TM is"
	line "<STRBF1>!"

	para "Want it?"
	done

.already_have_TM_text
	ctxt "You already have"
	line "this TM!"
	done

GameCornerTMExchange_Text_WhichTM::
	ctxt "Which TM would"
	line "you like?"
	done

GameCorner_Text_ExchangeGameCoins::
	ctxt "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	sdone

GameCornerSlots::
	random 6
	sif >, 1
		writebyte 0
	refreshscreen 0
	special Special_SlotMachine
	closetextend

OwsauriCardFlip:
	random 6
	sif >, 1
		writebyte 0
	refreshscreen 0
	special Special_CardFlip
	closetextend

OwsauriBlackjack:
	farjump GameCornerBlackjack

OwsauriPoker:
	farjump GameCornerPoker

OwsauriMemoryGame:
	farjump GameCornerMemoryGame

OwsauriGameCornerNPC1:
	ctxt "I make a living"
	line "with this!"

	para "I found a guy"
	line "who'll exchange"
	para "coins for real"
	line "money."

	para "They'd kick me"
	line "out of here if"
	para "they knew I did"
	line "that though."
	done

OwsauriGameCornerNPC2:
	ctxt "A royal flush"
	line "will give you"
	cont "2500 coins."

	para "If you think you"
	line "have a shot at a"
	para "royal flush,"
	line "go for that no"
	cont "matter what."
	done

OwsauriGameCornerNPC3:
	ctxt "If you don't have"
	line "a Coin Case"
	para "already, get one"
	line "in Spurge City"
	cont "in Naljo."

	para "Some shady guy"
	line "sells them there."
	done

OwsauriGameCornerNPC4:
	ctxt "Watching the reels"
	line "close enough will"
	para "help you reach"
	line "your goal."
	done

OwsauriGameCornerNPC5:
	ctxt "These new card"
	line "games are so"
	cont "addicting!"

	para "It's absolutely"
	line "crazy!"
	done

OwsauriGameCornerNPC6:
	ctxt "Some people say"
	line "that different"
	para "game corners have"
	line "different odds,"
	para "but I don't believe"
	line "it."
	done

GameCorner_Text_HereYouGo::
	ctxt "Here you go!"
	sdone

GameCorner_Text_NeedMoreCoins::
	ctxt "Looks like you"
	line "need more coins"
	cont "for that."
	done

GameCorner_Text_NoRoomInParty::
	ctxt "Free up some"
	line "space in your"
	cont "party first!"
	done

OwsauriGameCorner_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $11, $2, 7, OWSAURI_CITY
	warp_def $11, $3, 7, OWSAURI_CITY

.CoordEvents
	db 0

.BGEvents
	db 48
	signpost 8, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 9, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 10, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 11, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 12, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 13, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 14, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 15, 1, SIGNPOST_READ, OwsauriMemoryGame
	signpost 8, 6, SIGNPOST_READ, GameCornerSlots
	signpost 9, 6, SIGNPOST_READ, GameCornerSlots
	signpost 10, 6, SIGNPOST_READ, GameCornerSlots
	signpost 11, 6, SIGNPOST_READ, GameCornerSlots
	signpost 12, 6, SIGNPOST_READ, GameCornerSlots
	signpost 13, 6, SIGNPOST_READ, GameCornerSlots
	signpost 14, 6, SIGNPOST_READ, GameCornerSlots
	signpost 15, 6, SIGNPOST_READ, GameCornerSlots
	signpost 8, 7, SIGNPOST_READ, GameCornerSlots
	signpost 9, 7, SIGNPOST_READ, GameCornerSlots
	signpost 10, 7, SIGNPOST_READ, GameCornerSlots
	signpost 11, 7, SIGNPOST_READ, GameCornerSlots
	signpost 12, 7, SIGNPOST_READ, GameCornerSlots
	signpost 13, 7, SIGNPOST_READ, GameCornerSlots
	signpost 14, 7, SIGNPOST_READ, GameCornerSlots
	signpost 15, 7, SIGNPOST_READ, GameCornerSlots
	signpost 8, 12, SIGNPOST_READ, OwsauriPoker
	signpost 9, 12, SIGNPOST_READ, OwsauriPoker
	signpost 10, 12, SIGNPOST_READ, OwsauriPoker
	signpost 11, 12, SIGNPOST_READ, OwsauriPoker
	signpost 12, 12, SIGNPOST_READ, OwsauriPoker
	signpost 13, 12, SIGNPOST_READ, OwsauriPoker
	signpost 14, 12, SIGNPOST_READ, OwsauriPoker
	signpost 15, 12, SIGNPOST_READ, OwsauriPoker
	signpost 8, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 9, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 11, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 12, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 13, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 14, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 15, 13, SIGNPOST_READ, OwsauriBlackjack
	signpost 8, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 9, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 10, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 11, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 12, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 13, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 14, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 15, 18, SIGNPOST_READ, OwsauriCardFlip
	signpost 10, 13, SIGNPOST_ITEM, OwsauriGameCorner_GoldToken

.ObjectEvents
	db 9
	person_event SPRITE_RECEPTIONIST, 4, 16, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OwsauriGameCornerMonExchange, -1
	person_event SPRITE_RECEPTIONIST, 4, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OwsauriGameCornerTMExchange, -1
	person_event SPRITE_CLERK, 4, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, gamecornercoinvendor, -1
	person_event SPRITE_BUENA, 14, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC1, -1
	person_event SPRITE_TEACHER, 11, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC2, -1
	person_event SPRITE_LASS, 10, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC3, -1
	person_event SPRITE_COOLTRAINER_M, 13, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC4, -1
	person_event SPRITE_FISHER, 12, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC5, -1
	person_event SPRITE_ROCKER, 9, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, OwsauriGameCornerNPC6, -1
