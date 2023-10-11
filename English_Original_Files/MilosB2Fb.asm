MilosB2Fb_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, SetBlocksB2fb

SetBlocksB2fb:
	checkevent EVENT_0
	sif true
		scall MilosB2Fb_RedOff
	checkevent EVENT_1
	sif true
		scall MilosB2Fb_YellowOff
	checkevent EVENT_2
	sif true
		scall MilosB2Fb_GreenOff
	checkevent EVENT_3
	sif true
		scall MilosB2Fb_BrownOff
	return

MilosB2Fb_RedOn:
	changeblock $c, $6, $6a
	changeblock $8, $a, $6a
	changeblock $0, $12, $6a
	changeblock $12, $16, $6a
	changeblock $8, $1e, $6a
	changeblock $c, $8, $67
	changeblock $c, $a, $68
	changeblock $4, $10, $67
	changeblock $4, $12, $68
	changeblock $12, $18, $67
	changeblock $12, $1a, $68
	changeblock $4, $6, $83
	changeblock $18, $16, $83
	changeblock $c, $1e, $83
	end

MilosB2Fb_RedOff:
	changeblock $c, $6, $6b
	changeblock $8, $a, $6b
	changeblock $0, $12, $6b
	changeblock $12, $16, $6b
	changeblock $8, $1e, $6b
	changeblock $c, $8, $52
	changeblock $c, $a, $51
	changeblock $4, $10, $52
	changeblock $4, $12, $51
	changeblock $12, $18, $52
	changeblock $12, $1a, $51
	changeblock $4, $6, $50
	changeblock $18, $16, $50
	changeblock $c, $1e, $50
	end

MilosB2Fb_YellowOn:
	changeblock $4, $16, $76
	changeblock $c, $14, $7d
	changeblock $c, $16, $7e
	changeblock $2, $1a, $7d
	changeblock $2, $1c, $7e
	end

MilosB2Fb_YellowOff:
	changeblock $4, $16, $77
	changeblock $c, $14, $52
	changeblock $c, $16, $51
	changeblock $2, $1a, $52
	changeblock $2, $1c, $51
	end

MilosB2Fb_GreenOn:
	changeblock $c, $12, $7b
	changeblock $6, $1a, $4c
	changeblock $30, $18, $30
	end

MilosB2Fb_GreenOff:
	changeblock $c, $12, $36
	changeblock $6, $1a, $50
	changeblock $30, $18, $52
	changeblock $30, $1a, $51
	end

MilosB2Fb_BrownOn:
	changeblock $10, $16, $33
	changeblock $12, $1e, $33
	changeblock $12, $22, $4d
	changeblock $a, $12, $4d
	changeblock $8, $18, $49
	changeblock $8, $1a, $48
	end

MilosB2Fb_BrownOff:
	changeblock $10, $16, $32
	changeblock $12, $1e, $32
	changeblock $12, $22, $82
	changeblock $a, $12, $82
	changeblock $8, $18, $52
	changeblock $8, $1a, $51
	end

MilosB2FbRedSwitch:
	opentext
	farwritetext MilosB2F_Text_PulledRedSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_0, MilosB2Fb_RedOff, MilosB2Fb_RedOn
	reloadmappart
	closetextend

MilosB2FbYellowSwitch:
	opentext
	farwritetext MilosB2F_Text_PulledYellowSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_1, MilosB2Fb_YellowOff, MilosB2Fb_YellowOn
	reloadmappart
	closetextend

MilosB2FbGreenSwitch:
	opentext
	farwritetext MilosB2F_Text_PulledGreenSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_2, MilosB2Fb_GreenOff, MilosB2Fb_GreenOn
	reloadmappart
	closetextend

MilosB2FbBrownSwitch:
	opentext
	farwritetext MilosB2F_Text_PulledBrownSwitch
	playwaitsfx SFX_STOP_SLOT
	toggle EVENT_3, MilosB2Fb_BrownOff, MilosB2Fb_BrownOn
	reloadmappart
	closetextend

MilosB2FbLatinSign1:
	jumptext .text

.text
	text "INVICTVS MANEO"
	done

MilosB2FbLatinSign2:
	jumptext .text

.text
	text "NON PROGREDI EST"
	line "REGREDI"
	done

MilosB2FbLatinSign3:
	jumptext .text

.text
	text "SEMPER FORTIS"
	done

MilosB2FbLatinSign4:
	jumptext .text

.text
	text "HONOR VIRTVTIS"
	line "PRAEMIVM"
	done

