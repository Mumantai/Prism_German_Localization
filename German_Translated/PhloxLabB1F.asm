PhloxLabB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

phlox_lab_spinner: MACRO
	switch ((\1) * 10 + 4) - (\2)
ENDM

PhloxLabB1FTrapLeft1:
	phlox_lab_spinner LEFT, 1
PhloxLabB1FTrapLeft2:
	phlox_lab_spinner LEFT, 2
PhloxLabB1FTrapLeft5:
	phlox_lab_spinner LEFT, 5
PhloxLabB1FTrapLeft7:
	phlox_lab_spinner LEFT, 7
PhloxLabB1FTrapLeft9:
	phlox_lab_spinner LEFT, 9
PhloxLabB1FTrapRight1:
	phlox_lab_spinner RIGHT, 1
PhloxLabB1FTrapRight5:
	phlox_lab_spinner RIGHT, 5
PhloxLabB1FTrapRight6:
	phlox_lab_spinner RIGHT, 6
PhloxLabB1FTrapRight9:
	phlox_lab_spinner RIGHT, 9
PhloxLabB1FTrapUp1:
	phlox_lab_spinner UP, 1
PhloxLabB1FTrapUp2:
	phlox_lab_spinner UP, 2
PhloxLabB1FTrapUp3:
	phlox_lab_spinner UP, 3
PhloxLabB1FTrapUp8:
	phlox_lab_spinner UP, 8
PhloxLabB1FTrapUp9:
	phlox_lab_spinner UP, 9
PhloxLabB1FTrapDown1:
	phlox_lab_spinner DOWN, 1
PhloxLabB1FTrapDown2:
	phlox_lab_spinner DOWN, 2
PhloxLabB1FTrapDown3:
	phlox_lab_spinner DOWN, 3
PhloxLabB1FTrapDown4:
	phlox_lab_spinner DOWN, 4

;fallthrough	
	sendif
	addhalfwordtovar .movement
	playsound SFX_SQUEAK
	applymovement PLAYER, -1
	end

.movement
	rept 4
		turn_waterfall_down
	endr
	step_end
	rept 9
		turn_waterfall_up
	endr
	step_end
	rept 9
		turn_waterfall_left
	endr
	step_end
	rept 9
		turn_waterfall_right
	endr
	step_end

PhloxLabB1FGuard:
	faceplayer
	opentext
	checkevent EVENT_PHLOX_LAB_B1F_KEY
	sif true
		jumptext .already_battled_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer OFFICER, 3
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .after_battle_text
	verbosegiveitem LAB_CARD, 1
	waitbutton
	writetext .gave_lab_card_text
	setevent EVENT_PHLOX_LAB_B1F_KEY
	endtext

.before_battle_text
	ctxt "zzz <...>"

	para "Ah, uh, was?"

	para "Wie spät ist es?"

	para "Warte mal, darfst"
	line "du hier eigentlich"
	cont "sein?"

	para "Versuchst du etwa"
	line "die Ausrüstung"
	para "einer Firma zu"
	line "stehlen?"

	para "Du musst jetzt"
	line "leider gehen, los."

	para "<...>"

	para "Warum stehst du da"
	line "noch?"

	para "So ruhig?"
	
	para "<...>"
	para "<...>"
	para "<...>"

	para "Ich lasse mit mir"
	line "keine Psycho-"
	para "spielchen treiben,"
	line "hörst du?"
	sdone

.battle_won_text
	text "Was?"
	done

.after_battle_text
	ctxt "OK, ich werde"
	line "ehrlich zu dir"
	cont "sein."

	para "Ich habe nichts,"
	line "womit ich mich"
	para "noch verteidigen"
	line "könnte."

	para "Aber etwas, was du"
	line "vieleicht"
	cont "möchtest <...>"

	para "Ich gebe es dir,"
	line "wenn du danach"
	cont "einfach gehst. OK?"

	para "Wenn es zu"
	line "Problemen kommt,"
	para "dann ist das nie"
	line "die Schuld eines"
	cont "Einzelnen <...>"
	sdone

.gave_lab_card_text
	ctxt "Das sollte dir den"
	line "Zutritt zum Labor"
	cont "ermöglichen."
	para "Ab da bist du"
	line "nicht mehr mein"
	cont "Problem <...>"
	sdone

.already_battled_text
	ctxt "Ich habe sonst"
	line "nichts anderes"
	para "für dich, außer"
	line "meinen Klamotten,"
	para "die jetzt seit"
	line "Wochen nicht"
	cont "gewaschen wurden."
	done

PhloxLabB1F_MapEventHeader ;filler
	db 0, 0

