SoutherlyBattleHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EVAR_ROUND_NUMBER EQU EVAR_TEMP

SoutherlyBattleHouseNPC:
	opentext
	checkevent EVENT_SOUTHERLY_BATTLE_HOUSE_HOLDING_PRIZE
	sif true, then
		clearevent EVENT_SOUTHERLY_BATTLE_HOUSE_HOLDING_PRIZE
		writetext .holding_prize_text
		jump .give_prize
	sendif
	writetext .introduction_text
	yesorno
	sif false
		jumptext .declined_text
	showtext .accepted_text
	applymovement 2, .GuardMoveOut
	applymovement PLAYER, .PlayerEnterStamina
	setlasttalked 3
	writebyte 0
	writeeventvar EVAR_ROUND_NUMBER
	jump .handleLoop

.loop
	applymovement 3, .TrainerWalkOut
	applymovement 2, .GuardWalkToHeal
	special HealParty
	special Special_BattleTowerFade
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	applymovement 2, .GuardWalkawayHeal
.handleLoop
	callasm LoadBattleHouseTrainerData
	applymovement 3, .TrainerWalkIn
	opentext
	trainertext 0
	waitbutton
	closetext
	loadmemtrainer
	startbattle
	reloadmap
	sif true, then
		scall .exit
		jumptext .challenge_lost_text
	sendif
	opentext
	trainertext 2
	waitbutton
	closetext
	inceventvar EVAR_ROUND_NUMBER
	readeventvar EVAR_ROUND_NUMBER
	if_less_than 7, .loop
	scall .exit
	opentext
	writetext .challenge_won_text
.give_prize
	verbosegiveitem BIG_NUGGET
	waitbutton
	sif true
		closetextend
	setevent EVENT_SOUTHERLY_BATTLE_HOUSE_HOLDING_PRIZE
	jumptext .come_back_later_text

.exit
	pause 30
	warpfacing UP, SOUTHERLY_BATTLE_HOUSE, 3, 7
	special HealParty
	end

.GuardWalkawayHeal
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_right
	step_end

.GuardWalkToHeal
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

.TrainerWalkOut
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

.TrainerWalkIn
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

.PlayerEnterStamina
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
.GuardMoveOut
	step_up
	step_up
	turn_head_right
	step_end

.introduction_text
	ctxt "Willkommen bei der"
	line "Ausdauer-Challenge"
	cont "von Suntia City!"
	para "Hier erwarten dich"
	line "sieben knallharte"
	cont "Trainer!"
	para "Schaffst du es,"
	line "sie alle am Stück"
	para "zu besiegen,"
	line "bekommst du einen"
	cont "besonderen Preis!"
	para "Traust du dich?"
	done

.accepted_text
	ctxt "Gut, komm rein!"
	sdone

.declined_text
	ctxt "Dann vielleicht"
	line "ein andermal."
	done

.challenge_won_text
	ctxt "Du hast Gewonnen!"
	para "Hier ist dein"
	line "Preis!"
	prompt

.challenge_lost_text
	ctxt "Wie schade."
	para "Versuch es doch"
	line "noch einmal!"
	done

.come_back_later_text
	ctxt "Du hast keinen"
	line "Platz für deinen"
	cont "Preis."
	para "Komm wieder, wenn"
	line "du ihn mitnehmen"
	cont "kannst."
	done

.holding_prize_text
	ctxt "Du wilst deinen"
	line "Preis abholen?"
	para "Hier ist er!"
	done

LoadBattleHouseTrainerData:
	ldh a, [hScriptVar]
	ld bc, SoutherlyBattleHouse_TrainerDataEnd - SoutherlyBattleHouse_TrainerData
	ld hl, SoutherlyBattleHouse_TrainerData
	rst AddNTimes
	ld a, [hli]
	ld [wMap2ObjectSprite], a
	ld [wUsedSprites + 4], a
	ldh [hUsedSpriteIndex], a
	ld a, [hli]
	ld [wMap2ObjectColor], a
	ld a, [wUsedSprites + 5]
	ldh [hUsedSpriteTile], a
	ld de, wTempTrainerClass
	ld bc, 8
	rst CopyBytes
	ld a, [wScriptBank]
	ld [wTempTrainerBank], a
	jpba GetUsedSprite

MACRO battlehousetrainer
	db SPRITE_\1, PAL_OW_\2 ; sprite, color
	db \3, \4 ; class, id
	dw \5, \6, \7 ; text before, win, after
	ENDM

SoutherlyBattleHouse_TrainerData:
	battlehousetrainer BEAUTY,        GREEN, BEAUTY,        6, StaminaTrainer1EncounterText, StaminaTrainer1DefeatedText, StaminaTrainer1AfterText
