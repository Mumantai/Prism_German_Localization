GoldenrodSwitches_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

GoldenrodSwitches_SwitchBlocks:
	db 8
	varblock1  2,  6, EVENT_0, $3e, $2d
	varblock1 10,  6, EVENT_1, $3e, $2d
	varblock1 16,  6, EVENT_2, $3e, $2d
	varblock1  2, 10, EVENT_3, $3e, $2d
	varblock1 10, 10, EVENT_4, $3e, $2d
	varblock1 16, 10, EVENT_5, $3e, $2d
	varblock1  6,  8, EVENT_6, $3d, $2d
	varblock1 18, 12, EVENT_7, $3d, $2d

GoldenrodSwitches_Switch1:
	writebyte 1
	scall GoldenrodSwitches_ShowSwitchLabel
	sif true, then
		playsound SFX_ENTER_DOOR
		toggleevent EVENT_0
		toggleevent EVENT_2
		toggleevent EVENT_4
		toggleevent EVENT_6
		varblocks GoldenrodSwitches_SwitchBlocks
		reloadmappart
	sendif
	closetextend

GoldenrodSwitches_Switch2:
	writebyte 2
	scall GoldenrodSwitches_ShowSwitchLabel
	sif true, then
		playsound SFX_ENTER_DOOR
		toggleevent EVENT_0
		toggleevent EVENT_1
		toggleevent EVENT_6
		toggleevent EVENT_7
		varblocks GoldenrodSwitches_SwitchBlocks
		reloadmappart
	sendif
	closetextend

GoldenrodSwitches_Switch3:
	writebyte 3
	scall GoldenrodSwitches_ShowSwitchLabel
	sif true, then
		playsound SFX_ENTER_DOOR
		toggleevent EVENT_2
		toggleevent EVENT_3
		toggleevent EVENT_4
		toggleevent EVENT_5
		varblocks GoldenrodSwitches_SwitchBlocks
		reloadmappart
	sendif
	closetextend

GoldenrodSwitches_Switch4:
	writebyte 4
	scall GoldenrodSwitches_ShowSwitchLabel
	sif true, then
		playsound SFX_ENTER_DOOR
		toggleevent EVENT_2
		toggleevent EVENT_5
		toggleevent EVENT_7
		varblocks GoldenrodSwitches_SwitchBlocks
		reloadmappart
	sendif
	closetextend

GoldenrodSwitches_ShowSwitchLabel:
	opentext
	writetext .text
	yesorno
	end

.text
	ctxt "It's labeled"
	line "'Switch @"
	deciram hScriptVar, 1, 1
	ctxt "'."

	para "Press it?"
	done

GoldenrodSwitches_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $3, $17, 6, GOLDENROD_UNDERGROUND
	warp_def $a, $16, 1, GOLDENROD_STORAGE
	warp_def $a, $17, 2, GOLDENROD_STORAGE

.CoordEvents
	db 0

.BGEvents
	db 4
	signpost 1, 16, SIGNPOST_READ, GoldenrodSwitches_Switch1
	signpost 1, 10, SIGNPOST_READ, GoldenrodSwitches_Switch2
	signpost 1, 2, SIGNPOST_READ, GoldenrodSwitches_Switch3
	signpost 11, 20, SIGNPOST_READ, GoldenrodSwitches_Switch4

.ObjectEvents
	db 1
	person_event SPRITE_POKE_BALL, 13, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, METAL_COAT, EVENT_GOLDENROD_SWITCHES_ITEM_METAL_COAT
