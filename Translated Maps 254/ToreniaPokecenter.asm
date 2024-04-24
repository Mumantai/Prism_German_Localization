ToreniaPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

ToreniaPokecenterNPC1:
	ctxt "Warum bekommt so"
	line "eine neue Stadt,"
	para "sowas Altes wie"
	line "den Magnetzug?"
	para "Etwas Moderneres"
	line "wäre angebracht!"
	done

ToreniaPokecenterNPC2:
	ctxt "Ich habe nie Glück"
	line "in Brettspielen."
	para "Wie bei dem, in"
	line "der Pachisi-Halle."
	para "Da <``>sterbe<``> ich"
	line "immer zu."
	done

ToreniaPokecenterNPC3:
	ctxt "Diese Stadt ist"
	line "noch sehr neu."
	para "Deshalb gibt es"
	line "hier so viele enge"
	cont "Gassen und Wege."
	done

ToreniaPokecenter_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 7, 4, 6, TORENIA_CITY
	warp_def 7, 5, 6, TORENIA_CITY
	warp_def 0, 7, 1, POKECENTER_BACKROOM

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_GENTLEMAN, 7, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, ToreniaPokecenterNPC1, -1
	person_event SPRITE_ROCKER, 4, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, ToreniaPokecenterNPC2, -1
	person_event SPRITE_R_ENGINEER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, ToreniaPokecenterNPC3, -1