PhloxBingo_MapScriptHeader ;trigger count
	db 0
 ;callback count
	db 0

PhloxBingoGranny:
	copybytetovar wBingoCurrentCard
	iffalse .firstcard
	callasm GetNextPendingBingoLine
	sif true
		jumptextfaceplayer PhloxBingoGranny_Text_PrizeWaiting
	callasm GetBingoCardStatus
	anonjumptable
	dw .notdone
	dw .nextcard
	dw .gameover

.notdone
	jumptextfaceplayer PhloxBingoGranny_Text_Instructions

.gameover
	faceplayer
	checkevent EVENT_PHLOX_BINGO_GOT_CARD
	sif true
		scall .completedcard
	jumptext PhloxBingoGranny_Text_NoMoreCards

.nextcard
	faceplayer
	checkevent EVENT_PHLOX_BINGO_GOT_CARD
	sif true
		scall .completedcard
	opentext
	writetext PhloxBingoGranny_Text_WantAnotherCard
	jump .offercard

.firstcard
	faceplayer
	opentext
	writetext PhloxBingoGranny_Text_NoCard
.offercard
	yesorno
	sif false
		jumptext PhloxBingoGranny_Text_WontPlay
	writetext PhloxBingoGranny_Text_GiveCard
	setevent EVENT_PHLOX_BINGO_GOT_CARD
	playsound SFX_DEX_FANFARE_50_79
	appear 4
	scriptstartasm
	ld hl, wBingoCurrentCard
	inc [hl]
	inc hl
	ld bc, 5 ; 2 for wBingoAwardedPrizes and 3 for wBingoMarkedCells
	xor a
	call ByteFill
	scriptstopasm
	waitsfx
	jumptext PhloxBingoGranny_Text_Instructions

.completedcard
	showemote EMOTE_SHOCK, 2, 40
	showtext PhloxBingoGranny_Text_CompletedCard
	clearevent EVENT_PHLOX_BINGO_GOT_CARD
	disappear 4
	pause 15
	end

PhloxBingoAttendant:
	checkevent EVENT_PHLOX_BINGO_GOT_CARD
	sif false
		jumptextfaceplayer PhloxBingoAttendant_Text_NoCard
	callasm GetNextPendingBingoLine
	copyvartobyte wScriptBuffer
	copybytetovar wBingoCurrentCard
	addvar -1
	anonjumptable
	dw .first_card
	dw .second_card
	dw .third_card

.first_card
	copybytetovar wScriptBuffer
	anonjumptable
	dw .noprize
	dw .get_item ;1st line
	dw .get_TM ;2nd line
	dw .get_gold_token ;3rd line
	dw .get_item ;4th line
	dw .get_item ;5th line
	dw .get_TM ;1st column
	dw .get_item ;2nd column
	dw .get_item ;3rd column
	dw .get_item ;4th column
	dw .get_item ;5th column
	dw .get_item ;down diagonal
	dw .get_item ;up diagonal
	dw .get_item ;full card

.prizes_1
	db METAL_POWDER ;1st line
	db 40 ;2nd line
	db 0 ;3rd line
	db RARE_CANDY ;4th line
	db MAX_ELIXIR ;5th line
	db 18 ;1st column
	db PP_UP ;2nd column
	db WHITE_FLUTE ;3rd column
	db HEART_SCALE ;4th column
	db SUN_STONE ;5th column
	db MAX_REVIVE ;down diagonal
	db EXP_SHARE ;up diagonal
	db SHINY_BALL ;full card

.second_card
	copybytetovar wScriptBuffer
	anonjumptable
	dw .noprize
	dw .get_item ;1st line
	dw .get_item ;2nd line
	dw .get_gold_token ;3rd line
	dw .get_TM ;4th line
	dw .get_item ;5th line
	dw .get_TM ;1st column
	dw .get_item ;2nd column
	dw .get_TM ;3rd column
	dw .get_item ;4th column
	dw .get_item ;5th column
	dw .get_item ;down diagonal
	dw .get_item ;up diagonal
	dw .get_item ;full card

.prizes_2
	db RARE_CANDY ;1st line
	db PINK_BOW ;2nd line
	db 1 ;3rd line
	db 75 ;4th line
	db RED_FLUTE ;5th line
	db 96 ;1st column
	db CAGE_KEY ;2nd column
	db 36 ;3rd column
	db BIG_NUGGET ;4th column
	db TRADE_STONE ;5th column
	db MAX_ELIXIR ;down diagonal
	db PP_UP ;up diagonal
	db GRAPPLE_HOOK ;full card

.third_card
	copybytetovar wScriptBuffer
	anonjumptable
	dw .noprize
	dw .get_TM ;1st line
	dw .get_item ;2nd line
	dw .get_TM ;3rd line
	dw .get_item ;4th line
	dw .get_item ;5th line
	dw .get_gold_token ;1st column
	dw .get_item ;2nd column
	dw .get_TM ;3rd column
	dw .get_item ;4th column
	dw .get_item ;5th column
	dw .get_item ;down diagonal
	dw .get_item ;up diagonal
	dw .get_item ;full card

