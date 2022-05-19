AcquaExitChamber_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_pokecenter

.set_pokecenter
	blackoutmod CAPER_CITY
	return

AcquaExitChamberNPC:
	faceplayer
	opentext
	checkevent EVENT_ACQUA_BERRY_MAN
	sif true
		jumptext .after_giving_berry_text
	writetext .opening_text
	yesorno
	sif false
		jumptext .declined_text
	writetext .before_giving_berry_text
	verbosegiveitem ORAN_BERRY, 1
	sif false
		closetextend
	setevent EVENT_ACQUA_BERRY_MAN
	waitbutton
	jumptext .after_giving_berry_text

.opening_text
	ctxt "Na was sehe ich"
	line "denn da?"

	para "Ein frischer"
	line "Trainer!"

	para "Ich habe hier"
	line "etwas ganz Tolles"
	cont "für dich!"
	done

.before_giving_berry_text
	ctxt "Es ist eine Beere!"

	para "Eine Sinelbeere,"
	line "um genau zu sein!"

	para "#mon lieben"
	line "die Dinger!"
	prompt

.after_giving_berry_text
	ctxt "Trägt ein #mon"
	line "eine Beere, hilft"
	cont "es ihm während des"
	cont "Kampfes!"

	para "Es setzt sie von"
	line "ganz alleine ein!"
	done

.declined_text
	ctxt "Hä, dann behalt"
	line "ich es eben <...>"
	done

AcquaExitChamber_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, 3, 2, CAPER_CITY
	dummy_warp 3, 5

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcquaExitChamberNPC, -1
