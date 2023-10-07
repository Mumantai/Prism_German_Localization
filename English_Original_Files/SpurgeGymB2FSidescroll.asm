SpurgeGymB2FSidescroll_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymB2FSidescrollSecondMon:
	setevent EVENT_SPURGE_GYM_POKEMON_2
	jump SpurgeGymGetPokemon

SpurgeGymB2FSidescrollFifthMon:
	setevent EVENT_SPURGE_GYM_POKEMON_5
	jump SpurgeGymGetPokemon

SpurgeGymB2FSidescrollSwitch:
	opentext
	checkevent EVENT_SPURGE_GYM_SWITCH_ENABLED
	sif false
		jumptext .switch_disabled_text
	writetext .pull_the_switch_text
	yesorno
	sif true, then
		playsound SFX_ENTER_DOOR
		toggleevent EVENT_0
		varblocks .toggled_blocks
		reloadmappart
	sendif
	closetextend

.pull_the_switch_text
	ctxt "Want to pull the"
	line "switch?"
	done

.switch_disabled_text
	ctxt "This switch is"
	line "disabled!"
	done

.toggled_blocks
	db 3
	varblock1  2, 12, EVENT_0, $6a, $6b
	varblock1 18, 10, EVENT_0, $67, $52
	varblock1 18, 12, EVENT_0, $68, $51

SpurgeGymB2FSidescroll_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 5, 25, 2, SPURGE_GYM_B1F
	warp_def 5, 5, 1, SPURGE_GYM_B2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 12, 2, SIGNPOST_READ, SpurgeGymB2FSidescrollSwitch

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 12, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FSidescrollSecondMon, EVENT_SPURGE_GYM_POKEMON_2
	person_event SPRITE_POKE_BALL, 14, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SpurgeGymB2FSidescrollFifthMon, EVENT_SPURGE_GYM_POKEMON_5