.prizes_3
	db 64 ;1st line
	db SACRED_ASH ;2nd line
	db 7 ;3rd line
	db PURPLE_FLUTE ;4th line
	db PP_UP ;5th line
	db 2 ;1st column
	db SHELL_BELL ;2nd column
	db 13 ;3rd column
	db SAFE_GOGGLES ;4th column
	db MAX_ELIXIR ;5th column
	db BLACK_FLUTE ;down diagonal
	db ORANGE_FLUTE ;up diagonal
	db MASTER_BALL ;full card

.noprize
	copybytetovar wBingoAwardedPrizes + 1
	sif >=, $10
		jumptextfaceplayer PhloxBingoAttendant_Text_Congratulations
	jumptextfaceplayer PhloxBingoAttendant_Text_NoPrize

.get_item
	scall .get_prize
	itemtotext 0, 0
	writetext PhloxBingoAttendant_Text_GotItem
	playsound SFX_ITEM
	giveitem ITEM_FROM_MEM, 1
	waitsfx
	waitbutton
	iftrue .got_prize
	jumptext PhloxBingoAttendant_Text_NoRoomForPrize

.get_TM
	scall .get_prize
	writetext PhloxBingoAttendant_Text_GotTM
	playsound SFX_ITEM
	givetmnomessage 0
	waitsfx
	waitbutton
.got_prize
	copybytetovar wScriptBuffer
	addvar -1
	callasm MarkBingoPrizeAwarded
	sif =, 12, then
		jumptext PhloxBingoAttendant_Text_Congratulations
	sendif
	jumptext PhloxBingoAttendant_Text_EndPrize

.get_gold_token
	scall .get_prize
	pushvar
	writetext PhloxBingoAttendant_Text_GotGoldToken
	playsound SFX_ITEM
	giveitem GOLD_TOKEN, 1
	waitsfx
	waitbutton
	sif false, then
		popvar
		jumptext PhloxBingoAttendant_Text_NoRoomForPrize
	sendif
	popvar
	loadarray .gold_token_event_flags
	readarrayhalfword 0
	setevent -1
	jump .got_prize

.gold_token_event_flags
	dw EVENT_FIRST_BINGO_CARD_GOLD_TOKEN
.gold_token_event_flagsEntrySizeEnd:
	dw EVENT_SECOND_BINGO_CARD_GOLD_TOKEN
	dw EVENT_THIRD_BINGO_CARD_GOLD_TOKEN

.get_prize
	addvar -1
	pushvar
	copybytetovar wBingoCurrentCard
	scall .get_prize_list
	popvar
	loadarray -1, 1
	faceplayer
	opentext
	writetext PhloxBingoAttendant_Text_GotPrize
	readarray 0
	end

.get_prize_list
	writehalfword .prizes_1
	sif =, 1
		end
	writehalfword .prizes_2
	sif =, 2
		end
	writehalfword .prizes_3
	end

PhloxBingoCard:
	checkevent EVENT_PHLOX_BINGO_GOT_CARD
	sif false
		end
	callasm PlayBingo
	reloadmap
	end

PhloxBingoGranny_Text_NoCard:
	ctxt "Bingo! Bingo!"
	line "BINGO!"

	para "Bingo spielen"
	line "macht Spaß!"

	para "Es würde mir so"
	line "viel bedeuten,"
	para "wenn du mit mir"
	line "eine Runde Bingo"
	cont "spielen würdest!"

	para "Markiere eines"
	line "der Felder, wenn"
	para "du eine Über-"
	line "einstimmung hast."
	para "Versuch aber nicht"
	line "zu betrügen!"

	para "Ich bin eine"
	line "Mutter und sogar"
	para "eine Oma."
	line "Eine ziemlich"
	cont "liebe Oma, hehe <...>"

	para "<...> Also weiß ich"
	line "sehr gut, wenn ihr"
	para "Kinder anfangt zu"
	line "lügen!"

	para "Also willst du"
	line "einen Bingozettel?"
	done

PhloxBingoGranny_Text_GiveCard:
	ctxt "Danke, dass du"
	line "mit mir spielen"
	cont "möchtest!"
	done

PhloxBingoGranny_Text_Instructions:
	ctxt "Wenn du eine"
	line "Linie hast, rede"
	para "mit dem Mann hin-"
	line "ter dem Tresen,"
	para "um deinen Preis"
	line "zu erhalten."
	done

PhloxBingoGranny_Text_WontPlay:
	ctxt "Willst du nicht"
	line "mit mir spielen?"
	para "Ich hab doch sonst"
	line "nichts zu tun <...>"
	done

PhloxBingoGranny_Text_PrizeWaiting:
	ctxt "Du hast eine Li-"
	line "nie! Glückwunsch!"

	para "Geh zum Tresen da"
	line "drüben, um deinen"
	cont "Preis abzuholen!"
	done

