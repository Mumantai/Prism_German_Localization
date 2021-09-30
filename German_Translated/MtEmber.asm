MtEmber_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MtEmberMoltres:
	faceplayer
	opentext
	writetext .cry_text
	cry MOLTRES
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_MOLTRES
	loadwildmon MOLTRES, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_MOLTRES
	disappear 2
	end

.cry_text
	ctxt "Gyaoo!!!"
	done

MtEmber_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 21, 6, 2, MT_EMBER_ROOM_1
	warp_def 15, 30, 1, MT_EMBER_ROOM_2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_MOLTRES, 4, 31, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtEmberMoltres, EVENT_MOLTRES
	person_event SPRITE_POKE_BALL, 4, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, ULTRA_BALL, EVENT_MT_EMBER_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL, 34, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MOON_STONE, EVENT_MT_EMBER_ITEM_MOON_STONE
	person_event SPRITE_POKE_BALL, 16, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ANCIENTPOWER, 0, EVENT_MT_EMBER_TM_ANCIENTPOWER
