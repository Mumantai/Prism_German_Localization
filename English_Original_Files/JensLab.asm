JensLab_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

JensLabJen:
	faceplayer
	opentext
	checkevent EVENT_PROF_JEN_INTRO
	sif false, then
		setevent EVENT_PROF_JEN_INTRO
		jumptext .introduction_text
	sendif
	copybytetovar wRijonBadges
	sif !=, $ff
		jumptext .not_enough_badges_text
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	sif true
		jumptext .after_receiving_ticket_text
	writetext .receive_ticket_text
	verbosegiveitem FERRY_TICKET, 1
	setevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	jumptext .free_mon_text

.introduction_text
	ctxt "Hello! They call"
	line "me Jen, Prof."
	para "Tim's assistant"
	line "intern."

	para "Prof. Tim's been"
	line "away for a while,"
	para "so I've taken over"
	line "his research for"
	cont "now."

	para "Oh, you're the"
	line "newest Rijon"
	cont "League champion?"

	para "I actually know of"
	line "a secret battle"
	para "retreat called the"
	line "Battle Arcade."

	para "If you collect all"
	line "8 Rijon badges, I"
	para "will give you a"
	line "ticket there."

	para "Good luck!"
	done

.not_enough_badges_text
	ctxt "Hi there!"

	para "Still don't have"
	line "all the Rijon"
	cont "badges?"

	para "Well, don't give"
	line "up!"
	done

.receive_ticket_text
	ctxt "Amazing!"

	para "You were able to"
	line "collect all of the"
	cont "Rijon badges!"

	para "Take this ticket,"
	line "head to Castro"
	para "Valley's port and"
	line "take the ship to"
	cont "the Battle Arcade."
	sdone

.after_receiving_ticket_text
	ctxt "There's always new"
	line "and amazing"
	para "discoveries about"
	line "#mon to find!"

	para "I hope one day"
	line "I'll be a #mon"
	para "professor that's"
	line "as smart as my"
	cont "grandfather!"
	done

.free_mon_text
	ctxt "I'll also let you"
	line "have one of these"
	para "newly-hatched"
	line "#mon."

	para "A Trainer as"
	line "skillful as you"
	para "should be able to"
	line "raise one of them"
	cont "right!"
	done

JensLabRedBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte CHARMANDER
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 3
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke CHARMANDER, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_CHARMANDER
	closetextend

.ball_text
	ctxt "It's a red"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> received"
	line "Charmander!"
	done

JensLabBlueBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte SQUIRTLE
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 4
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke SQUIRTLE, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_SQUIRTLE
	closetextend

.ball_text
	ctxt "It's a blue"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> received"
	line "Squirtle!"
	done

JensLabGreenBall:
	scall JensLab_CheckFreeMonStatus
	sif true
		jumptext .ball_text
	writebyte BULBASAUR
	scall JensLab_ConfirmMon
	sif false
		end
	disappear 5
	opentext
	writetext .mon_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	givepoke BULBASAUR, 5, NO_ITEM, 0
	setevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent EVENT_PROF_JEN_BULBASAUR
	closetextend

.ball_text
	ctxt "It's a green"
	line "#ball!"
	done

.mon_text
	ctxt "<PLAYER> received"
	line "Bulbasaur!"
	done

JensLab_CheckFreeMonStatus:
	; returns 0 if the free mon is available, -1 if the ticket hasn't been given away yet, or 1 if it was already picked up
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	addvar -1
	sif true
		end
	checkevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	end

JensLab_ConfirmMon:
	refreshscreen 0
	pokepic 0
	cry 0
	waitbutton
	closepokepic
	pokenamemem 0, 0
	opentext
	writetext .mon_text
	yesorno
	sif false
		closetextend
	checkcode VAR_PARTYCOUNT
	sif <, 6
		end
	checkcode VAR_BOXSPACE
	sif true
		end
	writebyte 0
	jumptext .no_space_text

.mon_text
	ctxt "It's a <STRBF3>!"

	para "Want it?"
	done

.no_space_text
	ctxt "Free up some space"
	line "in your party or"
	cont "your PC box!"
	done

JensLabGoldTokenCollector1:
	writehalfword EVENT_PROF_JEN_PROF_1
	jump JensLabGoldTokenCollector

JensLabGoldTokenCollector2:
	writehalfword EVENT_PROF_JEN_PROF_2
	; fallthrough

JensLabGoldTokenCollector:
	faceplayer
	opentext
	checkevent EVENT_PROF_JEN_GIVEN_FERRY_TICKET
	sif false
		jumptext .introduction_text
	checkevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	sif false
		jumptext .pending_gift_text
	checkevent -1
	sif true
		jumptext .already_exchanged_text
	writetext .offer_text
	yesorno
	sif false
		jumptext .refused_text
	takeitem GOLD_TOKEN, 8
	sif false
		jumptext .not_enough_tokens_text
	clearevent EVENT_PROF_JEN_PICKED_UP_FREE_POKE
	setevent -1
	jumptext .pick_one_text

.introduction_text
	ctxt "I am Prof Tim's"
	line "aide."

	para "I might have an"
	line "offer for you"
	para "after you impress"
	line "Jen over there."
	done

.pending_gift_text
	ctxt "Pick up your gift"
	line "first!"
	done

.already_exchanged_text
	ctxt "Thanks for the"
	line "tokens, my good"
	cont "man!"
	done

.offer_text
	ctxt "I am Prof Tim's"
	line "aide, as well as a"
	para "collector of Gold"
	line "Tokens."

	para "If you give me"
	line "eight, I'll let"
	para "you have one of"
	line "those #mon on"
	cont "that table."

	para "Up for it?"
	done

.refused_text
	ctxt "How could you say"
	line "no to new #mon?"
	done

.not_enough_tokens_text
	ctxt "Not enough, come"
	line "back later."
	done

.pick_one_text
	ctxt "Great, now pick"
	line "one off of the"
	cont "table!"
	done

JensLab_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, $4, 3, GRAVEL_TOWN
	warp_def $b, $5, 3, GRAVEL_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 6
	person_event SPRITE_JEN, 2, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, JensLabJen, -1
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabRedBall, EVENT_PROF_JEN_CHARMANDER
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, JensLabBlueBall, EVENT_PROF_JEN_SQUIRTLE
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, JensLabGreenBall, EVENT_PROF_JEN_BULBASAUR
	person_event SPRITE_SCIENTIST, 9, 8, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabGoldTokenCollector1, -1
	person_event SPRITE_SCIENTIST, 9, 1, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JensLabGoldTokenCollector2, -1
