PhaceliaPoliceF2_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

PhaceliaPoliceF2Sign:
	ctxt "Naljo-Polizei"

	para "Zum Schutz und"
	line "Wohle des Volkes!"
	done

PhaceliaPoliceF2Officer:
	faceplayer
	opentext
	checkevent EVENT_ARRESTED_PALETTE_BLACK
	sif true
		jumptext .after_arresting_black_text
	jumptext .before_arresting_black_text

.before_arresting_black_text
	ctxt "Bitte finde eine"
	line "Paletten-"
	cont "Patrouille!"
	done

.after_arresting_black_text
	ctxt "Danke nochmal"
	line "für deine Hilfe."

	para "Hoffentlich"
	line "kriegen wir sie"
	para "eines Tages alle"
	line "dran!"
	done

PhaceliaPoliceF2_MapEventHeader ;filler
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
