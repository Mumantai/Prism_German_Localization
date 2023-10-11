MoragaGateUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MoragaGateNPC:
	ctxt "I'm sorry."

	para "The Underground"
	line "path was recently"
	cont "vandalized."

	para "Once it's all"
	line "cleaned up, I'll"
	cont "let you through."
	done

MoragaGateUnderground_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $4, $4, 1, RIJON_UNDERGROUND_VERTICAL
	warp_def $7, $3, 1, MORAGA_TOWN
	warp_def $7, $4, 1, MORAGA_TOWN

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_OFFICER, 4, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, MoragaGateNPC, EVENT_RIJON_SECOND_PART
