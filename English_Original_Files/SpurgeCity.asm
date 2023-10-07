SpurgeCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SPURGE_CITY
	return

SpurgeCityCitySign:
	ctxt "The city where"
	next "anything can"
	next "happen!"
	done

SpurgeCityOrphanageSign:
	ctxt "Orphanage"
	done

SpurgeCityCasinoSign:
	ctxt "Spurge Casino"
	next "Earn big bucks"
	next "inside!"
	done

SpurgeCityIslandSign:
	signpostheader 5
	done

SpurgeCityGymGuard:
	ctxt "I was told to"
	line "block the Gym"
	para "until the leader"
	line "returns."

	para "My legs are about"
	line "to get stiff."
	done

SpurgeCityNPC1:
	ctxt "I recently adopted"
	line "a #mon from the"
	cont "orphanage."

	para "It seems to have"
	line "bruises covering"
	cont "all of its body."
	done

SpurgeCityNPC2:
	ctxt "I heard a big"
	line "explosion earlier;"
	cont "what was that?"
	done

SpurgeCityNPC3:
	ctxt "zzz<...>"

	para "Oh, uh, what?"

	para "I must have fallen"
	line "asleep!"

	para "I lost the keys to"
	line "my apartment and I"
	para "have been looking"
	line "for them."

	para "It's been at least"
	line "half a day now."
	done

SpurgeCityNPC4:
	ctxt "Did you know?"

	para "Only a decade ago,"
	line "this city didn't"
	cont "exist."

	para "Look at it now!"

	para "Imagine it 20"
	line "years from now!"
	done

SpurgeCityNPC5:
	ctxt "I'm just tending to"
	line "the garden."

	para "They just keep on"
	line "building further"
	para "to the north, so I"
	line "keep on having to"
	cont "move it."
	done

SpurgeCitySwiftTMPerson:
	faceplayer
	opentext
	checkevent EVENT_GET_TM39
	sif true
		jumptext .after_TM_text
	writetext .offer_TM_text
	givetm TM_SWIFT + RECEIVED_TM
	setevent EVENT_GET_TM39
	closetextend

.offer_TM_text
	ctxt "What am I doing"
	line "over here?"

	para "Well, if you take"
	line "this TM, could you"
	para "please mind your"
	line "own business?"
	sdone

.after_TM_text
	ctxt "TM39 is Swift!"

	para "This attack will"
	line "never miss unless"
	para "the opponent uses"
	line "the moves Fly, Dig"
	cont "or Protect!"
	done

SpurgeCity_MapEventHeader:: db 0, 0

.Warps: db 9
	warp_def 23, 33, 1, SPURGE_POKECENTER
	warp_def 17, 20, 1, APARTMENTS_F1
	warp_def 17, 28, 1, SPURGE_GAME_CORNER
	warp_def 29, 5, 68, MOUND_B3F
	warp_def 23, 5, 1, SPURGE_HOUSE
	warp_def 5, 34, 1, SPURGE_GYM_1F
	warp_def 23, 12, 1, ORPHANAGE
	warp_def 25, 20, 1, SPURGE_MART
	warp_def 29, 6, 68, MOUND_B3F

.CoordEvents: db 0

.BGEvents: db 5
	signpost 25, 31, SIGNPOST_LOAD, SpurgeCityCitySign
	signpost 25, 11, SIGNPOST_LOAD, SpurgeCityOrphanageSign
	signpost 19, 29, SIGNPOST_LOAD, SpurgeCityCasinoSign
	signpost 27,  7, SIGNPOST_LOAD, SpurgeCityIslandSign
	signpost 12, 32, SIGNPOST_JUMPSTD, qrcode, QR_SPURGE

.ObjectEvents: db 7
	person_event SPRITE_SCHOOLBOY, 6, 34, SPRITEMOVEDATA_00, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityGymGuard, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_LASS, 28, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC1, -1
	person_event SPRITE_POKEFAN_M, 25, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC2, -1
	person_event SPRITE_SCHOOLBOY, 18, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC3, -1
	person_event SPRITE_SAILOR, 14, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC4, -1
	person_event SPRITE_BEAUTY, 7, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 3, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SpurgeCityNPC5, -1
	person_event SPRITE_PSYCHIC, 13, 28, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeCitySwiftTMPerson, -1
