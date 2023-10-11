PrisonF1_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, PrisonF1_UpdateLockedDoors

PrisonF1_UpdateLockedDoors:
	copy wCageKeyDoorsArrayBank
	dba PrisonF1ChangeBlockArray
	db (PrisonF1ChangeBlockArrayEnd - PrisonF1ChangeBlockArray) / 5
	endcopy
	farjump UpdateCageKeyDoorsScript

PrisonF1ChangeBlockArray:
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_1, 20, 6, $1a
PrisonF1ChangeBlockArrayEntrySizeEnd:
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_2, 34, 4, $1a
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_3, 36, 18, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_4, 34, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_5, 26, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_6, 18, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_7, 12, 22, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_8, 4, 22, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_9, 4, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_10, 10, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_11, 36, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_12, 22, 30, $57
PrisonF1ChangeBlockArrayEnd:

PrisonF1CellSignpost:
	ctxt "Don't try to jump"
	line "and escape."

	para "Don't forget,"
	line "you're here"
	cont "forever."
	done

PrisonF1BlackPatroller:
	faceplayer
	opentext
	checkevent EVENT_PRISON_ROOF_CARD
	sif true
		jumptext .after_card_explanation_text
	writetext .intro_text
	verbosegiveitem ROOF_CARD, 1
	waitbutton
	writetext .after_give_card_text
	setevent EVENT_PRISON_ROOF_CARD
	endtext

.intro_text
	ctxt "I recognize you."

	para "You went under-"
	line "cover and landed"
	cont "me up in here."

	para "I could easily"
	line "blame you for my"
	cont "being in here, but"
	para "I spent a good"
	line "deal of my time"
	para "here just thinking"
	line "about my life"
	cont "decisions."

	para "Not just my own"
	line "choices, but the"
	para "kind of choices"
	line "that get all of us"
	para "to change the road"
	line "we've set out on."

	para "Me, I joined a"
	line "group of #mon"
	para "Trainers who were"
	line "extreme in their"
	para "means of attaining"
	line "their philosophy."

	para "We used anything,"
	line "such as psychic"
	para "oppression with"
	line "our #mon, to"
	cont "get our way."

	para "I believed I was"
	line "doing good<...>"

	para "<...>that I was doing"
	line "a service to our"
	para "future generations"
	line "by finding ways to"
	para "radically improve"
	line "growth of #mon."

	para "I believed what I"
	line "was doing was good"
	para "until our run-ins"
	line "with you started:"
	para "you, just a humble"
	line "Trainer, who, with"
	para "a team of ordinary"
	line "#mon, bested"
	para "our genetically"
	line "superior ones."

	para "You showed real"
	line "respect to your"
	para "#mon team and"
	line "crafted an extrem-"
	para "ely positive bond"
	line "between them."

	para "The world needs"
	line "more Trainers like"
	cont "you, not like us."

	para "Here, take this."

	para "You deserve this"
	line "more than me."
	sdone

.after_give_card_text
	ctxt "It's a card I found"
	line "on the ground."

	para "This card lets you"
	line "access the roof."

	para "The basement's door"
	line "is locked by some"
	cont "special code."

	para "That's where they"
	line "keep the unruly"
	cont "#mon of prison."

	para "Someone else might"
	line "know the passcode."
	done

.after_card_explanation_text
	ctxt "Worry about"
	line "yourself."
	done

PrisonF1_Trainer_1:
	trainer EVENT_PRISON_F1_TRAINER_1, COOLTRAINERM, 10, .before_battle_text, .battle_won_text

	ctxt "You seem like a"
	line "sensible young"
	para "kid, with a very"
	line "sensible kind of"
	cont "lifestyle."

	para "You pursue the"
	line "life that you want"
	para "over the life you"
	line "are expected to"
	para "live, and because"
	line "of that decision,"
	para "great things will"
	line "happen to you and"
	para "to those with whom"
	line "you've interacted."

	para "If you want some"
	line "real trustworthy"
	para "info: try and go"
	line "up to the roof."

	para "A bunch of the"
	line "prison guards go"
	para "up there to have a"
	line "drink and smoke"
	cont "during breaks."

	para "Some of them may"
	line "even be so drunk"
	para "they slip you the"
	line "secret password."
	done

