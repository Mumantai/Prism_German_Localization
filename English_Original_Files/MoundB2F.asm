MoundB2F_MapScriptHeader:
MoundB2FDark_MapScriptHeader::
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_NEWMAP, MoundCave_ResetFlash

MoundCave_ResetFlash:
	callasm .TryResetFlash
	return

.TryResetFlash
	ld a, [wPrevMapGroup]
	cp GROUP_MOUND_F1
	jr nz, .set_flash
	ld a, [wPrevMapNumber]
	cp MAP_MOUND_B1F
	jr z, .reset_flash
	cp MAP_MOUND_B2F
	jr z, .b2f_check
	cp MAP_MOUND_B3F
	jr z, .b3f_check
.set_flash
	SetEngine ENGINE_FLASH
	ret

.b2f_check
	ld a, [wPrevWarp]
	cp 59
	jr z, .set_flash
	jr .reset_flash

.b3f_check
	ld a, [wPrevWarp]
	cp 67
	jr z, .set_flash
	cp 69
	jr z, .set_flash
.reset_flash
	ResetEngine ENGINE_FLASH
	ret

MoundLightSwitch:
	checkflag ENGINE_FLASH
	sif true
		jumptext .already_on_text
	opentext
	writetext .description_text
	findpokemontype ELECTRIC
	sif false
		closetextend
	getpartymonname 0
	writetext .use_mon_text
	addvar -1
	copyvartobyte wCurPartyMon
	yesorno
	closetext
	sif false
		end
	fieldmovepokepic
	playwaitsfx SFX_FLASH
	callasm BlindingFlash
	end

.already_on_text
	ctxt "The lights in"
	line "the room are"
	cont "already on."
	done

.description_text
	ctxt "An Electric"
	line "#mon or move"
	para "could start this"
	line "light generator."
	sdone

.use_mon_text
	ctxt "Use <STRBF2> to"
	line "start the light"
	cont "generator?"
	done

MoundB2F_PaletteBlack:
	trainer EVENT_MOUND_B2F_PALETTE_BLACK, PATROLLER, 1, .before_battle_text, .battle_won_text

	ctxt "I don't know what"
	line "we're doing; all"
	para "I care about is"
	line "the money."
	done

.before_battle_text
	ctxt "I just do what"
	line "the boss says."

	para "If I get paid,"
	line "I won't complain."
	done

.battle_won_text
	text "<...>"
	done

MoundB2F_PaletteYellow:
	trainer EVENT_MOUND_B2F_PALETTE_YELLOW, PATROLLER, 3, .before_battle_text, .battle_won_text

	ctxt "My boyfriend,"
	line "Palette Green,"
	para "won't be happy"
	line "about this!"
	done

.before_battle_text
	ctxt "I'm a super hero!"
	done

.battle_won_text
	ctxt "No fair!"
	done

MoundB2F_MapEventHeader::
MoundB2FDark_MapEventHeader:: db 0, 0

