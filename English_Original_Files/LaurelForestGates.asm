LaurelForestGates_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LaurelForestGates_GoldToken:
	dw EVENT_LAUREL_FOREST_GATES_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

LaurelForest_Spiritualist:
	faceplayer
	opentext
	writetext .encounter_text
	closetext
	special FadeOutPalettes
	special HealParty
	playwaitsfx SFX_HEAL_POKEMON
	special FadeInPalettes
	jumptext .farewell_text

.encounter_text
	ctxt "My child!"
	line "May the spirit of"
	para "Laurel Forest heal"
	line "thy ailments!"
	sdone

.farewell_text
	ctxt "Behold, the deed"
	line "is done!"
	para "May the spirit"
	line "watch over you and"
	para "protect you from"
	line "danger and harm."
	done

LaurelForestGates_MapEventHeader:: db 0, 0

.Warps
	db 10
	warp_def 0, 5, 4, LAUREL_FOREST_MAIN
	warp_def 7, 4, 3, TORENIA_CITY
	warp_def 7, 5, 3, TORENIA_CITY
	warp_def 14, 4, 1, LAUREL_FOREST_MAIN
	warp_def 14, 5, 2, LAUREL_FOREST_MAIN
	warp_def 21, 4, 1, ROUTE_76
	warp_def 21, 5, 1, ROUTE_76
	warp_def 7, 19, 5, LAUREL_FOREST_MAIN
	warp_def 0, 4, 3, LAUREL_FOREST_MAIN
	warp_def 7, 20, 5, LAUREL_FOREST_MAIN

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 3, 22, SIGNPOST_ITEM, LaurelForestGates_GoldToken

.ObjectEvents
	db 1
	person_event SPRITE_GRANNY, 1, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LaurelForest_Spiritualist, -1
