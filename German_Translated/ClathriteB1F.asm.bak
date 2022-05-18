ClathriteB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

ClathriteB1FTrap:
	checkitem FLUFFY_COAT
	sif true
		end
	showtext .text
	applymovement PLAYER, .movement
	end

.text
	ctxt "Wow, es ist viel"
	line "zu kalt hier."

	para "Ohne eine dicke"
	line "Jacke werde ich"
	para "mir sonst noch"
	line "eine Erkältung"
	para "einholen."
	
	para "Ohne eine Jacke"
	line "kehre ich besser"
	cont "erstmal zurück."
	sdone

.movement
	step_right
	step_end

ClathriteB1F_Trainer_1:
	trainer EVENT_CLATHRITE_B1F_TRAINER_1, BOARDER, 1, .before_battle_text, .defeated_text

	ctxt "Zumindest macht es"
	line "Spaß dieses"
	para "Labyrinth runter"
	line "zu brettern."
	done

.before_battle_text:
	ctxt "Ich habe mich"
	line "verlaufen, hilfst"
	cont "du mir raus?"
	done

.defeated_text:
	ctxt "Also keine hilfe<...>"
	done

ClathriteB1F_Trainer_2:
	trainer EVENT_CLATHRITE_B1F_TRAINER_2, BOARDER, 2, .before_battle_text, .defeated_text

	ctxt "Ich hörte eine"
	line "Legende soll sich"
	para "irgendwo in dieser"
	line "Höhle aufhalten."

	para "Warscheinlich ist"
	line "das nur ein"
	cont "Gerücht."
	done

.before_battle_text:
	ctxt "Bin gerade erst"
	line "reingekommen um"
	para "ein paar eisige"
	line "#mon zu fangen!"
	done

.defeated_text:
	ctxt "Ich brauche mehr"
	line "eisige #mon!"
	done

ClathriteB1F_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $21, $f, 1, CLATHRITE_B2F
	warp_def $29, $1d, 3, CLATHRITE_1F
	warp_def $3, $3, 3, CLATHRITE_B2F
	warp_def $17, $1b, 2, CLATHRITE_1F

.CoordEvents
	db 2
	xy_trigger 0, $18, $19, ClathriteB1FTrap
	xy_trigger 0, $27, $1a, ClathriteB1FTrap

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_POKE_BALL, 16, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ETHER, EVENT_CLATHRITE_B1F_ITEM_ETHER
	person_event SPRITE_POKE_BALL, 22, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_CLATHRITE_B1F_ITEM_PP_UP
	person_event SPRITE_BOARDER, 6, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, ClathriteB1F_Trainer_1, -1
	person_event SPRITE_BOARDER, 22, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, ClathriteB1F_Trainer_2, -1
