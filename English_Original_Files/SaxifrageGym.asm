SaxifrageGym_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .set_lights

.set_lights
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	sif true
		return
	scall SaxifrageGym_LightsOn1
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	sif true
		return
	scall SaxifrageGym_LightsOn2
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	sif true
		return
	scall SaxifrageGym_LightsOn3
	return

SaxifrageGym_LightsOn1:
	changeblock 6, 6, $d
	changeblock 8, 6, $1b
	changeblock 6, 8, $e
	end

SaxifrageGym_LightsOn2:
	changeblock 4, 4, $1d
	changeblock 4, 6, $e
	changeblock 6, 4, $1c
	end

SaxifrageGym_LightsOn3:
	changeblock 2, 0, $5
	changeblock 4, 0, $4
	changeblock 6, 0, $6
	changeblock 2, 2, $10
	changeblock 4, 2, $11
	changeblock 6, 2, $12
	end

SaxifrageGym_Trainer_1:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_1, GUITARISTF, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn3
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_3
	reloadmappart
	appear 2
	closetextend

.before_battle_text
	ctxt "This is the end"
	line "for you!"
	done

.battle_won_text
	ctxt "What?!"
	done

.turn_lights_on_text
	ctxt "I didn't stop you<...>"

	para "But I'm sure our"
	line "leader will!"
	sdone

.after_battle_text
	ctxt "So, uh<...>"

	para "Do you have a"
	line "band?"

	para "Can I join?"
	done

SaxifrageGym_Trainer_2:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_2, GUITARISTF, 2, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn2
	reloadmappart
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_2
	appear 3
	closetextend

.before_battle_text
	ctxt "I miss our daily"
	line "jams from back in"
	cont "the old days."

	para "I'll take my aggre-"
	line "ssion out on you!"
	done

.battle_won_text
	ctxt "Not angry enough!"
	done

.turn_lights_on_text
	ctxt "I suppose you can"
	line "fight the next guy"
	cont "coming up."
	sdone

.after_battle_text
	ctxt "Cadence was once"
	line "arrested for dis-"
	cont "turbing the peace."

	para "She was then given"
	line "this Gym because"
	para "she was the inmate"
	line "who treated her"
	cont "#mon the best."
	done

SaxifrageGym_Trainer_3:
	trainer EVENT_SAXIFRAGE_GYM_TRAINER_3, GUITARIST, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script:
	checkevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	sif false
		jumptext .after_battle_text
	opentext
	writetext .turn_lights_on_text
	playsound SFX_ENTER_DOOR
	scall SaxifrageGym_LightsOn1
	reloadmappart
	clearevent EVENT_SAXIFRAGE_LIGHT_OFF_1
	appear 4
	closetextend

.before_battle_text
	ctxt "Let's turn the"
	line "volume up!"
	done

.battle_won_text
	ctxt "Zapped out!"
	done

.turn_lights_on_text
	ctxt "Let me reveal the"
	line "next Trainer for"
	cont "you."
	sdone

.after_battle_text
	ctxt "Good luck, buddy!"

	para "You're gonna need"
	line "it, hahaha!"
	done

SaxifrageGymGuide:
	checkflag ENGINE_RAUCOUSBADGE
	sif true
		jumptextfaceplayer .won_badge_text
	jumptextfaceplayer .guide_text

.guide_text
	ctxt "Hi again!"

	para "This is Cadence."

	para "She started a rock"
	line "band way back."

	para "After their many"
	line "failures, they"
	para "decided to start"
	line "up their own Gym,"
	para "specializing in"
	line "Sound #mon."

	para "But there aren't"
	line "enough of those,"
	para "so they threw some"
	line "electric ones into"
	cont "the mix too."
	done

.won_badge_text
	ctxt "That battle was"
	line "rambunctious!"

	para "I had to put in"
	line "NRR 33 earplugs!"
	done

SaxifrageGymLeader:
	checkflag ENGINE_RAUCOUSBADGE
	sif true
		jumptextfaceplayer .already_beaten_text
	faceplayer
	opentext
	writetext .introduction_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer CADENCE, CADENCE_GYM
	startbattle
	reloadmapafterbattle
	opentext
	writetext .received_badge_text
	playwaitsfx SFX_TCG2_DIDDLY_5
	writetext .give_TM_text
	givetm TM_HYPER_VOICE + RECEIVED_TM
	setflag ENGINE_RAUCOUSBADGE
	jumptext .after_TM_text

.introduction_text
	ctxt "What's up?!"

	para "I'm Cadence."

	para "I use the power of"
	line "sound to enhance"
	para "the capabilities"
	line "of my #mon!"

	para "The power of sound"
	line "and music can"
	para "change how one"
	line "performs!"

	para "Look at you, you"
	line "probably don't even"
	para "know the"
	line "difference between"
	para "a sine wave and a"
	line "square wave!"

	para "No matter. I'm"
	line "taking you down!"
	sdone

.battle_won_text
	ctxt "Well, it appears"
	line "that my gig is up"
	cont "and I'm rocked out."

	para "Seems you've earned"
	line "yourself the proud"
	cont "Raucous Badge!"
	done

.received_badge_text
	ctxt "<PLAYER> received"
	line "Raucous Badge."
	done

.give_TM_text
	ctxt "Here's a TM that"
	line "gives you the"
	cont "power of sound!"
	sdone

.after_TM_text
	ctxt "TM79 is Hyper"
	line "Voice!"

	para "It's a strong sound"
	line "attack that'll make"
	para "your opponent's"
	line "ears pound!"
	done

.already_beaten_text
	ctxt "I'm going to start"
	line "writing some new"
	cont "songs!"

	para "My #mon can"
	line "help me make the"
	para "perfect rock out"
	line "song!"
	done

SaxifrageGym_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $d, $5, 2, SAXIFRAGE_ISLAND
	warp_def $d, $4, 2, SAXIFRAGE_ISLAND

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_CADENCE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SaxifrageGymLeader, EVENT_SAXIFRAGE_LIGHT_OFF_3
	person_event SPRITE_GUITARISTF, 5, 5, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_1, EVENT_SAXIFRAGE_LIGHT_OFF_2
	person_event SPRITE_GUITARISTF, 7, 7, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_2, EVENT_SAXIFRAGE_LIGHT_OFF_1
	person_event SPRITE_ROCKER, 9, 3, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TRAINER, 0, SaxifrageGym_Trainer_3, -1
	person_event SPRITE_GYM_GUY, 10, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SaxifrageGymGuide, -1
