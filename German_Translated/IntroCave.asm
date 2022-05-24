IntroCave_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

IntroCaveNPC:
	faceplayer
	showtext .initial_text
	applymovement 2, .man_leaves
	applymovement PLAYER, .player_enters_cart
	special ClearBGPalettes
	disappear 2
	special Special_ReloadSpritesNoPalettes
	playsound SFX_BALL_POOF
	writebyte 8
.loop
	playwaitsfx SFX_SANDSTORM
	addvar -1
	iftrue .loop
	playwaitsfx SFX_EMBER
	playwaitsfx SFX_STOMP
	;show logo and title music here
	callasm EnableSpriteUpdates
	warp ACQUA_START, 28, 36
	blackoutmod ACQUA_START
	end

.man_leaves
	step_right
	turn_head_left
	step_end

.player_enters_cart
	step_down
	turn_head_right
	step_sleep_8
	step_sleep_8
	step_sleep_8
	step_down
	step_down
	step_end

.initial_text
	ctxt "Hi, hast du"
	line "dich verlaufen?"

	para "Du warst am Campen"
	line "etwas nördlich?"

	para "Der direkte Weg"
	line "dahin wurde"
	cont "versperrt?"

	para "Du hast Glück im"
	line "im Unglück!"

	para "Diese Lore sollte"
	line "dich dorthin"
	cont "zurückführen."
	sdone

IntroCave_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $9, $5, 1, INTRO_OUTSIDE

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_FISHER, 12, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IntroCaveNPC, -1