;warps
	db 7
	warp_def $b, $3, 4, PHLOX_LAB_B1F
	warp_def $9, $21, 3, PHLOX_LAB_B1F
	dummy_warp $15, $19
	dummy_warp $b, $f
	warp_def $b, $13, 3, PHLOX_LAB_B1F
	warp_def $15, $1c, 8, ACQUA_LABBASEMENTPATH
	warp_def $15, $1d, 8, ACQUA_LABBASEMENTPATH

	;xy triggers
	db 49
	xy_trigger 0, $13, $1b, PhloxLabB1FTrapLeft1
	xy_trigger 0, $12, $1b, PhloxLabB1FTrapLeft2
	xy_trigger 0, $d, $5, PhloxLabB1FTrapLeft1
	xy_trigger 0, $10, $16, PhloxLabB1FTrapUp3
	xy_trigger 0, $e, $16, PhloxLabB1FTrapUp1
	xy_trigger 0, $c, $16, PhloxLabB1FTrapUp8
	xy_trigger 0, $d, $15, PhloxLabB1FTrapLeft9
	xy_trigger 0, $b, $d, PhloxLabB1FTrapLeft1
	xy_trigger 0, $d, $b, PhloxLabB1FTrapLeft7
	xy_trigger 0, $c, $5, PhloxLabB1FTrapLeft1
	xy_trigger 0, $b, $c, PhloxLabB1FTrapUp9
	xy_trigger 0, $c, $a, PhloxLabB1FTrapUp8
	xy_trigger 0, $c, $3, PhloxLabB1FTrapRight1
	xy_trigger 0, $c, $2, PhloxLabB1FTrapUp1
	xy_trigger 0, $c, $1, PhloxLabB1FTrapRight1
	xy_trigger 0, $9, $0, PhloxLabB1FTrapDown3
	xy_trigger 0, $4, $0, PhloxLabB1FTrapDown3
	xy_trigger 0, $3, $2, PhloxLabB1FTrapLeft2
	xy_trigger 0, $2, $3, PhloxLabB1FTrapDown1
	xy_trigger 0, $2, $4, PhloxLabB1FTrapDown1
	xy_trigger 0, $2, $6, PhloxLabB1FTrapLeft1
	xy_trigger 0, $2, $8, PhloxLabB1FTrapLeft1
	xy_trigger 0, $2, $9, PhloxLabB1FTrapLeft2
	xy_trigger 0, $2, $d, PhloxLabB1FTrapLeft1
	xy_trigger 0, $3, $d, PhloxLabB1FTrapLeft1
	xy_trigger 0, $4, $15, PhloxLabB1FTrapLeft9
	xy_trigger 0, $5, $16, PhloxLabB1FTrapUp1
	xy_trigger 0, $1, $10, PhloxLabB1FTrapUp1
	xy_trigger 0, $4, $b, PhloxLabB1FTrapLeft1
	xy_trigger 0, $4, $9, PhloxLabB1FTrapLeft5
	xy_trigger 0, $4, $5, PhloxLabB1FTrapLeft1
	xy_trigger 0, $3, $5, PhloxLabB1FTrapLeft1
	xy_trigger 0, $3, $7, PhloxLabB1FTrapDown2
	xy_trigger 0, $3, $a, PhloxLabB1FTrapUp1
	xy_trigger 0, $6, $a, PhloxLabB1FTrapUp2
	xy_trigger 0, $5, $a, PhloxLabB1FTrapUp1
	xy_trigger 0, $7, $b, PhloxLabB1FTrapRight9
	xy_trigger 0, $9, $9, PhloxLabB1FTrapRight1
	xy_trigger 0, $7, $9, PhloxLabB1FTrapLeft1
	xy_trigger 0, $6, $8, PhloxLabB1FTrapRight1
	xy_trigger 0, $7, $17, PhloxLabB1FTrapRight5
	xy_trigger 0, $8, $6, PhloxLabB1FTrapRight1
	xy_trigger 0, $9, $5, PhloxLabB1FTrapRight5
	xy_trigger 0, $9, $3, PhloxLabB1FTrapLeft2
	xy_trigger 0, $9, $2, PhloxLabB1FTrapLeft1
	xy_trigger 0, $8, $1, PhloxLabB1FTrapRight6
	xy_trigger 0, $7, $3, PhloxLabB1FTrapLeft2
	xy_trigger 0, $8, $4, PhloxLabB1FTrapDown1
	xy_trigger 0, $5, $4, PhloxLabB1FTrapDown4

	;signposts
	db 0

	;people-events
	db 3
	person_event SPRITE_POKE_BALL, 10, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_REVIVE, EVENT_PHLOX_LAB_B1F_ITEM_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 5, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, RARE_CANDY, EVENT_PHLOX_LAB_B1F_ITEM_RARE_CANDIES
	person_event SPRITE_OFFICER, 11, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PhloxLabB1FGuard, -1
