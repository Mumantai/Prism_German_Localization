Route85_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route85DirectionsSign:
	ctxt "<LEFT> Phacelia Town"
	next "<RIGHT> Firelight"
	nl   "  Caverns"
	done

Route85EntranceSign:
	ctxt "Firelight Caverns"
	next "Entrance"
	done

Route85_Trainer_1:
	trainer EVENT_ROUTE_85_TRAINER_1, BIRD_KEEPER, 3, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	end_if_just_battled
	opentext
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif false
		jumptext .after_battle_undercover_text
	jumptext .after_battle_not_undercover_text

.before_battle_text
	ctxt "Huh, so you're a"
	line "Palette Patroller?"
	done

.battle_won_text
	ctxt "I can't believe I"
	line "lost to a Palette"
	cont "Patroller!"
	done

.after_battle_not_undercover_text
	ctxt "I'm worn out after"
	line "a battle with a"
	cont "Palette Patroller!"
	done

.after_battle_undercover_text
	ctxt "It seems like the"
	line "purpose of your"
	para "crew is only to"
	line "waste time."

	para "<...>"

	para "<...>Wait."

	para "Then why are the"
	line "cops looking for"
	cont "you guys?"
	done

Route85_Trainer_2:
	trainer EVENT_ROUTE_85_TRAINER_2, PSYCHIC_T, 3, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	end_if_just_battled
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif false
		jumptext .after_battle_undercover_text
	jumptext .after_battle_not_undercover_text

.before_battle_text
	ctxt "Are you looking"
	line "for your buddy?"
	done

.battle_won_text
	ctxt "Fine, I'll stay"
	line "out of your way."
	done

.after_battle_not_undercover_text
	ctxt "I'm scared of"
	line "those Palette"
	cont "Patrollers."

	para "I've heard that"
	line "they do what they"
	para "want without"
	line "worrying about"
	cont "consequences."
	done

.after_battle_undercover_text
	ctxt "As long as it"
	line "doesn't involve"
	para "me, I won't be"
	line "reporting your"
	cont "shenanigans."
	done

Route85Officer:
	faceplayer
	opentext
	writetext .officer_text
	writetext .black_text
	stopfollow
	warp PHACELIA_POLICE_F2, 3, 1
	spriteface PLAYER, LEFT
	spriteface 2, RIGHT
	opentext
	writetext .need_suit_back_text
	callasm .restore_sprite
	setevent EVENT_ROUTE_85_POLICEMAN_GONE
	clearevent EVENT_IN_UNDERCOVER_MISSION
	clearevent EVENT_PALETTE_BLACK_FOLLOWING
	setevent EVENT_ARRESTED_PALETTE_BLACK
	closetext
	callasm CancelMapSign
	opentext
	writetext .after_arrest_text
	givetm HM_ROCK_SMASH + RECEIVED_TM
	jumptext .after_giving_HM_text

.restore_sprite
	ld a, [wSavedPlayerCharacteristics2]
	ld [wPlayerGender], a
	ret

.officer_text
	ctxt "Officer: Great"
	line "job. I knew you"
	cont "could do it."
	sdone

.black_text
	ctxt "Black: Why did I"
	line "fall for that?"
	sdone

.need_suit_back_text
	ctxt "I'll need that"
	line "suit back."
	sdone

.after_arrest_text
	ctxt "The guard in front"
	line "of the quarry's Gym"
	para "will let you"
	line "through now."

	para "Please also take"
	line "this gift."
	sdone

.after_giving_HM_text
	ctxt "HM05 is Rock"
	line "Smash."

	para "You'll be able to"
	line "break loose rocks"
	cont "with this."

	para "However, you'll"
	line "need the city's"
	para "badge before you"
	line "can use this!"
	done

Route85PaletteBlack:
	faceplayer
	checkevent EVENT_PALETTE_BLACK_FOLLOWING
	sif true
		jumptext .already_following_text
	setevent EVENT_PALETTE_BLACK_FOLLOWING
	clearevent EVENT_ROUTE_85_POLICEMAN_GONE
	follow PLAYER, 7
	appear 6
	jumptext .text

.text
	ctxt "Hey."

	para "Just taking a"
	line "smoke break."

	para "<...>"

	para "Oh, what?"

	para "You found our"
	line "leader, really?"

	para "Lead the way."
	done

.already_following_text
	ctxt "So, are we going"
	line "or what?"
	done

Route85_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 7, 2, PHACELIA_EAST_EXIT
	warp_def 6, 61, 2, ROUTE_82_MONKEY
	warp_def 3, 57, 1, FIRELIGHT_F1

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 16, SIGNPOST_LOAD, Route85DirectionsSign
	signpost 7, 56, SIGNPOST_LOAD, Route85EntranceSign

.ObjectEvents: db 9
	person_event SPRITE_BIRDKEEPER, 8, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, Route85_Trainer_1, -1
	person_event SPRITE_PSYCHIC, 9, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8, PERSONTYPE_TRAINER, 2, Route85_Trainer_2, -1
	person_event SPRITE_ROCK, 7, 57, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 15, 40, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_OFFICER, 8, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 5, Route85Officer, EVENT_ROUTE_85_POLICEMAN_GONE
	person_event SPRITE_PALETTE_PATROLLER, 9, 52, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 5, Route85PaletteBlack, EVENT_ARRESTED_PALETTE_BLACK
	person_event SPRITE_POKE_BALL, 13, 61, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_STEEL_EATER, 0, EVENT_ROUTE_85_TM_STEEL_EATER
	person_event SPRITE_POKE_BALL, 15, 43, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ROLLOUT, 0, EVENT_ROUTE_85_TM_ROLLOUT
	person_event SPRITE_FRUIT_TREE, 6, 44, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 3, SITRUS_TREE_2, -1