.before_battle_text
	ctxt "Prison actually"
	line "isn't too bad."

	para "At least I don't"
	line "have to pay my"
	cont "student loans."
	done

.battle_won_text
	ctxt "More interest,"
	line "more pain."
	done

PrisonF1_Trainer_2:
	trainer EVENT_PRISON_F1_TRAINER_2, FISHER, 14, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	faceplayer
	showtext .after_battle_text
	check_just_battled
	sif false
		end
	readpersonxy 5, wScriptBuffer
	writebyte 35 + 4
	comparevartobyte wScriptBuffer
	sif !=, 2
		end
	writebyte 26 + 4
	comparevartobyte wScriptBuffer + 1
	sif !=, 2
		end
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 4, PrisonF1_BlockableTrainerMovesRight
	selse
		applymovement 4, PrisonF1_BlockableTrainerMovesLeft
	sendif
	end

.before_battle_text
	ctxt "<...>I hope my girl"
	line "Jasmine is still"
	para "waiting for me on"
	line "the outside."
	done

.battle_won_text
	ctxt "No fair! I wasn't"
	line "paying attention!"
	done

.after_battle_text
	ctxt "Sorry, young one,"
	line "I don't have any"
	para "information to"
	line "spare with you."
	sdone

PrisonF1_Trainer_3:
	trainer EVENT_PRISON_F1_TRAINER_3, BIKER, 9, .before_battle_text, .battle_won_text, NULL, .Script

.before_battle_text
	ctxt "They're letting"
	line "kids into this"
	cont "place too, now?"

	para "Prison is hereby"
	line "officially uncool."
	done

.battle_won_text
	ctxt "I just can't"
	line "believe this!"

	para "Prison has ended"
	line "up becoming some"
	para "place for trendy"
	line "hipsters to get"
	para "locked up for non-"
	line "violent <``>civil"
	cont "disobedience<''>."
	done

.give_key_text
	ctxt "The only reason"
	line "why I let myself"
	para "get locked up in"
	line "here is to get me"
	cont "some respect."

	para "<...>Which is why I"
	line "don't need this key"
	cont "anymore."
	sdone

.after_key_text
	ctxt "The only reason"
	line "why I let myself"
	para "get locked up in"
	line "here is to get"
	para "some respect from"
	line "my peers."
	done

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_3
	sif true
		jumptextfaceplayer .after_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_3
PrisonF1_TrainerGiveKey:
	verbosegiveitem CAGE_KEY, 1
	waitbutton
	sif false
		jumptext .no_room_text
	setevent -1
	closetextend

.no_room_text
	ctxt "Free some space."
	done

PrisonF1_Trainer_4:
	trainer EVENT_PRISON_F1_TRAINER_4, SAILOR, 4, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_4
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_4
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "I need some space."
	done

.battle_won_text
	ctxt "You just made a"
	line "very big mistake"
	cont "there, kid."
	done

.give_key_text
	ctxt "If you take this"
	line "rusty key off my"
	para "hands, I won't"
	line "bother with you."
	sdone

.after_give_key_text
	ctxt "Scram!"
	done

PrisonF1_Trainer_5:
	trainer EVENT_PRISON_F1_TRAINER_5, MINER, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_5
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_5
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "You out for some"
	line "information?"

	para "Well, how about a"
	line "battle instead?"
	done

.battle_won_text
	ctxt "Darn, you're good!"
	done

.give_key_text
	ctxt "Heh, it's been so"
	line "long since I had"
	para "felt that thrill"
	line "of battling."

	para "Also, sorry, kid,"
	line "I don't have any"
	para "useful information"
	line "for you, really."

	para "I do have a key,"
	line "though, somewhere."
	sdone

.after_give_key_text
	ctxt "Get outta here!"
	done

PrisonF1_Trainer_6:
	trainer EVENT_PRISON_F1_TRAINER_6, BIRD_KEEPER, 8, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_6
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_6
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "Hey there, friend!"
	done

