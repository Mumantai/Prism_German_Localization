SpurgeGameCorner_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGameCornerSlotMachine:
	farjump GameCornerSlots

GameCornerMemoryGame::
	opentext
	checkcoins 25
	sif =, 2
		jumptext .need_25_coins_text
	refreshscreen 0
	special Special_MemoryGame
	sif false
		closetextend
	writetext .you_won_text

.itemloop
	callasm .process_item
	sif false
		closetextend
	verbosegiveitem ITEM_FROM_MEM, 1
	waitbutton
	jump .itemloop

.process_item
	xor a
	ld d, a
	ldh [hScriptVar], a
	ld hl, wMemoryGameLastMatches
	ld a, [hl]
	and a
	ret z
	dec a
	ld hl, .items
	ld e, a
	add hl, de
	ld a, [hl]
	ldh [hScriptVar], a

	ld hl, wMemoryGameLastMatches + 1
	ld de, wMemoryGameLastMatches
	ld bc, 4
	rst CopyBytes
	xor a
	ld [wMemoryGameLastMatches + 4], a
	ret

.items
	db ANTIDOTE
	db RARE_CANDY
	db POKE_DOLL
	db REPEL
	db POTION
	db POKE_BALL
	db GREAT_BALL
	db NUGGET

.need_25_coins_text
	ctxt "Du brauchst 25"
	line "Münzen, um hier"
	para "mitspielen zu"
	line "können."
	done

.you_won_text
	ctxt "Glückwunsch!"
	line "Du hast gewonnen!"
	sdone

SpurgeGameCornerCardFlip::
	refreshscreen 0
	special Special_CardFlip
	closetextend

SpurgeGameCornerPoker:
	farjump GameCornerPoker

SpurgeGameCornerBlackjack:
	farjump GameCornerBlackjack

SpurgeGameCornerExchangeCounterOpening:
	faceplayer
	opentext
	farwritetext GameCorner_Text_ExchangeGameCoins
	checkitem COIN_CASE
	sif true
		end
	jumptext .no_coin_case_text

.no_coin_case_text
	ctxt "Oh, du hast keinen"
	line "Münzkorb."
	done

SpurgeGameCornerMonExchange:
	scall SpurgeGameCornerExchangeCounterOpening
	sif false
		end
	farwritetext GameCornerMonExchange_Text_WhichMon
	special Special_DisplayCoinCaseBalance
	menuanonjumptable .menu
	dw GameCorner_SaveYourCoinsComeAgain
	dw .kangaskhan
	dw .eevee
	dw GameCornerMonExchange_GetPorygon

.menu
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db 3
	db "Kangama      1000@"
	db "Evoli        3000@"
	db "Porygon      5000@"

.kangaskhan
	writebyte KANGASKHAN
	copyvartobyte wScriptTemp
	checkcoins 1000
	scall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 1000
	end

.eevee
	writebyte EEVEE
	copyvartobyte wScriptTemp
	checkcoins 3000
	scall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 3000
	end

GameCornerMonExchange_GetPorygon::
	writebyte PORYGON
	copyvartobyte wScriptTemp
	checkcoins 5000
	scall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 5000
	end

GameCornerMonExchange_GetMon::
	pushvar
	writebyte 0
	copyvartobyte wScriptTemp + 1
	popvar
	sif =, 2
		farjumptext GameCorner_Text_NeedMoreCoins
	checkcode VAR_PARTYCOUNT
	sif >, 5
		farjumptext GameCorner_Text_NoRoomInParty
	copybytetovar wScriptTemp
	pokenamemem 0, 0
	writetext .is_that_right_text
	yesorno
	closetext
	sif false
		jump GameCorner_SaveYourCoinsComeAgain
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext GameCorner_Text_HereYouGo
	copybytetovar wScriptTemp
	special Special_GameCornerPrizeMonCheckDex
	givepoke 0, 20, NO_ITEM, 0
	closetext
	writebyte 1
	copyvartobyte wScriptTemp + 1
	end

