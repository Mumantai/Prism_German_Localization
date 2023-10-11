GoldenrodGameCorner_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodGameCornerMonExchange:
	faceplayer
	opentext
	special Special_DisplayCoinCaseBalance
	farwritetext GameCorner_Text_ExchangeGameCoins
	farwritetext GameCornerMonExchange_Text_WhichMon
	menuanonjumptable .menu
	dw .done
	dw .eevee
	dw .bagon
	dw .porygon
.done
	farjump GameCorner_SaveYourCoinsComeAgain

.eevee	; change to farjump SpurgeGameCorner's eevee if prices become the same
	writebyte EEVEE
	copyvartobyte wScriptTemp
	checkcoins 1000
	farscall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 1000
	end

.bagon
	writebyte BAGON
	copyvartobyte wScriptTemp
	checkcoins 3000
	farscall GameCornerMonExchange_GetMon
	copybytetovar wScriptTemp + 1
	sif true
		takecoins 3000
	end

.porygon
	farjump GameCornerMonExchange_GetPorygon

.menu
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db $3
	db "Eevee        1000@"
	db "Bagon        3000@"
	db "Porygon      5000@"

GoldenrodGameCornerTMExchange:
	faceplayer
	opentext
	special Special_DisplayCoinCaseBalance
	farwritetext GameCorner_Text_ExchangeGameCoins
	farwritetext GameCornerTMExchange_Text_WhichTM
	menuanonjumptable .menu
	dw .done
	dw .tm72
	dw .tm73
	dw .tm74
.done
	farjump GameCorner_SaveYourCoinsComeAgain

.tm72
	writebyte 72
	jump .do_exchange

.tm73
	writebyte 73
	jump .do_exchange

.tm74
	writebyte 74
.do_exchange
	farjump OwsauriGameCorner_TMExchange_DoExchange

.menu
	db $40 ; flags
	db 03, 05 ; start coords
	db 11, 19 ; end coords
	dw .options
	db 1 ; default option

.options
	db $80
	db $3
	db "TM72    3000@"
	db "TM73    3000@"
	db "TM74    3000@"

GoldenrodGameCornerPoker:
	farjump GameCornerPoker

GoldenrodGameCornerSlots:
	farjump GameCornerSlots

GoldenrodGameCornerBlackjack:
	farjump GameCornerBlackjack

GoldenrodGameCornerMemory:
	farjump GameCornerMemoryGame

GoldenrodGameCornerCardFlip:
	farjump SpurgeGameCornerCardFlip

GoldenrodGameCornerNPC1:
	ctxt "Hi, they call me"
	line "DJ Ben!"

	para "I used to host a"
	line "rockin' #mon"
	para "music show before"
	line "that quake ruined"
	cont "the Radio Tower."

	para "Now I spend most"
	line "of my time playing"
	cont "this card game."

	para "I'll continue to do"
	line "so until I can"
	cont "start DJing again!"
	done

GoldenrodGameCornerNPC2:
	ctxt "The TMs they offer"
	line "here are"
	cont "phenomenal!"

	para "Make sure to grab"
	line "them when you get"
	cont "the chance."
	done

GoldenrodGameCornerNPC3:
	ctxt "I finally found my"
	line "game: Blackjack!"

	para "If you're looking"
	line "for a Coin Case, a"
	para "person in some"
	line "faraway city sells"
	para "them right in"
	line "their Game Corner."

	para "But you didn't hear"
	line "that from me!"
	done

GoldenrodGameCornerNPC4:
	ctxt "You can't beat the"
	line "classic one-armed"
	cont "bandit game."
	done

GoldenrodGameCorner_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $d, $2, 12, GOLDENROD_CITY
	warp_def $d, $3, 12, GOLDENROD_CITY

.CoordEvents
	db 0

.BGEvents
	db 32
	signpost 6, 1, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 8, 1, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 9, 1, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 10, 1, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 11, 1, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 6, 6, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 7, 6, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 8, 6, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 10, 6, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 11, 6, SIGNPOST_READ, GoldenrodGameCornerSlots
	signpost 6, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 7, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 8, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 9, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 10, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 11, 7, SIGNPOST_READ, GoldenrodGameCornerPoker
	signpost 6, 12, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 7, 12, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 6, 13, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 9, 12, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 10, 12, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 11, 12, SIGNPOST_READ, GoldenrodGameCornerBlackjack
	signpost 7, 13, SIGNPOST_READ, GoldenrodGameCornerMemory
	signpost 8, 13, SIGNPOST_READ, GoldenrodGameCornerMemory
	signpost 9, 13, SIGNPOST_READ, GoldenrodGameCornerMemory
	signpost 10, 13, SIGNPOST_READ, GoldenrodGameCornerMemory
	signpost 11, 13, SIGNPOST_READ, GoldenrodGameCornerMemory
	signpost 6, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlip
	signpost 8, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlip
	signpost 9, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlip
	signpost 10, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlip
	signpost 11, 18, SIGNPOST_READ, GoldenrodGameCornerCardFlip

.ObjectEvents
	db 7
	person_event SPRITE_ROCKER, 7, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodGameCornerNPC1, -1
	person_event SPRITE_BURGLAR, 9, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodGameCornerNPC2, -1
	person_event SPRITE_POKEFAN_M, 8, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, GoldenrodGameCornerNPC3, -1
	person_event SPRITE_GRANNY, 7, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, GoldenrodGameCornerNPC4, -1
	person_event SPRITE_RECEPTIONIST, 2, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerMonExchange, -1
	person_event SPRITE_RECEPTIONIST, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenrodGameCornerTMExchange, -1
	person_event SPRITE_CLERK, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_JUMPSTD, 0, gamecornercoinvendor, -1