.Warps
	db 66
	warp_def 3, 37, 2, MOUND_B1F
	warp_def 3, 15, 2, MOUND_B3F
	warp_def 43, 7, 3, MOUND_B3F
	warp_def 2, 13, 4, MOUND_B3F
	warp_def 3, 13, 5, MOUND_B3F
	warp_def 4, 14, 6, MOUND_B3F
	warp_def 4, 15, 7, MOUND_B3F
	warp_def 4, 16, 8, MOUND_B3F
	warp_def 4, 17, 9, MOUND_B3F
	warp_def 5, 17, 10, MOUND_B3F
	warp_def 5, 16, 11, MOUND_B3F
	warp_def 5, 15, 12, MOUND_B3F
	warp_def 5, 14, 13, MOUND_B3F
	warp_def 6, 13, 14, MOUND_B3F
	warp_def 7, 13, 15, MOUND_B3F
	warp_def 14, 12, 16, MOUND_B3F
	warp_def 14, 13, 17, MOUND_B3F
	warp_def 14, 14, 18, MOUND_B3F
	warp_def 14, 15, 19, MOUND_B3F
	warp_def 14, 16, 20, MOUND_B3F
	warp_def 14, 17, 21, MOUND_B3F
	warp_def 15, 19, 22, MOUND_B3F
	warp_def 16, 19, 23, MOUND_B3F
	warp_def 17, 19, 24, MOUND_B3F
	warp_def 18, 19, 25, MOUND_B3F
	warp_def 19, 19, 26, MOUND_B3F
	warp_def 20, 19, 27, MOUND_B3F
	warp_def 21, 17, 28, MOUND_B3F
	warp_def 21, 16, 29, MOUND_B3F
	warp_def 21, 15, 30, MOUND_B3F
	warp_def 21, 14, 31, MOUND_B3F
	warp_def 21, 13, 32, MOUND_B3F
	warp_def 21, 12, 33, MOUND_B3F
	warp_def 20, 10, 34, MOUND_B3F
	warp_def 19, 10, 35, MOUND_B3F
	warp_def 18, 10, 36, MOUND_B3F
	warp_def 17, 10, 37, MOUND_B3F
	warp_def 16, 10, 38, MOUND_B3F
	warp_def 15, 10, 39, MOUND_B3F
	warp_def 28, 18, 40, MOUND_B3F
	warp_def 29, 18, 41, MOUND_B3F
	warp_def 14, 10, 42, MOUND_B3F
	warp_def 14, 19, 43, MOUND_B3F
	warp_def 21, 10, 44, MOUND_B3F
	warp_def 21, 19, 45, MOUND_B3F
	warp_def 36, 5, 46, MOUND_B3F
	warp_def 36, 4, 47, MOUND_B3F
	warp_def 37, 4, 48, MOUND_B3F
	warp_def 38, 4, 49, MOUND_B3F
	warp_def 39, 4, 50, MOUND_B3F
	warp_def 40, 4, 51, MOUND_B3F
	warp_def 41, 4, 52, MOUND_B3F
	warp_def 41, 5, 53, MOUND_B3F
	warp_def 41, 6, 54, MOUND_B3F
	warp_def 41, 7, 55, MOUND_B3F
	warp_def 40, 8, 56, MOUND_B3F
	warp_def 40, 8, 57, MOUND_B3F
	warp_def 4, 13, 1, MOUND_B3F
	warp_def 5, 13, 59, MOUND_B3F
	warp_def 14, 11, 60, MOUND_B3F
	warp_def 14, 18, 61, MOUND_B3F
	warp_def 21, 11, 62, MOUND_B3F
	warp_def 21, 18, 63, MOUND_B3F
	warp_def 32, 19, 64, MOUND_B3F
	warp_def 40, 8, 65, MOUND_B3F
	warp_def 41, 27, 66, MOUND_B3F

.CoordEvents
	db 0

.BGEvents
	db 5
	signpost 11, 11, SIGNPOST_READ, MoundLightSwitch
	signpost 1, 19, SIGNPOST_READ, MoundLightSwitch
	signpost 1, 33, SIGNPOST_READ, MoundLightSwitch
	signpost 37, 27, SIGNPOST_READ, MoundLightSwitch
	signpost 41, 11, SIGNPOST_READ, MoundLightSwitch

.ObjectEvents
	db 6
	person_event SPRITE_POKE_BALL, 39, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, DYNAMITE, EVENT_MOUND_B2F_ITEM_DYNAMITE_1
	person_event SPRITE_POKE_BALL, 21, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, DYNAMITE, EVENT_MOUND_B2F_ITEM_DYNAMITE_2
	person_event SPRITE_POKE_BALL, 3, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, DYNAMITE, EVENT_MOUND_B2F_ITEM_DYNAMITE_3
	person_event SPRITE_POKE_BALL, 4, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ESCAPE_ROPE, EVENT_MOUND_B2F_ITEM_DYNAMITE_ESCAPE_ROPE
	person_event SPRITE_PALETTE_PATROLLER, 23, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 2, MoundB2F_PaletteBlack, EVENT_MOUND_B2F_PALETTE_BLACK
	person_event SPRITE_PALETTE_PATROLLER, 8, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_GENERICTRAINER, 2, MoundB2F_PaletteYellow, EVENT_MOUND_B2F_PALETTE_YELLOW
