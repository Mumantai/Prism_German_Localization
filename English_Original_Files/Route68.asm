Route68_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route68HiddenItem:
	dw EVENT_ROUTE_68_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route68DirectionsSign:
	ctxt "<LEFT> Acania Docks"
	next "<RIGHT> Rijon Border"
	next "  (Hayward City)"
	done

Route68_Trainer_1:
	trainer EVENT_ROUTE_68_TRAINER_1, OFFICER, 4, .before_battle_text, .battle_won_text

	ctxt "Just don't cause"
	line "any problems in"
	cont "Rijon, please."

	para "Naljo already has"
	line "a pretty bad rep"
	cont "over there."
	done

.before_battle_text
	ctxt "You're thinking of"
	line "leaving Naljo?"

	para "Can you handle it?"
	done

.battle_won_text
	ctxt "Looks like it."
	done

Route68_Trainer_2:
	trainer EVENT_ROUTE_68_TRAINER_2, SWIMMERM, 15, .before_battle_text, .battle_won_text

	ctxt "What do you mean,"
	line "<``>you don't really"
	cont "recommend Naljo?<''>"
	done

.before_battle_text
	ctxt "I'm from Rijon,"
	line "just visiting to"
	cont "experience Naljo."
	done

.battle_won_text
	ctxt "Oh yeah, I also"
	line "like to battle"
	cont "people from Naljo."
	done

Route68_Trainer_3:
	trainer EVENT_ROUTE_68_TRAINER_3, SWIMMERM, 14, .before_battle_text, .battle_won_text

	ctxt "The water is"
	line "clearer here than"
	para "everywhere else in"
	line "Naljo."

	para "You can see the"
	line "#mon swimming"
	cont "below us!"
	done

.before_battle_text
	ctxt "This is my"
	line "favorite swimming"
	cont "spot!"
	done

.battle_won_text
	ctxt "Whoops."
	done

Route68_Trainer_4:
	trainer EVENT_ROUTE_68_TRAINER_4, SWIMMERF, 10, .before_battle_text, .battle_won_text

	ctxt "I don't dunk my"
	line "head, ever."

	para "My make-up would"
	line "wash off!"
	done

.before_battle_text
	ctxt "When swimming, I"
	line "do try to avoid"
	para "dunking my head in"
	line "the water."
	done

.battle_won_text
	ctxt "That was harsh."
	done

Route68_Trainer_5:
	trainer EVENT_ROUTE_68_TRAINER_5, SWIMMERF, 11, .before_battle_text, .battle_won_text

	ctxt "Some fly, some"
	line "dig, some swim."

	para "I prefer swimming."
	done

.before_battle_text
	ctxt "So glad they built"
	line "that dock town."

	para "I can rest between"
	line "my swim to Torenia"
	cont "from Hayward."
	done

.battle_won_text
	ctxt "Well, that tired"
	line "me out all right."
	done

Route68_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 5, 49, 1, NALJO_BORDER_WEST

.CoordEvents: db 0

.BGEvents: db 2
	signpost 7, 51, SIGNPOST_LOAD, Route68DirectionsSign
	signpost 14, 22, SIGNPOST_ITEM, Route68HiddenItem

.ObjectEvents: db 7
	person_event SPRITE_OFFICER, 6, 48, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route68_Trainer_1, -1
	person_event SPRITE_SWIMMER_GUY, 13, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route68_Trainer_2, -1
	person_event SPRITE_SWIMMER_GUY, 6, 9, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_3, -1
	person_event SPRITE_SWIMMER_GIRL, 11, 16, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_4, -1
	person_event SPRITE_SWIMMER_GIRL, 6, 34, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route68_Trainer_5, -1
	person_event SPRITE_FRUIT_TREE, 11, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_FRUITTREE, 0, SITRUS_TREE_1, -1
	person_event SPRITE_POKE_BALL, 7, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELIXIR, EVENT_ROUTE_68_ITEM_ELIXIR