.is_that_right_text
	ctxt "<STRBF1>,"
	line "bist du sicher?"
	done

SpurgeGameCornerTMExchange:
	scall SpurgeGameCornerExchangeCounterOpening
	sif false
		end
	farwritetext GameCornerTMExchange_Text_WhichTM
	special Special_DisplayCoinCaseBalance
	menuanonjumptable .menu
	dw GameCorner_SaveYourCoinsComeAgain
	dw .tm33
	dw .tm41
	dw .tm48

.menu
	db $40 ; flags
	db 03, 05 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db 3
	db "TM33    3000@"
	db "TM41    3000@"
	db "TM48    3000@"

.tm33
	writebyte 33
	jump .do_exchange

.tm41
	writebyte 41
	jump .do_exchange

.tm48
	writebyte 48
.do_exchange
	farjump OwsauriGameCorner_TMExchange_DoExchange

SpurgeGameCornerCoinCaseSeller:
	faceplayer
	checkevent EVENT_GET_COIN_CASE
	sif true
		jumptext .after_sale_text
	opentext
	special PlaceMoneyTopRight
	writetext .will_sell_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 1000
	sif =, 2
		jumptext .not_enough_money_text
	takemoney 0, 1000
	special PlaceMoneyTopRight
	setevent EVENT_GET_COIN_CASE
	opentext
	writetext .accepted_text
	verbosegiveitem COIN_CASE, 1
	waitbutton
	closetextend

.after_sale_text
	ctxt "Münzkorb?"
	para "Welcher Münzkorb?"
	done

.will_sell_text
	ctxt "Psst <...>"
	para "Ich verkaufe dir"
	line "einen Münzkorb."
	para "Ich will dafür nur"
	line "¥1000 haben."
	para "Deal?"
	done

.declined_text
	ctxt "Dann verzieh dich."
	done

.accepted_text
	ctxt "Ich wusste es."
	sdone

.not_enough_money_text
	ctxt "<...>"
	para "Lass mich wissen,"
	line "wenn du überhaupt"
	cont "Geld hast."
	done

SpurgeGameCornerNPC1:
	ctxt "Woaw, 24× beim"
	line "ersten Versuch!"
	para "Läuft bei mir!"
	done

SpurgeGameCornerNPC2:
	ctxt "In dieser Reihe"
	line "gibt es nur"
	cont "Memory!"
	para "Finde Paare und"
	line "gewinne Preise."
	para "Du hast fünf"
	line "Versuche, um Paare"
	cont "zu finden."
	para "Du kannst also bis"
	line "zu fünf Preise"
	cont "gewinnen!"
	para "Aber sei gewarnt;"
	line "ein Spiel kostet"
	cont "25 Münzen <...>"
	done

SpurgeGameCornerNPC3:
	ctxt "Das sind unsere"
	line "Spielautomaten."
	para "Ich hoffe, du"
	line "weißt mittler-"
	line "weile, wie sie"
	cont "funktionieren <...>"
	done

SpurgeGameCornerNPC4:
	ctxt "In dieser Reihe,"
	line "gibt es das"
	para "klassische"
	line "Kartenspiel."
	done

SpurgeGameCornerNPC5:
	ctxt "Blackjack!"
	para "Komm der 21 so"
	line "nahe, wie möglich."
	para "Kommst du drüber,"
	line "hast du verloren!"
	done

SpurgeGameCornerNPC6:
	ctxt "Video Poker!"
	para "Zehn Münzen pro"
	line "Spiel!"
	done

SpurgeGameCornerNPC7:
	ctxt "Diese Pärchen sind"
	line "schwer zu finden!"
	done

SpurgeGameCornerNPC8:
	ctxt "Man soll hier"
	line "Sonderbonbons"
	cont "gewinnen können."
	para "Aber ich habe"
	line "natürlich  mal"
	cont "wieder Pech <...>"
	done

