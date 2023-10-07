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
	ctxt "Welcome to the"
	line "Stamina Challenge!"

	para "You will face 7"
	line "tough Trainers in"
	cont "a row."

	para "If you make it all"
	line "the way to the"
	para "end, you'll get a"
	line "special prize!"

	para "Want to give it a"
	line "shot?"
	done

.accepted_text
	ctxt "Good, come on in!"
	sdone

.declined_text
	ctxt "That's fine, come"
	line "again!"
	done

.challenge_won_text
	ctxt "You won!"

	para "Here is your"
	line "prize!"
	prompt

.challenge_lost_text
	ctxt "That's a shame."

	para "Try again some"
	line "other time!"
	done

.come_back_later_text
	ctxt "Since you don't"
	line "have space for"
	para "your prize, I'll"
	line "hold onto it for a"
	cont "while."

	para "Come back later to"
	line "pick it up."
	done

.holding_prize_text
	ctxt "You're back for"
	line "your prize?"

	para "Here it is!"
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
	ctxt "I'm trying to let"
	line "my #mon use a"
	para "new move that I"
	line "discovered!"
	done

StaminaTrainer1DefeatedText:
	ctxt "Steel Eater is"
	line "awesome, but you're"
	cont "better!"
	done

StaminaTrainer1AfterText:
	ctxt "Some day I'll find"
	line "even more moves!"
	done

StaminaTrainer2EncounterText:
	ctxt "I've been waiting"
	line "for this!"
	done

StaminaTrainer2DefeatedText:
	ctxt "It was worth the"
	line "wait!"
	done

StaminaTrainer2AfterText:
	ctxt "Thank you for not"
	line "giving up!"
	done

StaminaTrainer3EncounterText:
	ctxt "Hmmm? Do I know"
	line "you?"
	done

StaminaTrainer3DefeatedText:
	ctxt "Who are you?"
	done

StaminaTrainer3AfterText:
	ctxt "Really?"

	para "You're Lance's kid?"
	done

StaminaTrainer4EncounterText:
	ctxt "The star of my"
	line "team is Weavile!"
	done

StaminaTrainer4DefeatedText:
	ctxt "It didn't save me!"
	done

StaminaTrainer4AfterText:
	ctxt "We'll show you boss"
	line "next time!"
	done

StaminaTrainer5EncounterText:
	ctxt "Oh, hello."

	para "Let me battle you"
	line "real quick."

	para "It's not like you"
	line "have something"
	para "important to do or"
	line "anything."
	done

StaminaTrainer5DefeatedText:
	ctxt "Oh. Well, I'm not"
	line "impressed."
	done

StaminaTrainer5AfterText:
	ctxt "You certainly must"
	line "have a lot of free"
	para "time to come by"
	line "here."

	para "Go save the world"
	line "or something."
	done

StaminaTrainer6EncounterText:
	ctxt "BURN, BABY, BURN!"

	para "<...> <...> <...>"
	line "<...> <...> <...>"

	para "If I say any more,"
	line "I risk copyright"
	cont "infringement!"
	done

StaminaTrainer6DefeatedText:
	ctxt "Agh! Disco and"
	line "fire don't mix!"
	done

StaminaTrainer6AfterText:
	ctxt "Remember kids,"
	line "breathe fire"
	cont "responsibly!"
	done

StaminaTrainer7EncounterText:
	ctxt "I'm bored."

	para "Let's have a"
	line "battle!"
	done

StaminaTrainer7DefeatedText:
	ctxt "<...>and now I'm bored"
	line "again."
	done

StaminaTrainer7AfterText:
	ctxt "<...>so bored."
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