.battle_won_text
	ctxt "What was that?"
	done

.give_key_text
	ctxt "I can't believe"
	line "you, after all"
	cont "we've been through!"

	para "Just, please, take"
	line "this key and go!"
	sdone

.after_give_key_text
	ctxt "Say no more, just"
	line "let me be!"
	done

PrisonF1_Trainer_7:
	trainer EVENT_PRISON_F1_TRAINER_7, SAILOR, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	scall .PrisonF1_Trainer_7_GivesKey
	check_just_battled
	sif false
		end
	readpersonxy 15, wScriptBuffer
	writebyte 34 + 4
	comparevartobyte wScriptBuffer
	sif !=, 2
		end
	writebyte 4 + 4
	comparevartobyte wScriptBuffer + 1
	sif !=, 2
		end
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 8, PrisonF1_BlockableTrainerMovesRight
	selse
		applymovement 8, PrisonF1_BlockableTrainerMovesLeft
	sendif
	end

.PrisonF1_Trainer_7_GivesKey
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_7
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_7
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "It's awfully cold"
	line "in here<...>"
	done

.battle_won_text
	ctxt "Well, at least"
	line "that warmed me up."
	done

.give_key_text
	ctxt "If you take this"
	line "key, will you"
	cont "please just go?"
	sdone

.after_give_key_text
	ctxt "I'll just eat and"
	line "gain blubber."
	done

PrisonF1_BlockableTrainerMovesLeft:
	step_left
	step_end

PrisonF1_BlockableTrainerMovesRight:
	step_right
	step_end

PrisonF1_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 35, 18, 1, SAXIFRAGE_ISLAND
	warp_def 35, 19, 1, SAXIFRAGE_ISLAND
	warp_def 2, 2, 2, PRISON_PATHS
	warp_def 17, 22, 7, PRISON_PATHS
	warp_def 15, 31, 3, PRISON_PATHS
	warp_def 8, 37, 1, PRISON_F2
	warp_def 12, 34, 1, PRISON_B1F
	warp_def 26, 0, 1, PRISON_BATHS
	warp_def 27, 0, 2, PRISON_BATHS
	warp_def 28, 39, 1, PRISON_WORKOUT
	warp_def 29, 39, 2, PRISON_WORKOUT

.CoordEvents: db 0

.BGEvents: db 13
	signpost 7, 20, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 0
	signpost 5, 34, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 1
	signpost 23, 5, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 7
	signpost 23, 13, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 6
	signpost 27, 19, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 5
	signpost 27, 27, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 4
	signpost 19, 37, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 2
	signpost 27, 35, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 3
	signpost 30, 4, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 8
	signpost 30, 10, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 9
	signpost 2, 19, SIGNPOST_TEXT, PrisonF1CellSignpost
	signpost 30, 22, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 11
	signpost 30, 36, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 10

.ObjectEvents: db 13
	person_event SPRITE_COOLTRAINER_M, 20, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 0, PrisonF1_Trainer_1, -1
	person_event SPRITE_FISHER, 24, 33, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_2, -1
	person_event SPRITE_BIKER, 24, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_3, -1
	person_event SPRITE_SAILOR, 20, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_4, -1
	person_event SPRITE_MINER, 32, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_5, -1
	person_event SPRITE_BIRDKEEPER, 32, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_6, -1
	person_event SPRITE_SAILOR, 2, 35, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_7, -1
	person_event SPRITE_PALETTE_PATROLLER, 33, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, PrisonF1BlackPatroller, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_POKE_BALL, 5, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_PRISON_F1_ITEM_CAGE_KEY_1
	person_event SPRITE_POKE_BALL, 16, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_PRISON_F1_ITEM_CAGE_KEY_2
	person_event SPRITE_POKE_BALL, 24, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_PRISON_F1_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 5, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, FLUFFY_COAT, EVENT_PRISON_F1_ITEM_FLUFFY_COAT
	person_event SPRITE_POKE_BALL, 32, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, FRIEND_BALL, EVENT_PRISON_F1_ITEM_FRIEND_BALLS
