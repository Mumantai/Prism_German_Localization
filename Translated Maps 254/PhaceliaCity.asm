PhaceliaCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_PHACELIA_TOWN
	return

PhaceliaCityTownSign:
	ctxt "Noch nicht ganz"
	next "ein Dorf."
	done

PhaceliaCityMoveDeleterSign:
	ctxt "Attacken"
	next "verlerner."
	done

PhaceliaCityMachoke:
	faceplayer
	opentext
	writetext .text
	cry MACHOKE
	endtext

.text
	ctxt "Maschock: Rhahhh!"
	done

PhaceliaCityBlockingGuard:
	ctxt "Die Sicherheits-"
	line "maßnahmen sind"
	para "aktuell etwas"
	line "verschärft."
	para "<...>"
	para "WARTE<...>"
	para "Bist du eine"
	line "Paletten"
	cont "Patrouille?"
	para "Wir suchen nach"
	line "euch!"
	para "<...>"
	para "Oh, warte, du bist"
	line "nur undercover?"
	para "Oh, Ich sehe."
	para "OK, solange du zu"
	line "den guten gehörst"
	para "lass ich dich"
	line "natürlich rein."
	done

PhaceliaCityNPC1:
	ctxt "Dank unserer"
	line "Gewerkschaft, darf"
	para "ich jeden Tag"
	line "15m Pause machen."
	done

PhaceliaCityNPC2:
	ctxt "Ich will zu Andres"
	line "Crew gehören eines"
	cont "schönen Tages!"
	para "Er wurde durch die"
	line "Machomei groß-"
	para "gezogen und kennt"
	line "daher seine wahre"
	cont "Familie nicht."
	para "Er ist halb Mensch"
	line "& Halb Machomei!"
	done

PhaceliaCity_MapEventHeader:: db 0, 0

.Warps
	db 10
	warp_def $3, $a, 3, MILOS_F1
	warp_def $5, $1c, 1, PHACELIA_GYM
	warp_def $7, $5, 1, PHACELIA_POLICE_F1
	warp_def $9, $f, 1, PHACELIA_POKECENTER
	warp_def $7, $19, 1, PHACELIA_MART
	warp_def $15, $6, 1, PHACELIA_WEST_EXIT
	warp_def $15, $b, 1, PHACELIA_MOVE_DELETER
	warp_def $13, $19, 1, PHACELIA_TM20
	warp_def $1d, $f, 1, PHACELIA_SOLROCK_TRADE
	warp_def $19, $20, 1, PHACELIA_EAST_EXIT

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 20, 18, SIGNPOST_LOAD, PhaceliaCityTownSign
	signpost 22, 10, SIGNPOST_LOAD, PhaceliaCityMoveDeleterSign

.ObjectEvents
	db 11
	person_event SPRITE_ROCK, 9, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 22, 16, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 27, 22, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_BOULDER, 17, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_POKE_BALL, 15, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ENERGY_BALL, 0, EVENT_PHACELIA_TM54
	person_event SPRITE_FRUIT_TREE, 4, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_FRUITTREE, 0, ASPEAR_TREE_1, -1
	person_event SPRITE_MACHOKE, 25, 17, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PhaceliaCityMachoke, -1
	person_event SPRITE_OFFICER, 6, 28, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, PhaceliaCityBlockingGuard, EVENT_ARRESTED_PALETTE_BLACK
	person_event SPRITE_OFFICER, 4, 10, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, PhaceliaCityBlockingGuard, EVENT_ARRESTED_PALETTE_BLACK
	person_event SPRITE_FISHER, 17, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaCityNPC1, -1
	person_event SPRITE_BLACK_BELT, 12, 13, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhaceliaCityNPC2, -1