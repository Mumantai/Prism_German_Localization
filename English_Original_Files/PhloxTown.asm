PhloxTown_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2

	dbw 5, .set_fly_flag
	dbw MAPCALLBACK_TILES, .open_lab_door

.set_fly_flag
	setflag ENGINE_FLYPOINT_PHLOX_TOWN
	return

.open_lab_door
	checkevent EVENT_PHLOX_LAB_UNLOCKED
	sif true
		changeblock 14, 4, $17
	return

PhloxTownBingoSign:
	ctxt "Bingo Hall"
	done

PhloxTownAcquaMinesSign:
	ctxt "Acqua Mines"
	done

PhloxTownLabSign:
	ctxt "Algernon"
	next "Laboratories"
	done

PhloxTownTownSign:
	ctxt "The quiet"
	next "mountain ridge"
	done

PhloxTownNPC1:
	ctxt "It's always cold up"
	line "in these parts."

	para "Even during the"
	line "middle of summer."
	done

PhloxTownNPC2:
	ctxt "We were totally"
	line "fine with living"
	cont "in seclusion."

	para "Why does everyone"
	line "want to put every-"
	cont "thing together?"

	para "Can't anything ever"
	line "just stand alone"
	cont "anymore?"
	done

PhloxTownNPC3:
	ctxt "That building was"
	line "built on my best"
	cont "fishing spot!"

	para "They had a permit,"
	line "so I can't be too"
	cont "upset, I guess<...>"
	done

PhloxTownNPC4:
	ctxt "There's a secluded"
	line "underground cave"
	cont "around here."

	para "Sometimes, during"
	line "the day, it's"
	cont "totally flooded!"
	done

PhloxTownLabDoor:
	opentext
	checkevent EVENT_PHLOX_LAB_UNLOCKED
	sif true
		jumptext .already_unlocked_text
	checkitem LAB_CARD
	sif false
		jumptext .locked_text
	setevent EVENT_PHLOX_LAB_UNLOCKED
	playsound SFX_TRANSACTION
	writetext .unlocked_door_text
	closetext
	changeblock 14, 4, $17
	reloadmappart
	end

.unlocked_door_text
	ctxt "You unlocked the"
	line "door with the Lab"
	cont "Card!"
	sdone

.locked_text
	ctxt "The door is"
	line "locked."
	done

.already_unlocked_text
	ctxt "The door's already"
	line "unlocked."
	done

PhloxTownBoyfriend:
	ctxt "My girlfriend was"
	line "supposed to meet"
	para "me here by the lab"
	line "not long ago."

	para "She called to say"
	line "she was here, but<...>"

	para "Maybe she wandered"
	line "off somewhere."
	done

PhloxTown_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 17, 13, 1, PHLOX_POKECENTER
	warp_def 23, 29, 1, PHLOX_MART
	warp_def 5, 14, 1, PHLOX_LAB_1F
	warp_def 27, 7, 2, PHLOX_ENTRY
	warp_def 23, 21, 1, PHLOX_BINGO
	warp_def 15, 21, 1, PHLOX_MYLES
	warp_def 9, 27, 2, ACQUA_PHLOXENTRANCE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 25, 19, SIGNPOST_LOAD, PhloxTownBingoSign
	signpost 9, 23, SIGNPOST_LOAD, PhloxTownAcquaMinesSign
	signpost 5, 11, SIGNPOST_LOAD, PhloxTownLabSign
	signpost 29, 13, SIGNPOST_LOAD, PhloxTownTownSign
	signpost 5, 14, SIGNPOST_READ, PhloxTownLabDoor

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_M, 13, 30, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC1, -1
	person_event SPRITE_YOUNGSTER, 29, 19, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC2, -1
	person_event SPRITE_FISHING_GURU, 6, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC3, -1
	person_event SPRITE_POKEFAN_F, 16, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownNPC4, -1
	person_event SPRITE_COOLTRAINER_M, 10, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, PhloxTownBoyfriend, -1
