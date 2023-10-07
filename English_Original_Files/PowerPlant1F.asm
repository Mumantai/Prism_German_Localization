PowerPlant1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PowerPlant1FNPC1:
	ctxt "There's an ice Gym"
	line "that uses way too"
	para "many air"
	line "conditioners."

	para "That's one of the"
	line "reasons why this"
	para "place is being"
	line "maintained again."
	done

PowerPlant1F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $9, $e, 3, POWER_PLANT_LOBBY
	warp_def $9, $f, 3, POWER_PLANT_LOBBY
	warp_def $20, $14, 1, POWER_PLANT_2F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_SUPER_NERD, 36, 45, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, PowerPlant1FNPC1, -1
	person_event SPRITE_POKE_BALL, 38, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, THUNDER_RING, EVENT_POWER_PLANT_ITEM_THUNDER_RING
	person_event SPRITE_POKE_BALL, 5, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, X_SP_ATK, EVENT_POWER_PLANT_ITEM_X_SPECIALS
	person_event SPRITE_POKE_BALL,  4,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELECTIRIZER, EVENT_POWER_PLANT_ITEM_ELECTIRIZER
	person_event SPRITE_POKE_BALL, 13, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_CRYSTAL_BOLT, 0, EVENT_POWER_PLANT_TM_CRYSTAL_BOLT
