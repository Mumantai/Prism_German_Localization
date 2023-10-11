Route78_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route78HiddenItem:
	dw EVENT_ROUTE_78_HIDDENITEM_HYPER_POTION
	db HYPER_POTION

Route78DirectionsSign:
	stxt "<UP>  Phacelia City"
	next "<DOWN><LEFT> Ruins"
	next "<DOWN><RIGHT> Route 79"
	done

Route78IslandSign:
	signpostheader 7
	done

Route78NPC:
	ctxt "If you don't have a"
	line "way to get across"
	para "the water, your"
	line "only option is to"
	para "go back to the"
	line "quarry and then go"
	cont "east."
	done

Route78_Trainer_1:
	trainer EVENT_ROUTE_78_TRAINER_1, SWIMMERM, 3, .before_battle_text, .battle_won_text

	ctxt "This route is at"
	line "peak beauty when"
	cont "the sun sets<...>"
	done

.before_battle_text
	ctxt "Floating at the"
	line "cove is life."

	para "Some girls find"
	line "this place pretty"
	cont "romantic."
	done

.battle_won_text
	text "Dang."
	done

Route78_Trainer_2:
	trainer EVENT_ROUTE_78_TRAINER_2, SWIMMERM, 4, .before_battle_text, .battle_won_text

	ctxt "If only someone"
	line "was brave enough"
	para "to go deep into"
	line "those ruins<...>"

	para "Who knows what"
	line "discoveries lie"
	para "right underneath"
	line "us!"
	done

.before_battle_text
	ctxt "The ruins hold a"
	line "lot of mysteries."

	para "So I'm told."
	done

.battle_won_text
	ctxt "Fine."

	para "I'll just explore"
	line "the area myself."
	done

Route78_Trainer_3:
	trainer EVENT_ROUTE_78_TRAINER_3, SWIMMERF, 3, .before_battle_text, .battle_won_text

	ctxt "I wish I could"
	line "dive deep and see"
	para "all of those cute"
	line "water #mon!"
	done

.before_battle_text
	ctxt "The #mon found"
	line "here are beauties."
	done

.battle_won_text
	ctxt "Admire their inner"
	line "beauty, and not"
	para "their fighting"
	line "abilities."
	done

Route78_Trainer_4:
	trainer EVENT_ROUTE_78_TRAINER_4, SWIMMERF, 4, .before_battle_text, .battle_won_text

	ctxt "When you surf on"
	line "your #mon,"
	para "consider how it"
	line "really feels."

	para "You don't want to"
	line "break a good pal"
	cont "of yours, do you?"
	done

.before_battle_text
	ctxt "My surfboard"
	line "broke<...> again!"

	para "Now I can't surf!"
	done

.battle_won_text
	ctxt "You really added"
	line "salt to the wound."

	para "Who do you think"
	line "you are<...>?"
	done

Route78Guard:
	faceplayer
	opentext
	writetext .require_ID_text
	checkitem FAKE_ID
	sif false
		jumptext .no_ID_text
	setevent EVENT_NALJO_ID_GUARD
	writetext .ID_shown_text
	closetext
	playsound SFX_ENTER_DOOR
	applymovement 10, .enter_cave
	disappear 10
	end

.enter_cave
	step_up
	step_end

.require_ID_text
	ctxt "I can't let anybody"
	line "in here without a"
	cont "proper Naljo ID."
	sdone

.ID_shown_text
	ctxt "Thanks for showing"
	line "me your ID card."

	para "I'll now let you"
	line "visit the island."

	para "Is this your first"
	line "time visiting?"

	para "Well, Saxifrage is"
	line "where we lock up"
	para "those who commit"
	line "crimes: criminals!"

	para "You can look at"
	line "them, but please,"
	cont "don't feed them."

	para "After all, it's"
	line "like a zoo, but"
	cont "with fewer rights."
	sdone

.no_ID_text
	ctxt "You don't have"
	line "yours?"

	para "You're lucky I'm"
	line "nice to minors."

	para "Otherwise, I'd"
	line "arrest you right"
	cont "here on the spot."
	done

Route78_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 10, 2, PHACELIA_WEST_EXIT
	warp_def 21, 4, 1, RUINS_ENTRY
	warp_def 21, 14, 1, ROUTE_78_EAST_EXIT

.CoordEvents: db 0

.BGEvents: db 3
	signpost 8, 12, SIGNPOST_LOAD, Route78DirectionsSign
	signpost 11, 18, SIGNPOST_ITEM, Route78HiddenItem
	signpost 8, 8, SIGNPOST_LOAD, Route78IslandSign

.ObjectEvents: db 9
	person_event SPRITE_SWIMMER_GUY, 15, 9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 22, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, Route78_Trainer_2, -1
	person_event SPRITE_SWIMMER_GIRL, 20, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 2, Route78_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 25, 12, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 8, PERSONTYPE_GENERICTRAINER, 3, Route78_Trainer_4, -1
	person_event SPRITE_ROCK, 13, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_LASS, 6, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, Route78NPC, -1
	person_event SPRITE_POKE_BALL, 15, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DIG, 0, EVENT_ROUTE_78_TM28
	person_event SPRITE_POKE_BALL, 32, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_NOISE_PULSE, 0, EVENT_ROUTE_78_TM78
	person_event SPRITE_OFFICER, 22, 14, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route78Guard, EVENT_NALJO_ID_GUARD
