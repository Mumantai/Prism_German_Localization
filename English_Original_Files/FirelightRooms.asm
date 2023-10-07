FirelightRooms_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FirelightRooms_Trainer_1:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_1, DELINQUENTM, 2, .before_battle_text, .battle_won_text

	ctxt "If only they made"
	line "shoes that let you"
	cont "walk on lava<...>"

	para "I bet they'd look"
	line "wicked!"
	done

.before_battle_text
	ctxt "The lava tide has"
	line "been known to rise"
	para "up to right where"
	line "we're standing!"

	para "We're living on the"
	line "edge here!"
	done

.battle_won_text
	ctxt "Darn it all."
	done

FirelightRooms_Trainer_2:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_2, DELINQUENTF, 1, .before_battle_text, .battle_won_text

	ctxt "I'm sweating<...>"

	para "For all the wrong"
	line "reasons!"
	done

.before_battle_text
	ctxt "It's too humid in"
	line "here; it's kinda"
	cont "cramping my style!"
	done

.battle_won_text
	ctxt "Aaand<...> I'm offi-"
	line "cially sweating."
	done

FirelightRooms_Trainer_3:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_3, COOLTRAINERM, 3, .before_battle_text, .battle_won_text

	ctxt "But if I called"
	line "myself lame<...>"

	para "People would then"
	line "think I'm lame!"
	done

.before_battle_text
	ctxt "Calling yourself"
	line "<``>cool<''> in your"
	para "moniker<...> you'd see"
	line "it as arrogant?"

	para "Nope!"
	done

.battle_won_text
	ctxt "It's ironic,"
	line "really."

	para "That's cool<...>"

	para "<...>right?"
	done

FirelightRooms_Trainer_4:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_4, FIREBREATHER, 2, .before_battle_text, .battle_won_text

	ctxt "My Magmar and I"
	line "like to get into"
	para "firebreathing"
	line "contests!"

	para "It took me years"
	line "to catch up to its"
	cont "ability."
	done

.before_battle_text
	ctxt "Nothing to burn"
	line "here, so it's the"
	para "perfect place to"
	line "practice!"
	done

.battle_won_text
	ctxt "Well, that's not"
	line "the way I wanted"
	cont "it, at all."
	done

FirelightRooms_Trainer_5:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_5, FIREBREATHER, 3, .before_battle_text, .battle_won_text

	ctxt "To be fair, who"
	line "creates a park"
	para "that's above a"
	line "volcano, anyway?"
	done

.before_battle_text
	ctxt "I was kicked out"
	line "of the park."

	para "They don't let me"
	line "perform my fire-"
	cont "breathing there."
	done

.battle_won_text
	text "Oy."
	done

FirelightRooms_Trainer_6:
	trainer EVENT_FIRELIGHT_ROOMS_TRAINER_6, COOLTRAINERF, 2, .before_battle_text, .battle_won_text

	ctxt "To the southwest"
	line "of here, there is"
	cont "a real cold place."

	para "This region sure"
	line "has interesting"
	cont "geography."
	done

.before_battle_text
	ctxt "I heard this was a"
	line "cool place to do"
	cont "some training."
	done

.battle_won_text
	ctxt "<``>Cool<''> meaning"
	line "<``>informal<''>, not"
	cont "temperature-wise."
	done

FirelightRooms_MapEventHeader:: db 0, 0

.Warps
	db 9
	warp_def 43, 33, 1, FIRELIGHT_PALLETPATH_B1F
	warp_def 33, 5, 1, FIRELIGHT_MINECART
	warp_def 49, 17, 2, FIRELIGHT_F1
	warp_def 7, 7, 8, FIRELIGHT_ROOMS
	warp_def 21, 25, 9, FIRELIGHT_ROOMS
	warp_def 51, 7, 1, FIRELIGHT_GROUDON
	warp_def 5, 47, 2, FIRELIGHT_ITEMROOM
	warp_def 37, 47, 4, FIRELIGHT_ROOMS
	warp_def 55, 53, 5, FIRELIGHT_ROOMS

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_POKE_BALL, 25, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SUNNY_DAY, 0, EVENT_FIRELIGHT_ROOMS_TM
	person_event SPRITE_POKE_BALL, 19, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BLACKGLASSES, EVENT_FIRELIGHT_ROOMS_ITEM_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 53, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_FIRELIGHT_ROOMS_ITEM_ELIXIR
	person_event SPRITE_DELINQUENTM, 44, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_1, -1
	person_event SPRITE_DELINQUENTF, 55, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_2, -1
	person_event SPRITE_YOUNGSTER, 29, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 4, FirelightRooms_Trainer_3, -1
	person_event SPRITE_FISHER, 4, 32, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 2, FirelightRooms_Trainer_4, -1
	person_event SPRITE_FISHER, 13, 49, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_5, -1
	person_event SPRITE_COOLTRAINER_F, 28, 48, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, FirelightRooms_Trainer_6, -1
