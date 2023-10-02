HeathHouseTM35_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathHouseTM35NPC:
	faceplayer
	opentext
	checkevent EVENT_GET_TM35
	sif false, then
		writetext .before_giving_TM
		buttonsound
		givetm TM_SLEEP_TALK + RECEIVED_TM
		opentext
		setevent EVENT_GET_TM35
	sendif
	jumptext .after_giving_TM

.before_giving_TM
	ctxt "Zzz <...>"
	para "Wa-?"
	para "Oh, ich bin schon"
	line "viel zu lange"
	cont "am Pennen!"
	para "Nimm diese TM hier"
	line "als Entschädigung."
	done

.after_giving_TM
	ctxt "Diese TM enthält"
	line "Schlafrede."
	para "Dein #mon wird"
	line "im Schlaf eine"
	para "zufällige Attacke"
	line "einsetzen!"
	done

HeathHouseTM35_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $3, 4, HEATH_VILLAGE
	warp_def $7, $4, 4, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 11, 10, SIGNPOST_JUMPSTD, difficultbookshelf
	signpost 10, 11, SIGNPOST_JUMPSTD, difficultbookshelf

.ObjectEvents
	db 1
	person_event SPRITE_FISHER, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HeathHouseTM35NPC, -1