SpurgeGameCornerNPC9:
	ctxt "Wenn ich weiter"
	line "nur am Automaten"
	para "spiele, dauert es"
	line "ewig, bis ich die"
	para "TM33, Eishieb, für"
	line "mein Schneppke"
	cont "gewinne."
	done

SpurgeGameCornerNPC10:
	ctxt "Ich hab 100"
	line "gesetzt, hatte ne"
	para "gute Hand, hab"
	line "verdoppelt und"
	cont "verloren."
	para "Naja, auf ein"
	line "Neues <...>"
	done

SpurgeGameCornerNPC11:
	ctxt "Die Musik hier,"
	line "kommt mir so"
	cont "bekannt vor."
	para "Ich kann mich"
	line "nicht erinnern,"
	para "woher ich sie"
	line "kenne <...>"
	para "Haben diese zwei"
	line "Roboter die"
	cont "gemacht?"
	done

GameCorner_SaveYourCoinsComeAgain::
	jumptext .text

.text
	ctxt "OK. Bitte bewahr"
	para "die Münzen gut auf"
	line "und komm zurück!"
	done

SpurgeGameCorner_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 13, 14, 3, SPURGE_CITY
	warp_def 13, 15, 3, SPURGE_CITY

.CoordEvents: db 0

.BGEvents: db 36
	signpost 4, 6, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 5, 6, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 2, 6, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 3, 6, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 4, 7, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 5, 7, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 2, 7, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 3, 7, SIGNPOST_READ, SpurgeGameCornerSlotMachine
	signpost 2, 14, SIGNPOST_READ, GameCornerMemoryGame
	signpost 3, 14, SIGNPOST_READ, GameCornerMemoryGame
	signpost 4, 14, SIGNPOST_READ, GameCornerMemoryGame
	signpost 5, 14, SIGNPOST_READ, GameCornerMemoryGame
	signpost 2, 15, SIGNPOST_READ, GameCornerMemoryGame
	signpost 3, 15, SIGNPOST_READ, GameCornerMemoryGame
	signpost 4, 15, SIGNPOST_READ, GameCornerMemoryGame
	signpost 5, 15, SIGNPOST_READ, GameCornerMemoryGame
	signpost 5, 22, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 4, 22, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 2, 22, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 3, 22, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 5, 23, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 4, 23, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 2, 23, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 3, 23, SIGNPOST_READ, SpurgeGameCornerCardFlip
	signpost 6, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 7, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 8, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 9, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 10, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 11, 1, SIGNPOST_READ, SpurgeGameCornerPoker
	signpost 6, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack
	signpost 7, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack
	signpost 8, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack
	signpost 9, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack
	signpost 10, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack
	signpost 11, 28, SIGNPOST_READ, SpurgeGameCornerBlackjack

.ObjectEvents: db 15
	person_event SPRITE_CLERK, 2, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, gamecornercoinvendor, -1
	person_event SPRITE_RECEPTIONIST, 2, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGameCornerMonExchange, -1
	person_event SPRITE_RECEPTIONIST, 2, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGameCornerTMExchange, -1
	person_event SPRITE_BURGLAR, 10, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_SCRIPT, 0, SpurgeGameCornerCoinCaseSeller, -1
	person_event SPRITE_FISHING_GURU, 5, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC1, -1
	person_event SPRITE_RECEPTIONIST, 1, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC2, -1
	person_event SPRITE_RECEPTIONIST, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC3, -1
	person_event SPRITE_RECEPTIONIST, 1, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC4, -1
	person_event SPRITE_RECEPTIONIST, 5, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC5, -1
	person_event SPRITE_RECEPTIONIST, 5, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC6, -1
	person_event SPRITE_FISHER, 8, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC7, -1
	person_event SPRITE_POKEFAN_M, 4, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC8, -1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC9, -1
	person_event SPRITE_COOLTRAINER_M, 11, 27, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC10, -1
	person_event SPRITE_HIKER, 3, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SpurgeGameCornerNPC11, -1