SoutherlyBattleHouse_TrainerDataEnd:
	battlehousetrainer SUPER_NERD,    BLUE,  SUPER_NERD,    9, StaminaTrainer2EncounterText, StaminaTrainer2DefeatedText, StaminaTrainer2AfterText
	battlehousetrainer YOUNGSTER,     BLUE,  YOUNGSTER,     5, StaminaTrainer3EncounterText, StaminaTrainer3DefeatedText, StaminaTrainer3AfterText
	battlehousetrainer PSYCHIC,       BLUE,  PSYCHIC_T,     8, StaminaTrainer4EncounterText, StaminaTrainer4DefeatedText, StaminaTrainer4AfterText
	battlehousetrainer COOLTRAINER_M, RED,   COOLTRAINERM, 11, StaminaTrainer5EncounterText, StaminaTrainer5DefeatedText, StaminaTrainer5AfterText
	battlehousetrainer FIREBREATHER,  BLUE,  FIREBREATHER, 10, StaminaTrainer6EncounterText, StaminaTrainer6DefeatedText, StaminaTrainer6AfterText
	battlehousetrainer COOLTRAINER_M, RED,   COOLTRAINERM, 12, StaminaTrainer7EncounterText, StaminaTrainer7DefeatedText, StaminaTrainer7AfterText

StaminaTrainer1EncounterText:
	ctxt "Ich habe eine neue"
	line "Attacke entdeckt"
	para "und werde sie an"
	line "dir testen!"
	done

StaminaTrainer1DefeatedText:
	ctxt "Stahlfresser ist"
	line "super, aber du"
	cont "bist noch besser!"
	done

StaminaTrainer1AfterText:
	ctxt "Eines Tages werde"
	line "ich noch mehr"
	para "Attacken"
	line "entdecken!"
	done

StaminaTrainer2EncounterText:
	ctxt "Drauf habe ich"
	line "gewartet!"
	done

StaminaTrainer2DefeatedText:
	ctxt "Das war das Warten"
	line "wert!"
	done

StaminaTrainer2AfterText:
	ctxt "Gib niemals auf!"
	done

StaminaTrainer3EncounterText:
	ctxt "Hmmm?"
	para "Kenne ich dich?"
	done

StaminaTrainer3DefeatedText:
	ctxt "Wer bist du?"
	done

StaminaTrainer3AfterText:
	ctxt "Du bist wirklich"
	line "Siegfrieds Kind?"
	done

StaminaTrainer4EncounterText:
	ctxt "Snibunna ist der"
	line "Star meines Teams!"
	done

StaminaTrainer4DefeatedText:
	ctxt "Es konnte mich"
	line "nicht retten!"
	done

StaminaTrainer4AfterText:
	ctxt "Nächstes Mal"
	line "zeigen wir es dir!"
	done

StaminaTrainer5EncounterText:
	ctxt "Oh, hallo."
	para "Lass uns kurz"
	line "kämpfen."
	para "Ist ja nicht so,"
	line "als hättest du was"
	cont "Besseres zu tun."
	done

StaminaTrainer5DefeatedText:
	ctxt "Oh. Naja, ich bin"
	para "nicht beeindruckt."
	done

StaminaTrainer5AfterText:
	ctxt "Du musst echt viel"
	line "Freizeit haben, um"
	cont "hier herzukommen."
	para "Geh und rette die "
	line "Welt oder so."
	done

StaminaTrainer6EncounterText:
	ctxt "BURN, BABY, BURN!"
	para "<...> <...> <...> "
	line "<...> <...> <...> "
	para "Wenn ich mehr"
	line "sage, habe ich die"
	cont "GEMA am Hals."
	done

StaminaTrainer6DefeatedText:
	ctxt "Autsch! Disko und"
	line "Feuer vertragen"
	cont "sich nicht!"
	done

StaminaTrainer6AfterText:
	ctxt "Denkt dran Kinder:"
	line "Nicht nachmachen!"
	done

StaminaTrainer7EncounterText:
	ctxt "Mir ist echt"
	line "langweilig."
	cont "Lass uns kämpfen!"
	done

StaminaTrainer7DefeatedText:
	ctxt "<...> jetzt ist mir "
	line "wieder langweilig."
	done

StaminaTrainer7AfterText:
	ctxt "<...> so langweilig."
	done

SoutherlyBattleHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def 9, 6, 3, SOUTHERLY_CITY
	warp_def 9, 7, 3, SOUTHERLY_CITY

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 6, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SoutherlyBattleHouseNPC, -1
	person_event SPRITE_TEACHER, 2, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1