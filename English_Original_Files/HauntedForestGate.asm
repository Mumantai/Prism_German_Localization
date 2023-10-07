HauntedForestGate_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HauntedForestGate_RubyEgg:
	dw EVENT_HAUNTED_FOREST_GATE_HIDDENITEM_RUBY_EGG
	db RUBY_EGG

HauntedForestGateGuard:
	ctxt "Ghosts can change"
	line "their landscape,"
	para "so enter at your"
	line "own risk."
	done

HauntedForestGate_MapEventHeader:: db 0, 0

.Warps
	db 4
	warp_def $4, $0, 1, HAUNTED_FOREST
	warp_def $5, $0, 2, HAUNTED_FOREST
	warp_def $9, $4, 6, BOTAN_CITY
	warp_def $9, $5, 6, BOTAN_CITY

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 1, 9, SIGNPOST_ITEM, HauntedForestGate_RubyEgg

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, HauntedForestGateGuard, -1
