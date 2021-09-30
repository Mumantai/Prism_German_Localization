RuinsB1F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, RuinsBasementRandomize

RuinsBasementRandomize:
	callasm RandomizeRuinsMap
	return

RandomizeRuinsMap:
	call Random
	and 3
	add 7
	ld c, a

.loop
	push bc
	call Random
	and $f

.placeTile
	ld hl, wOverworldMap + $66
	ld c, a
	and 3
	add l
	ld l, a

	ld a, c
	and $fc
	add a
	add a
	add l
	ld l, a
	call PlaceBasementTile
	pop bc
	dec c
	jr nz, .loop
	ld a, 9
	ld [hl], a
	ret

PlaceBasementTile:
	call Random
	ld c, 11
	call SimpleDivide
	add $20
	ld [hl], a
	ret

RuinsB1F_MapEventHeader ;filler
	db 0, 0

;warps
	db 17
	warp_def $7, $7, 3, RUINS_F1
	warp_def $7, $9, 3, RUINS_F1
	warp_def $7, $b, 3, RUINS_F1
	warp_def $7, $d, 3, RUINS_F1
	warp_def $9, $7, 3, RUINS_F1
	warp_def $9, $9, 3, RUINS_F1
	warp_def $9, $b, 3, RUINS_F1
	warp_def $9, $d, 3, RUINS_F1
	warp_def $b, $7, 3, RUINS_F1
	warp_def $b, $9, 3, RUINS_F1
	warp_def $b, $b, 3, RUINS_F1
	warp_def $b, $d, 3, RUINS_F1
	warp_def $d, $7, 3, RUINS_F1
	warp_def $d, $9, 3, RUINS_F1
	warp_def $d, $b, 3, RUINS_F1
	warp_def $d, $d, 3, RUINS_F1
	warp_def $11, $8, 3, RUINS_F1

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 0
