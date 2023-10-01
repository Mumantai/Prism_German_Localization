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
	ctxt "Es ist eine Oase!"

	para "Dich im warmen"
	line "Wasser entspannen?"
	done

.party_healed_text
	ctxt "Das war beruigend!"

	para "Deine #mon sind"
	line "nun Topfit!"
	done

RuinsOutsideNPC:
	ctxt "Es gibt hier viele"
	line "versteckte Gruben."

	para "Du kannst über"
	line "diese Gruben hin-"
	para "weg springen um an"
	line "die andere Seite"
	para "zu gelangen. Das"
	line "gilt auch für noch"
	para "nicht entdeckte"
	line "Gruben!"

	para "Halte das im"
	line "Hinterkopf!"
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
	ctxt "Hallo, Hallo,"
	line "Haaallooo!"

	para "Ich bin ein Ruhm-"
	line "voller Archeologe."

	para "Naljo hat eine "
	line "sehr anziehende"
	cont "Geschichte!"

	para "Wusstest du,<...>"

	para "dass diese Ruinen"
	line "eigentlich ein"
	para "großer Tempel"
	line "sind?"

	para "Jeder in Naljo"
	line "kam früher hier"
	para "her und betete die"
	line "4 Wächter an."
	para "Nun zerfällt der"
	line "Tempel almählich,"
	para "da sich niemand"
	line "mehr darum kümmert"
	cont "<...>"

	para "Wenn du im Tempel"
	line "etwas sehr"
	para "interesanntes "
	line "findest, bring es"
	para "zu mir und du"
	line "kriegst was tolles"
	cont "von mir."
	done

.wrong_jewel_text
	ctxt "Nunja Juwelen sind"
	line "schon besonders<...>"
	para "Sind aber nicht"
	line "jene, nach denen"
	cont "ich suche<...>"

	para "Wenn du ein sehr"
	line "interesanntes"
	para "Juwel findest<...>"
	line "Dann sags mir!"
	done

.got_prism_jewel_text
	ctxt "DAS IST ES!"

	para "Ich habe noch nie"
	line "sowas schönes in"
	para "meinem leben"
	line "gesehen!"

	para "Bitte<...> nimm das."

	para "Damit brauche ich"
	line "das nicht mehr."

	para "Du erhälst einen"
	line "Fake Ausweis!"
	done

.received_fake_ID_text
	ctxt "Von nun an bist du"
	line "ein echter Naljo-"
	cont "Bürger!"

	para "Ich brauchte es um"
	line "in dieser Region"
	para "unbemerkt leben zu"
	line "können."

	para "Aber nun wo ich"
	line "das Prismajuwel in"
	cont "meinen Händen"
	para "halte, kann ich"
	line "wieder nach Hause!"

	para "Auf"
	line "Nimmerwiedersehen!"
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
