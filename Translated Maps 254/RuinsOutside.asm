RuinsOutside_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RuinsOutsideNPC:
	ctxt "In den Ruinen,"
	line "gibt es viele"
	cont "versteckte Löcher."
	para "Du kannst über die"
	line "Löcher springen,"
	para "um auf die andere"
	line "Seite zu kommen."
	para "Du kannst auch"
	line "über verdeckte"
	para "Löcher springen,"
	line "falls du von der"
	para "vorsichtigen Sorte"
	line "bist."
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
	ctxt "Hallo, hallo,"
	line "hallooo!"

	para "Ich bin ein"
	line "ruhmreicher"
	cont "Archäologe!"

	para "Naljo hat so eine"
	line "verlockende"
	cont "Geschichte."

	para "Wusstest du, dass"
	line "diese Ruinen mal"
	cont "ein Tempel waren?"

	para "Früher kamen die"
	line "Menschen aus ganz"
	para "Naljo hier her und"
	line "huldigten den vier"
	para "Wächtern, doch"
	line "jetzt ist er nur"
	cont "noch eine Ruine."

	para "Falls du drinnen"
	line "etwas wirklich"
	para "Aufregendes"
	line "findest und zu mir"
	para "bringst, kriegst"
	line "du vielleicht eine"
	cont "Belohnung von mir."
	done

.wrong_jewel_text
	ctxt "Ja, ja, Juwelen"
	line "können schon <...>"
	para "interessant sein,"
	line "aber diese hier"
	para "interessieren mich"
	line "nicht. Nur wenn du"
	para "ein wirklich"
	line "faszinierendes"
	para "Juwel findest,"
	line "kriegst du deine"
	cont "belohnung."
	done

.got_prism_jewel_text
	ctxt "Meine Güte!"

	para "In meinem Leben,"
	line "habe ich noch nie"
	para "etwas so Schönes"
	line "gesehen!"

	para "Bitte, nimm das."

	para "Ich habe jetzt"
	line "keine Verwendung"
	cont "mehr dafür."

	para "Der Mann gibt dir"
	line "einen gefälschten"
	cont "Ausweis!"
	done

.received_fake_ID_text
	ctxt "Für alle anderen"
	line "bist du jetzt ein"
	cont "Bürger von Naljo."
	para "Ich musste ihn"
	line "benutzen, um hier"
	para "unentdeckt von"
	line "gewissen Leuten zu"
	para "bleiben, die die"
	line "Vergangenheit"
	para "dieses Landes aus-"
	line "radieren wollen."
	para "Aber jetzt ist das"
	line "Prismajuwel"
	para "endlich in meinen"
	line "Händen und ich"
	para "kann endlich nach"
	line "Hause"
	cont "zurückkehren!"
	para "Leb wohl!"
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

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKEFAN_M, 9, 6, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RuinsOutsideArchaeologist, EVENT_GOT_FAKE_ID
	person_event SPRITE_FISHER, 12, 46, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, RuinsOutsideNPC, -1
	person_event SPRITE_POKE_BALL,  2, 53, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, LIGHT_CLAY, EVENT_RUINS_OUTSIDE_ITEM_LIGHT_CLAY