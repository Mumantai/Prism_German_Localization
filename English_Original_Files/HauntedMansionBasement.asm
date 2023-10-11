HauntedMansionBasement_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .doors

.doors
	checkevent EVENT_HAUNTED_MANSION_BASEMENT_DOOR_1
	sif true
		changeblock 4, 6, $18
	checkevent EVENT_HAUNTED_MANSION_BASEMENT_DOOR_2
	sif true
		changeblock 8, 14, $18
	checkevent EVENT_HAUNTED_MANSION_BASEMENT_DOOR_3
	sif true
		changeblock 14, 12, $18
	checkevent EVENT_PHANCERO
	sif false
		changeblock 12, 10, $7f
	return

HauntedMansionBasementDoor1:
	switch 0
HauntedMansionBasementDoor2:
	switch 1
HauntedMansionBasementDoor3:
	switch 2
	sendif

;fallthrough
	loadarray .Array
	readarrayhalfword 2
	checkevent -1
	sif true
		end
	checkitem CAGE_KEY
	sif false
		jumptext .locked_text
	farscall TryUnlockDoor
	sif false
		end
	takeitem CAGE_KEY, 1
	playsound SFX_ENTER_DOOR
	cmdwitharrayargs
	db changeblock_command, %011, 0, 1, $18
	endcmdwitharrayargs
	reloadmappart
	setevent -1
	closetextend

.Array
	dbbw 4, 6, EVENT_HAUNTED_MANSION_BASEMENT_DOOR_1
.ArrayEntrySizeEnd
	dbbw 8, 14, EVENT_HAUNTED_MANSION_BASEMENT_DOOR_2
	dbbw 14, 12, EVENT_HAUNTED_MANSION_BASEMENT_DOOR_3

.locked_text
	ctxt "The door is"
	line "locked."
	done

HauntedMansionBasementPhanceroBoulder:
	callasm CanUseRockSmash
	sif =, 1
		jumptext .cant_break
	opentext
	writetext .can_break
	yesorno
	sif false
		closetextend
	setevent EVENT_PHANCERO_BOULDER
	farjump RockSmashScript

.cant_break
	text_jump FarText_BreakableRock_NoHM

.can_break
	text_jump FarText_BreakableRock_HasHM

PhanceroPortal:
	checkevent EVENT_PHANCERO
	sif true
		end
	playsound SFX_WARP_TO
	applymovement 0, .warp_in
	warp PHANCERO_ROOM, 85, 11
	playsound SFX_WARP_FROM
	applymovement 0, .warped
	end

.warp_in
	teleport_from
	step_end

.warped
	teleport_to
	step_end

HauntedMansionBasement_MapEventHeader:: db 0, 0

.Warps
	db 1
	warp_def $a, $7, 24, HAUNTED_MANSION

.CoordEvents
	db 1
	xy_trigger 0, 10, 12, PhanceroPortal

.BGEvents
	db 3
	signpost 7, 5, SIGNPOST_READ, HauntedMansionBasementDoor1
	signpost 15, 9, SIGNPOST_READ, HauntedMansionBasementDoor2
	signpost 13, 15, SIGNPOST_READ, HauntedMansionBasementDoor3

.ObjectEvents
	db 7
	person_event SPRITE_POKE_BALL, 10, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_SHADOW_CLAW, 0, EVENT_HAUNTED_MANSION_BASEMENT_TM
	person_event SPRITE_POKE_BALL, 3, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CLEANSE_TAG, EVENT_HAUNTED_MANSION_BASEMENT_ITEM_CLEANSE_TAG
	person_event SPRITE_ROCK, 6, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 17, 5, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 10, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, HauntedMansionBasementPhanceroBoulder, EVENT_PHANCERO_BOULDER
	person_event SPRITE_ROCK, 15, 13, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
	person_event SPRITE_ROCK, 11, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, smashrock, -1
