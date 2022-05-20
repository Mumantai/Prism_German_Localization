GoldenrodPokecenter_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

GoldenrodPokecenterNPC1:
	ctxt "Ich half beim "
	line "Wiederaufbau "
	para "Dukatias nach dem "
	line "schweren Erdbeben "
	para "vor einigen "
	line "Jahren."

	para "Wir sind noch "
	line "nicht fertig, denn"
	para "wir müssen noch "
	line "den Radioturm "
	cont "wieder aufbauen."

	done

GoldenrodPokecenterNPC2:
	ctxt "Vor dem Erdbeben, "
	line "konntest du mit "
	para "deinem Radio die "
	line "Musik aus dem "
	para "Radioturm "
	line "empfangen!"

	done

GoldenrodPokecenterNPC3:
	ctxt "Die Artenvielfalt "
	line "unter den #mon "
	para "wächst, denn es "
	line "gibt immer neue "
	para "#mon zu "
	line "entdecken."

	done

GoldenrodPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 3, GOLDENROD_CITY
	warp_def $7, $5, 3, GOLDENROD_CITY
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_BLACK_BELT, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 6, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC2, -1
	person_event SPRITE_FISHER, 4, 0, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, GoldenrodPokecenterNPC3, -1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
