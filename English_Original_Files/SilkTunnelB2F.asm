SilkTunnelB2F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilkTunnelB2F_Trainer:
	trainer EVENT_SILK_TUNNEL_B2F_TRAINER_1, HIKER, 9, .before_battle_text, .battle_won_text

	ctxt "I once battled a"
	line "child with lots of"
	para "potential, just"
	line "like you."
	done

.before_battle_text
	ctxt "I've been training"
	line "my team! Look!"
	done

.battle_won_text
	ctxt "Well, we've never"
	line "met before, but"
	para "you remind me of"
	line "someone I saw"
	cont "once."
	done

SilkTunnelB2F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $3, $5, 1, SILK_TUNNEL_B1F
	warp_def $d, $5, 3, SILK_TUNNEL_B3F
	warp_def $7, $d, 3, SILK_TUNNEL_B1F
	warp_def $f, $13, 4, SILK_TUNNEL_B1F
	warp_def $3, $19, 5, SILK_TUNNEL_B3F
	warp_def $b, $19, 6, SILK_TUNNEL_B1F
	warp_def $e, $19, 2, SILK_TUNNEL_B3F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_HIKER, 11, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, SilkTunnelB2F_Trainer, -1