MilosB2FbJumpingShoes:
	opentext
	writetext .found_item_text
	playwaitsfx SFX_DEX_FANFARE_80_109
	disappear 2
	writetext .description_text
	setevent EVENT_JUMPING_SHOES
	playsound SFX_STRENGTH
	toggle EVENT_0, MilosB2Fb_RedOff, MilosB2Fb_RedOn
	toggle EVENT_1, MilosB2Fb_YellowOff, MilosB2Fb_YellowOn
	toggle EVENT_2, MilosB2Fb_GreenOff, MilosB2Fb_GreenOn
	toggle EVENT_3, MilosB2Fb_BrownOff, MilosB2Fb_BrownOn
	reloadmappart
	earthquake 20
	jumptext .all_switches_flipped_text

.found_item_text
	ctxt "You found the"
	line "Jumping Shoes!"
	done

.description_text
	ctxt "When you reach a"
	line "small gap, press"
	para "A to jump over"
	line "it!"
	sdone

.all_switches_flipped_text
	ctxt "Uh oh!"

	para "Picking up the"
	line "shoes reversed"
	para "all of the"
	line "switches!"
	done

MilosB2Fb_GreenPatroller:
	trainer EVENT_MILOS_B2FB_TRAINER_1, PATROLLER, 13, .before_battle_text, .battle_won_text

	ctxt "Cut the optimism;"
	line "you need a real"
	cont "reality check."

	para "Just who are you"
	line "without your dear"
	cont "#mon, huh?"
	done

.before_battle_text
	ctxt "Oh, it's you again."

	para "I saw this coming."

	para "We all did."

	para "If you think for"
	line "a second you're"
	cont "getting past me,"

	para "then you'll be"
	line "sadly mistaken."
	done

.battle_won_text
	ctxt "That's pathetic."

	para "You're pathetic."
	done

MilosB2Fb_BlackPatroller:
	trainer EVENT_MILOS_B2FB_TRAINER_2, PATROLLER, 2, .before_battle_text, .battle_won_text

	ctxt "I'm intriguing, but"
	line "nobody wants to"
	cont "understand me<...>"
	done

.before_battle_text
	ctxt "Can you pay some"
	line "attention to me"
	para "while I pretend"
	line "that I don't care?"
	done

.battle_won_text
	ctxt "Real talk, that's"
	line "kinda unfair<...>"
	done

MilosB2Fb_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 3, 19, 4, MILOS_B1F
	warp_def 3, 27, 4, MILOS_F1

.CoordEvents: db 0

.BGEvents: db 17
	signpost 6, 12, SIGNPOST_LEFT, MilosB2FbRedSwitch
	signpost 10, 8, SIGNPOST_LEFT, MilosB2FbRedSwitch
	signpost 22, 18, SIGNPOST_LEFT, MilosB2FbRedSwitch
	signpost 30, 8, SIGNPOST_LEFT, MilosB2FbRedSwitch
	signpost 18, 0, SIGNPOST_LEFT, MilosB2FbRedSwitch
	signpost 22, 4, SIGNPOST_LEFT, MilosB2FbYellowSwitch
	signpost 18, 13, SIGNPOST_RIGHT, MilosB2FbGreenSwitch
	signpost 22, 17, SIGNPOST_RIGHT, MilosB2FbBrownSwitch
	signpost 30, 19, SIGNPOST_RIGHT, MilosB2FbBrownSwitch
	signpost 5, 7, SIGNPOST_UP, MilosB2FbLatinSign1
	signpost 6, 7, SIGNPOST_READ, MilosB2FbLatinSign1
	signpost 21, 9, SIGNPOST_UP, MilosB2FbLatinSign2
	signpost 22, 9, SIGNPOST_READ, MilosB2FbLatinSign2
	signpost 34, 15, SIGNPOST_READ, MilosB2FbLatinSign3
	signpost 33, 15, SIGNPOST_UP, MilosB2FbLatinSign3
	signpost 26, 43, SIGNPOST_READ, MilosB2FbLatinSign4
	signpost 25, 43, SIGNPOST_UP, MilosB2FbLatinSign4

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 30, 20, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 4, MilosB2FbJumpingShoes, EVENT_JUMPING_SHOES
	person_event SPRITE_POKE_BALL, 40, 54, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, SACRED_ASH, EVENT_MILOS_B2FB_ITEM_SACRED_ASH
	person_event SPRITE_POKE_BALL, 26, 48, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DAWN_STONE, EVENT_MILOS_B2FB_ITEM_DAWN_STONE
	person_event SPRITE_PALETTE_PATROLLER, 6, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, MilosB2Fb_GreenPatroller, EVENT_MILOS_B2FB_TRAINER_1
	person_event SPRITE_PALETTE_PATROLLER, 14, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 1, MilosB2Fb_BlackPatroller, EVENT_MILOS_B2FB_TRAINER_2