PhloxBingoGranny_Text_CompletedCard:
	ctxt "Wow! Du hast den"
	line "ganzen Zettel aus-"
	para "gefüllt und alle"
	line "Preise abgeholt!"
	cont "Alle Achtung!"

	para "Lass mich den"
	line "Zettel kurz"
	cont "weglegen."
	prompt

PhloxBingoGranny_Text_WantAnotherCard:
	ctxt "Ich kann dir einen"
	line "anderen Zettel"
	para "mit mehr Feldern"
	line "zum Ausfüllen"
	para "geben, wenn du"
	line "möchtest."
	done

PhloxBingoGranny_Text_NoMoreCards:
	ctxt "Ich habe keine"
	line "Zettel mehr!"

	para "Danke, dass du mit"
	line "mir gespielt hast!"
	done

PhloxBingoAttendant_Text_NoCard:
	ctxt "Willkommen in der"
	line "Bingo-Halle!"

	para "Nimm dir einen"
	line "Bingo-Zettel und"
	para "gewinne tolle"
	line "Preise!"

	para "Die Dame dort"
	line "drüben hat unseren"
	para "letzten Zettel <...>"
	line "Vielleicht gibt"
	cont "sie ihn dir."
	done

PhloxBingoAttendant_Text_GotPrize:
	start_asm
	ldh a, [hScriptVar]
	cp 12
	ld hl, .full_card_text
	ret z
	push bc
	ld bc, wStringBuffer3 - wStringBuffer1
	ld hl, wStringBuffer1
	push hl
	push af
	ld a, "@"
	call ByteFill
	pop af
	ld c, 5
	call SimpleDivide
	bit 1, b
	ld hl, .ordinals
	jr z, .selected_list
	ld hl, .diagonal_names
.selected_list
	call GetNthString
	ld e, l
	ld d, h
	pop hl
	push bc
	call PlaceString
	pop af
	ld hl, .kinds
	call GetNthString
	ld e, l
	ld d, h
	ld hl, wStringBuffer2
	call PlaceString
	pop bc
	ld hl, .text
	ret

.text
	ctxt "Glückwunsch!"

	para "<STRBF1> <STRBF2>"
	line "sind vollständig!"
	sdone

.full_card_text
	ctxt "Du hast den ganzen"
	line "Zettel vervoll-"
	cont "ständigt! Bravo!"
	sdone

.ordinals
	db "Erster@"
	db "Zweiter@"
	db "Dritter@"
	db "Vierter@"
	db "Fünfter@"

.kinds
	db "Reihe@"
	db "Spalte@"
	db "Diagonal@"
.diagonal_names
	db "Runter@"
	db "Hoch@"

PhloxBingoAttendant_Text_NoPrize:
	ctxt "Wenn du eine Linie"
	line "auf deinem Zettel"
	para "hast, komm zu mir"
	line "für deinen Preis!"
	done

PhloxBingoAttendant_Text_GotItem:
	start_asm
	push bc
	ld hl, wStringBuffer1
	ld [hl], "a"
	inc hl
	ld a, "@"
	ld [hli], a
	ld [hld], a
	push hl
	ld a, [wStringBuffer3]
	ld hl, .vowels
	call IsInSingularArray
	pop hl
	jr nc, .not_vowel
	ld [hl], "n"
.not_vowel
	pop bc
	ld hl, .text
	ret
.vowels
	db "AEIOUaeiou", -1
.text
	ctxt "Du gewinnst"
	para "<STRBF1>"
	line "<STRBF3>!"
	done

PhloxBingoAttendant_Text_EndPrize:
	ctxt "Komm zurück, wenn"
	line "du eine andere"
	cont "Linie hast!"
	done

PhloxBingoAttendant_Text_NoRoomForPrize:
	ctxt "Du hast kein Platz"
	line "für diesen Preis <...>"

	para "Ich bewahre es"
	line "auf, bis du Platz"
	para "genug hast. Aber"
	line "beeile dich."
	done

PhloxBingoAttendant_Text_GotTM:
	start_asm
	push bc
	ldh a, [hScriptVar]
	ld c, 10
	call SimpleDivide
	push af
	ld a, b
	add a, "0"
	ld hl, wStringBuffer1
	ld [hli], a
	pop af
	add a, "0"
	ld [hli], a
	ld [hl], "@"
	ld hl, .text
	pop bc
	ret

.text
	ctxt "Du gewinnst die"
	line "TM<STRBF1>!"
	done

PhloxBingoAttendant_Text_GotGoldToken:
	ctxt "Du gewinnst einen"
	line "Goldtaler!"
	done

PhloxBingoAttendant_Text_Congratulations:
	ctxt "Glückwunsch, dass"
	line "du deinen Zettel"
	cont "ausgefüllt hast!"
	done

PhloxBingo_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $9, $6, 5, PHLOX_TOWN
	warp_def $9, $7, 5, PHLOX_TOWN

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_GRANNY, 5, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhloxBingoGranny, -1
	person_event SPRITE_GRAMPS, 6, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PhloxBingoAttendant, -1
	person_event SPRITE_POKEDEX, 5, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, PhloxBingoCard, EVENT_PHLOX_BINGO_GOT_CARD | $8000
