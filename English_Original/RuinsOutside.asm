RuinsOutside_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RuinsOasis:
	opentext
	writetext .its_an_oasis_text
	yesorno
	closetext
	sif false
		end
	special ClearBGPalettes
	special HealParty
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	jumptext .party_healed_text

.its_an_oasis_text
	ctxt "It's an oasis!"

	para "Want to take a"
	line "relaxing dip?"
	done

.party_healed_text
	ctxt "That was soothing!"

	para "Your #mon are"
	line "now fully healed!"
	done

RuinsOutsideNPC:
	ctxt "There are several"
	line "hidden pits inside"
	cont "the Naljo ruins."

	para "You can jump over"
	line "pits to reach new"
	para "areas, and you can"
	line "also jump over"
	para "pits that haven't"
	line "been uncovered."

	para "That's just in"
	line "case you want to"
	cont "be careful."
	done

RuinsOutsideArchaeologist:
	faceplayer
	opentext
	checkitem PRISM_JEWEL
	sif true, then
		writetext .got_prism_jewel_text
		playwaitsfx SFX_DEX_FANFARE_50_79
		takeitem PRISM_JEWEL, 1
		giveitem FAKE_ID, 1
		writetext .received_fake_ID_text
		setevent EVENT_GOT_FAKE_ID
		special Special_BattleTowerFade
		disappear 2
		special Special_FadeInQuickly
		playwaitsfx SFX_EXIT_BUILDING
		reloadmap
		end
	sendif
	checkitem RED_JEWEL
	sif true
.got_any_jewel
		jumptext .wrong_jewel_text
	checkitem BLUE_JEWEL
	iftrue .got_any_jewel
	checkitem BROWN_JEWEL
	iftrue .got_any_jewel
	checkitem WHITE_JEWEL
	iftrue .got_any_jewel
	jumptext .introduction_text

.introduction_text
	ctxt "Hello, hello,"
	line "hellooo!"

	para "I am a revered"
	line "archaeologist!"

	para "Naljo has such"
	line "alluring history."

	para "Did you know?"

	para "These ruins used"
	line "to be a temple."

	para "Everyone in Naljo"
	line "would come here"
	para "to worship the"
	line "four Guardians,"
	para "but it's now in"
	line "a state of decay"
	para "because nobody is"
	line "using it anymore."

	para "If you bring me"
	line "something truly"
	para "exciting from the"
	line "inside, maybe I'll"
	cont "give you a reward."
	done

.wrong_jewel_text
	ctxt "Yes, yes, jewels"
	line "can be quite<...>"
	para "interesting, but"
	line "these don't seem"
	cont "to interest me."

	para "If you find a"
	line "truly fascinating"
	para "jewel, only then"
	line "I'll reward you."
	done

.got_prism_jewel_text
	ctxt "My word!"

	para "I've never seen"
	line "beauty like this"
	cont "before in my life!"

	para "Please<...> take this."

	para "With this, I don't"
	line "need it anymore."

	para "The man handed"
	line "you a Fake ID!"
	done

.received_fake_ID_text
	ctxt "As far as everyone"
	line "else is concerned,"
	para "you are now a true"
	line "Naljo citizen."

	para "I had to use it"
	line "to stay in this"
	para "region undetected"
	line "by certain people"
	para "who say they want"
	line "the past of this"
	cont "land destroyed."

	para "But now at last,"
	line "the Prism Jewel"
	cont "is in my hands,"
	para "and I can finally"
	line "return home!"

	para "Goodbye!"
	done

RuinsOutside_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 17, 54, 2, RUINS_ENTRY
	warp_def 17, 55, 2, RUINS_ENTRY
	warp_def 5, 30, 1, RUINS_F1
	warp_def 17, 6, 4, CLATHRITE_1F
	warp_def 17, 7, 4, CLATHRITE_1F
	warp_def 5, 31, 2, RUINS_F1

.CoordEvents: db 0

.BGEvents: db 36
	signpost 2, 7, SIGNPOST_READ, RuinsOasis
	signpost 3, 7, SIGNPOST_READ, RuinsOasis
	signpost 4, 7, SIGNPOST_READ, RuinsOasis
	signpost 5, 7, SIGNPOST_READ, RuinsOasis
	signpost 6, 7, SIGNPOST_READ, RuinsOasis
	signpost 6, 8, SIGNPOST_READ, RuinsOasis
	signpost 6, 9, SIGNPOST_READ, RuinsOasis
	signpost 6, 10, SIGNPOST_READ, RuinsOasis
	signpost 6, 11, SIGNPOST_READ, RuinsOasis
	signpost 6, 12, SIGNPOST_READ, RuinsOasis
	signpost 6, 13, SIGNPOST_READ, RuinsOasis
	signpost 6, 14, SIGNPOST_READ, RuinsOasis
	signpost 6, 15, SIGNPOST_READ, RuinsOasis
	signpost 6, 16, SIGNPOST_READ, RuinsOasis
	signpost 6, 18, SIGNPOST_READ, RuinsOasis
	signpost 6, 17, SIGNPOST_READ, RuinsOasis
	signpost 3, 18, SIGNPOST_READ, RuinsOasis
	signpost 2, 18, SIGNPOST_READ, RuinsOasis
	signpost 2, 41, SIGNPOST_READ, RuinsOasis
	signpost 3, 41, SIGNPOST_READ, RuinsOasis
	signpost 4, 41, SIGNPOST_READ, RuinsOasis
	signpost 4, 41, SIGNPOST_READ, RuinsOasis
	signpost 6, 43, SIGNPOST_READ, RuinsOasis
	signpost 6, 44, SIGNPOST_READ, RuinsOasis
	signpost 6, 45, SIGNPOST_READ, RuinsOasis
	signpost 6, 46, SIGNPOST_READ, RuinsOasis
	signpost 6, 47, SIGNPOST_READ, RuinsOasis
	signpost 6, 48, SIGNPOST_READ, RuinsOasis
	signpost 6, 49, SIGNPOST_READ, RuinsOasis
	signpost 6, 50, SIGNPOST_READ, RuinsOasis
	signpost 6, 51, SIGNPOST_READ, RuinsOasis
	signpost 6, 52, SIGNPOST_READ, RuinsOasis
	signpost 5, 52, SIGNPOST_READ, RuinsOasis
	signpost 4, 52, SIGNPOST_READ, RuinsOasis
	signpost 3, 52, SIGNPOST_READ, RuinsOasis
	signpost 2, 52, SIGNPOST_READ, RuinsOasis

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_M, 9, 6, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RuinsOutsideArchaeologist, EVENT_GOT_FAKE_ID
	person_event SPRITE_FISHER, 12, 46, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, RuinsOutsideNPC, -1
