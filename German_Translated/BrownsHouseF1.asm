BrownsHouseF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

BrownsHouseF1Mom:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_BROWN
	sif false
		jumptext .not_fought_yet_text
	checkevent EVENT_GOT_TM90
	sif true
		jumptext .already_gave_TM_text
	writetext .give_TM_text
	setevent EVENT_GOT_TM90
	givetm TM_PRISM_SPRAY + RECEIVED_TM
	jumptext .after_TM_text

.not_fought_yet_text
	ctxt "Ich mache mir"
	line "Sorgen um meinen"
	cont "Sohn Brown."

	para "Wenn du Ihn siehst"
	line "lass mich wissen"
	cont "das Er OK ist."
	done

.give_TM_text
	ctxt "Was?"

	para "Brown ist in der"
	line "Mysteriösen Zone?"

	para "Er hätte auch"
	line "anrufen können<...>"
	para "Naja, wenigstens"
	line "gehts ihm gut."

	para "Nimm das als"
	line "Dankeschön."
	sdone

.after_TM_text
	ctxt "Diese TM enthält"
	line "eine spezielle"
	para "Attacke, genannt:"
	line "Prismaspray."

	para "Der Typ dieser"
	line "Attacke ist vom"
	cont "zufall abhängig."
	done

.already_gave_TM_text
	ctxt "Danke nochmal das"
	line "du meine Sorgen"
	cont "genommen hast."
	done

BrownsHouseF1_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $2, 1, SEASHORE_CITY
	warp_def $7, $3, 1, SEASHORE_CITY
	warp_def $0, $7, 1, BROWNS_HOUSE_F2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_REDS_MOM, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrownsHouseF1Mom, -1
