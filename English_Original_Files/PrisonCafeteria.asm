PrisonCafeteria_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PrisonCafeteriaHiddenItem:
	dw EVENT_PRISON_CAFETERIA_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonCafeteriaNPC1:
	ctxt "I prepare the food"
	line "in the Cafeteria."

	para "I wouldn't eat this"
	line "slop myself, haha."
	done

PrisonCafeteriaNPC2:
	ctxt "-coughs-"

	para "The food got stuck"
	line "in my throat again"
	cont "due to my cold."

	para "I've heard rumors"
	line "of something warm"
	para "and fluffy being"
	line "hidden somewhere"
	cont "in the prison."

	para "Maybe it would"
	line "keep me warm."
	done

PrisonCafeteriaNPC3:
	ctxt "It's tough to stay"
	line "healthy with the"
	cont "slop they give us."

	para "It's very greasy,"
	line "and often gives me"
	cont "heartburn."
	done

PrisonCafeteriaNPC4:
	ctxt "Munch<...>"

	para "I'm surprised the"
	line "food is so good."

	para "After all, we're"
	line "mere inmates!"
	done

PrisonCafeteria_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 8, 0, 5, PRISON_F2
	warp_def 9, 0, 6, PRISON_F2

.CoordEvents: db 0

.BGEvents: db 1
	signpost 15, 16, SIGNPOST_ITEM, PrisonCafeteriaHiddenItem

.ObjectEvents: db 9
	person_event SPRITE_CLERK, 3, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonCafeteriaNPC1, -1
	person_event SPRITE_POKEFAN_M, 11, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonCafeteriaNPC2, -1
	person_event SPRITE_SUPER_NERD, 3, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonCafeteriaNPC3, -1
	person_event SPRITE_ROCKER, 6, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PrisonCafeteriaNPC4, -1
	person_event SPRITE_POKE_BALL, 4, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BURGER, EVENT_PRISON_CAFETERIA_ITEM_BURGER_1
	person_event SPRITE_POKE_BALL, 13, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BURGER, EVENT_PRISON_CAFETERIA_ITEM_BURGER_2
	person_event SPRITE_POKE_BALL, 13, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, BURGER, EVENT_PRISON_CAFETERIA_ITEM_BURGER_3
	person_event SPRITE_POKE_BALL, 13, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SODA_POP, EVENT_PRISON_CAFETERIA_ITEM_SODA_POP
	person_event SPRITE_POKE_BALL, 8, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, FRIES, EVENT_PRISON_CAFETERIA_ITEM_FRIES
