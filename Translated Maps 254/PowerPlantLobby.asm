PowerPlantLobby_MapScriptHeader:
 ;trigger count
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

PowerPlantLobbyNPC1:
	ctxt "Wir sind fast"
	line "fertig mit der"
	cont "Renovierung hier."
	para "Jetzt müssen wir"
	line "nur noch alle"
	para "#mon hier weg-"
	line "schaffen!"
	done

PowerPlantLobbyNPC2:
	ctxt "Gut das die Aus-"
	line "rüstung hier noch"
	cont "funktioniert."
	done

PowerPlantLobbyNPC3:
	ctxt "Beim kommenden"
	line "Update begleite"
	para "ich dich bei einer"
	line "Mission!"
	done

PowerPlantLobby_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $1d, $6, 1, ROUTE_60
	warp_def $1d, $7, 1, ROUTE_60
	warp_def $0, $e, 1, POWER_PLANT_1F

	;xy triggers
	db 0

	;signposts
	db 1
	signpost  6, 10, SIGNPOST_ITEM, PowerPlantHiddenItem

	;people-events
	db 4
	person_event SPRITE_LANCE, 22, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PowerPlantLance, -1
	person_event SPRITE_FISHING_GURU,  2, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, PowerPlantLobbyNPC1, -1
	person_event SPRITE_POKEFAN_M,  7,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TEXTFP, 0, PowerPlantLobbyNPC2, -1
	person_event SPRITE_SUPER_NERD, 25, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PowerPlantLobbyNPC3, -1