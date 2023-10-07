PhaceliaPoliceF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhaceliaPoliceF2Sign:
	ctxt "Naljo Police"

	para "To Protect and to"
	line "Serve"
	done

PhaceliaPoliceF2Officer:
	faceplayer
	opentext
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif true
		jumptext .after_arresting_black_text
	jumptext .before_arresting_black_text

.before_arresting_black_text
	ctxt "Please find a"
	line "Palette Patroller."
	done

.after_arresting_black_text
	ctxt "Hey, thanks for"
	line "helping me out."

	para "Hopefully we can"
	line "lock them all up"
	cont "one day very soon."
	done

PhaceliaPoliceF2_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $3, $5, 3, PHACELIA_POLICE_F1

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 2, 2, SIGNPOST_TEXT, PhaceliaPoliceF2Sign

	;people-events
	db 1
	person_event SPRITE_OFFICER, 1, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PhaceliaPoliceF2Officer, -1
