SilphWarehouseF2_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilphWarehouseF2NPC:
	faceplayer
	showtext .SecretShopIntroText
	pokemart MART_STANDARD, SILPH_WAREHOUSE_STANDARD_MART

.SecretShopIntroText:
	ctxt "Ah, a visitor of"
	line "the Secret Shop!"
	prompt

SilphWarehouseF2_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $6, $3, 4, SILPH_WAREHOUSE_F1

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_BURGLAR, 3, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SilphWarehouseF2NPC, -1
