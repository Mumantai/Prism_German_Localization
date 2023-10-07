MysteryZoneLeagueRed_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_SPRITES, .hide_others

.hide_others
	setevent EVENT_0
	return

MysteryZoneRedBattle:
	scall .movement
	faceplayer
	opentext
	writetext .text_waitbutton
	winlosstext .text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer RED, 1
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_HALL_OF_FAME
	closetext
	showtext .text_waitbutton
	clearevent EVENT_0
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 20
	appear 3
	applymovement 3, .goldWalksToYou
	writetext .text_waitbutton
	closetext
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 20
	appear 4
	applymovement 4, .brownWalksToYou
	spriteface PLAYER, DOWN
	showtext .victory_text
	callasm .increment_mystery_zone_win_counter
	callasm RunCreditsFromScript
	end

.brownWalksToYou
	step_right
	step_right
	step_right
	step_right
	step_up
	turn_head_up
	step_end

.goldWalksToYou
	step_left
	step_left
	step_left
	step_left
	step_end

.movement
	checkcode VAR_FACING
	anonjumptable
	dw .facingDown
	dw .facingUp
	dw .facingLeft
	dw .facingRight

.facingRight
	applymovement PLAYER, .facingRightMovement
	end

.facingDown
	applymovement PLAYER, .facingDownMovement
.facingUp
	end

.facingLeft
	applymovement PLAYER, .facingLeftMovement
	end

.facingRightMovement
	step_up
	step_right
.facingDownMovement
	step_right
	step_down
.facingLeftMovement
	step_down
	step_left
	turn_head_up
	step_end

.increment_mystery_zone_win_counter
	ld hl, wMysteryZoneWinCount
	inc [hl]
	ret nz
	inc hl
	inc [hl]
	ret nz
	ld a, $ff
	ld [hld], a
	ld [hl], a
	ret

.text
	text "<...><...><...>"
	done

.text_waitbutton
	text "<...><...><...>"
	sdone

.victory_text
	ctxt "Brown: Wow!"

	para "That was amazing!"

	para "It's official."

	para "Let's all welcome"
	line "<PLAYER> to the"
	cont "Mystery League!"
	sdone

MysteryZoneLeagueRed_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 17, 8, 3, MYSTERY_ZONE_GOLD
	warp_def 17, 9, 4, MYSTERY_ZONE_GOLD

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_RED, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MysteryZoneRedBattle, -1
	person_event SPRITE_GOLD, 6, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_0
	person_event SPRITE_BROWN, 8, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_0
