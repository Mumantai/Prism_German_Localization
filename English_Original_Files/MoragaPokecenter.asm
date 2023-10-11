MoragaPokecenter_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaPokecenterNPC1:
	ctxt "They renovated"
	line "the nearby Power"
	cont "Plant."

	para "They even let the"
	line "#mon that were"
	cont "there stay!"

	para "I caught an"
	line "Electabuzz there!"
	done

MoragaPokecenterNPC2:
	ctxt "Collecting Rijon"
	line "badges?"

	para "Well, you've got a"
	line "tough road ahead"
	cont "of you."
	done

MoragaPokecenterNPC3:
	ctxt "If I ever open a"
	line "Gym, it'll be guys"
	cont "only."

	para "It will blow"
	line "everybody's mind."
	done

MoragaPokecenter_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $4, 6, MORAGA_TOWN
	warp_def $7, $5, 6, MORAGA_TOWN
	warp_def $0, $7, 1, POKECENTER_BACKROOM

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_JUMPSTD, 0, pokecenternurse, -1
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC1, -1
	person_event SPRITE_FISHING_GURU, 5, 6, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC2, -1
	person_event SPRITE_GENTLEMAN, 4, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MoragaPokecenterNPC3, -1
