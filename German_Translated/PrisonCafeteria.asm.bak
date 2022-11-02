PrisonCafeteria_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PrisonCafeteriaHiddenItem:
	dw EVENT_PRISON_CAFETERIA_HIDDENITEM_CAGE_KEY
	db CAGE_KEY

PrisonCafeteriaNPC1:
	ctxt "Ich bereite das"
	line "Essen hier in der"
	cont "Kantine vor."

	para "Diesen Fraß würde"
	line "ich selbst niemals"
	cont "essen. Haha!"
	done

PrisonCafeteriaNPC2:
	ctxt "-Würg-"

	para "Wegen meiner Er-"
	line "kältung ist mir"
	para "das Essen im Hals"
	line "stecken geblieben."

	para "Die Gerüchte be-"
	line "sagen, es gäbe was"
	para "Warmes & Fluffiges"
	line "versteckt irgend-"
	cont "wo im Gefängnis."

	para "Vieleicht hält"
	line "mich das ja warm."
	done

PrisonCafeteriaNPC3:
	ctxt "Bei diesem Fraß"
	line "ist es unmöglich,"
	cont "gesund zu bleiben."

	para "Es ist fettig und"
	line "löst bei mir so"
	cont "ein Herzrasen aus."
	done

PrisonCafeteriaNPC4:
	ctxt "Mampf <...>"

	para "Ich bin überascht,"
	line "dass das Essen so"
	cont "gut schmeckt."

	para "Wir sind ja hier"
	line "nur Insassen!"
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
