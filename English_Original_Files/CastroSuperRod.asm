CastroSuperRod_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

CastroSuperRodNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPERROD
	sif true
		jumptext .after_rod_text
	writetext .love_fishing_text
	giveitem SUPER_ROD, 1
	sif false
		jumptext .no_space_text
	writetext .received_rod_text
	playwaitsfx SFX_ITEM
	itemnotify
	setevent EVENT_GOT_SUPERROD
	endtext

.after_rod_text
	ctxt "If you see any of"
	line "my family, say hi!"
	done

.love_fishing_text
	ctxt "You love fishing?"

	para "Well then, take"
	line "this gift!"
	sdone

.received_rod_text
	ctxt "<PLAYER> received"
	line "Super Rod!"
	done

.no_space_text
	ctxt "Free some space!"
	done

CastroSuperRod_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 8, CASTRO_VALLEY
	warp_def $7, $3, 8, CASTRO_VALLEY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CastroSuperRodNPC, -1
