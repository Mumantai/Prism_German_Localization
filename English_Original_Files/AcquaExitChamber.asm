AcquaExitChamber_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw 5, .set_pokecenter

.set_pokecenter
	blackoutmod CAPER_RIDGE
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
	ctxt "What ho and"
	line "what ho!"

	para "A fellow traveler!"

	para "Would you like"
	line "me to share one"
	cont "of my treasures?"
	done

.before_giving_berry_text
	ctxt "It's a Berry!"

	para "An Oran Berry, to"
	line "be specific!"

	para "#mon love to"
	line "eat these things!"
	prompt

.after_giving_berry_text
	ctxt "Attaching Berries"
	line "to your #mon"
	cont "can help you"
	cont "during a battle."

	para "Using one won't"
	line "even waste a turn!"
	done

.declined_text
	ctxt "Gah, well I guess"
	line "I'll keep it<...>"
	done

AcquaExitChamber_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $b, 3, 2, CAPER_RIDGE
	dummy_warp 3, 5

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcquaExitChamberNPC, -1
