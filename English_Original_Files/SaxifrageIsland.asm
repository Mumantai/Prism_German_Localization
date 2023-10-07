SaxifrageIsland_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw MAPCALLBACK_NEWMAP, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SAXIFRAGE_ISLAND
	return

SaxifrageIslandHiddenItem:
	dw EVENT_SAXIFRAGE_ISLAND_HIDDENITEM_REVIVE
	db REVIVE

SaxifrageIslandDescriptionSign:
	ctxt "Island to protect"
	next "the public from"
	next "dangerous crimi-"
	next "nals"
	done

SaxifrageIslandNPC1:
	ctxt "The prisoners in"
	line "that jail come up"
	para "with the most"
	line "ridiculous tales."

	para "One inmate claims"
	line "that he sees a"
	para "pair of glowing"
	line "red eyes in the"
	cont "hallways at night."
	done

SaxifrageIslandNPC2:
	ctxt "I'm waiting for my"
	line "boyfriend's time to"
	cont "be up."

	para "I'll wait for him"
	line "forever, won't I?"
	done

SaxifrageIslandNPC3:
	ctxt "We've built a wall"
	line "that blocks the"
	para "entrance in order"
	line "to keep people"
	cont "from escaping."
	done

SaxifrageIslandNPC4:
	ctxt "Here's a hot tip"
	line "for you."

	para "You know that cave"
	line "entrance hidden in"
	para "the west side of"
	line "those ruins on"
	cont "Route 78?"

	para "Don't go in there"
	line "without wrapping"
	cont "up warm!"

	para "I tried hiking in"
	line "there in nothing"
	cont "but my swimsuit."

	para "My body has never"
	line "recovered to its"
	para "former, well-toned"
	line "work of art<...>"

	para "What, you don't"
	line "believe me?"

	para "You know, you're no"
	line "looker either."
	done

SaxifrageIslandArrest:
	checkevent EVENT_ARRESTED
	sif true
		end
	applymovement 11, .guard_approaches_player
	opentext
	writetext .show_ID_text
	takeitem FAKE_ID, 1
	waitbutton
	warp PRISON_F1, 20, 6
	showtext .arrested_text
	setevent EVENT_ARRESTED
	applymovement 4, .guard_leaves
	blackoutmod PRISON_F1
	disappear 4
	end

.guard_approaches_player
	step_left
	step_left
	step_left
	step_up
	turn_head_up
	step_end

.guard_leaves
	rept 7
		step_right
	endr
	step_end

.show_ID_text
	ctxt "Halt!"

	para "Let me see your"
	line "identification."

	para "<...>"

	para "Haha, oh, you're a"
	line "smart kid, huh?"

	para "A fake ID won't"
	line "work with me."

	para "I need you to come"
	line "with me."
	done

.arrested_text
	ctxt "I need you to stay"
	line "here."

	para "Don't consider this"
	line "an arrest."

	para "We're not sure of"
	line "what to do with"
	cont "you right now."

	para "We don't get many"
	line "kids coming to"
	cont "Saxifrage."

	para "Usually<...>"

	para "We get guys coming"
	line "through here all"
	para "the time claiming"
	line "they're here to"
	para "challenge Cadence"
	line "to a Gym Battle,"
	para "but what ends up"
	line "happening is them"
	para "trying to spring"
	line "their buddies out"
	cont "of prison."

	para "Now, I don't know"
	line "what purpose you"
	para "had in coming here"
	line "exactly, but we'll"
	para "figure that out"
	line "tomorrow."
	sdone

SaxifrageIslandPaletteBlue:
	faceplayer
	opentext
	checkevent EVENT_PALETTE_BLUE
	sif true
		jumptext .already_gave_key_text
	writetext .introduction_text
	verbosegiveitem CAGE_KEY, 1
	sif false
		jumptext .no_space_text
	setevent EVENT_PALETTE_BLUE
	endtext

.introduction_text
	ctxt "They got you too?"

	para "I was taken here,"
	line "Pink was taken to"
	para "Eagulou City, and"
	line "and Red<...> somehow"
	cont "managed to escape."

	para "<...>"

	para "You're asking how"
	line "I ended up here?"

	para "Well<...>"

	para "After I was sent"
	line "here, Varaneous,"
	para "the #mon that"
	line "Red woke up, came"
	para "and created that"
	line "path back there."

	para "Red did say that"
	line "Varaneous knew"
	para "where the other"
	line "Guardians were."

	para "Perhaps it's trying"
	line "to return the orbs"
	para "to the other"
	line "Guardians."

	para "But yes, using the"
	line "path it created, I"
	para "was able to escape"
	line "and ended up here."

	para "Oh yeah, I found"
	line "this thing inside"
	cont "the Warden's house."

	para "Please take it."

	para "Maybe Varaneous is"
	line "still around."

	para "I have the sinking"
	line "feeling that you"
	para "might be able to"
	line "tame it."
	sdone

.already_gave_key_text
	ctxt "Please look for"
	line "the Guardians."
	done

.no_space_text
	ctxt "Free some space in"
	line "your pack, if you"
	cont "would."
	done

SaxifrageIsland_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 23, 16, 1, PRISON_F1
	warp_def 35, 2, 2, SAXIFRAGE_GYM
	warp_def 11, 25, 1, SAXIFRAGE_POKECENTER
	warp_def 37, 27, 1, SAXIFRAGE_MART
	warp_def 19, 2, 4, SAXIFRAGE_EXITS
	warp_def 3, 26, 1, SAXIFRAGE_EXITS
	warp_def 3, 7, 1, SAXIFRAGE_WARDENS_HOUSE

.CoordEvents: db 1
	xy_trigger 0, 20, 2, SaxifrageIslandArrest

.BGEvents: db 2
	signpost 30, 18, SIGNPOST_LOAD, SaxifrageIslandDescriptionSign
	signpost 17, 8, SIGNPOST_ITEM, SaxifrageIslandHiddenItem

.ObjectEvents: db 11
	person_event SPRITE_PALETTE_PATROLLER, 20, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SaxifrageIslandPaletteBlue, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_OFFICER, 31, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC1, -1
	person_event SPRITE_LASS, 22, 21, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC2, -1
	person_event SPRITE_OFFICER, 24, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC3, -1
	person_event SPRITE_BOULDER, 25, 9, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 13, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 24, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 6, 13, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_BOULDER, 8, 28, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 22, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ARRESTED
	person_event SPRITE_HIKER, 39, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SaxifrageIslandNPC4, -1
