PowerPlant_MapScriptHeader;trigger count
	db 2
	maptrigger .first_time_event_trigger
	maptrigger GenericDummyScript
 ;callback count
	db 0

.first_time_event_trigger
	priorityjump PowerPlantWalkToLance
	end

PowerPlantHiddenItem:
	dw EVENT_POWER_PLANT_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

PowerPlantWalkToLance:
	applymovement PLAYER, PowerPlantWalkLance
	spriteface 2, LEFT
	dotrigger 1
PowerPlantLance:
	jumptextfaceplayer .text

.text
	ctxt "Bei einem neuen"
	line "Update für #mon"
	para "Prisma habe ich ne"
	line "Mission für dich."

	para "Updates:"
	line "Discord.gg/VHaA2Zr"
	done

PowerPlantWalkLance:
	rept 7
		step_up
	endr
	rept 7
		step_right
	endr
	step_end

PowerPlantNPC1:
	ctxt "Wir sind fast"
	line "fertig mit der"
	cont "Renovierung hier."

	para "Jetzt müssen wir"
	line "nur noch alle"
	para "#mon hier weg-"
	line "schaffen!"
	done

PowerPlantNPC2:
	ctxt "Gut, dass die Aus-"
	line "rüstung hier noch"
	cont "funktioniert."

	done

PowerPlantNPC3:
	ctxt "Es gibt eine Eis-"
	line "Arena, die viel zu"
	para "viele Klimageräte"
	line "einsetzt."

	para "Der hohe Strom-"
	line "bedarf ist der"
	para "Grund, warum das"
	line "hier wieder In-"
	para "standgehalten"
	line "wird."
	done

PowerPlantNPC4:
	ctxt "Beim kommenden"
	line "Update begleite"
	para "ich dich bei einer"
	line "Mission!"
	done

PowerPlant_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $27, $6, 1, ROUTE_60
	warp_def $27, $7, 1, ROUTE_60

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 16, 10, SIGNPOST_ITEM, PowerPlantHiddenItem

	;people-events
	db 10
	person_event SPRITE_LANCE, 32, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PowerPlantLance, -1
	person_event SPRITE_FISHING_GURU, 12, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PowerPlantNPC1, -1
	person_event SPRITE_POKEFAN_M, 17, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PowerPlantNPC2, -1
	person_event SPRITE_SUPER_NERD, 37, 47, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PowerPlantNPC3, -1
	person_event SPRITE_SUPER_NERD, 35, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PowerPlantNPC4, -1
	person_event SPRITE_POKE_BALL, 35, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, FAST_BALL, EVENT_POWER_PLANT_ITEM_FAST_BALLS
	person_event SPRITE_POKE_BALL, 35, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, THUNDER_RING, EVENT_POWER_PLANT_ITEM_THUNDER_RING
	person_event SPRITE_POKE_BALL, 5, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, X_SPECIAL, EVENT_POWER_PLANT_ITEM_X_SPECIALS
	person_event SPRITE_POKE_BALL, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ELECTIRIZER, EVENT_POWER_PLANT_ITEM_ELECTIRIZER
	person_event SPRITE_POKE_BALL, 13, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_CRYSTAL_BOLT, 0, EVENT_POWER_PLANT_TM_CRYSTAL_BOLT
