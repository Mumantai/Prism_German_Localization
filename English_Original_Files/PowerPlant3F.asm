PowerPlant3F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PowerPlant3FZapdos:
	faceplayer
	opentext
	writetext .cry_text
	cry ZAPDOS
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_ZAPDOS
	loadwildmon ZAPDOS, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_ZAPDOS
	disappear 2
	end

.cry_text
	ctxt "Gyaoo!!!"
	done

PowerPlant3F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $2, $3, 2, POWER_PLANT_2F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_ZAPDOS,  3, 10, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, PowerPlant3FZapdos, EVENT_ZAPDOS
	person_event SPRITE_POKE_BALL, 12,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, FAST_BALL, EVENT_POWER_PLANT_ITEM_FAST_BALLS
