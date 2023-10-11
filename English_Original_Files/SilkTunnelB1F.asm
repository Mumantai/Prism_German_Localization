SilkTunnelB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilkTunnelB1F_Trainer_1:
	trainer EVENT_SILK_TUNNEL_B1F_TRAINER_1, HIKER, 8, .before_battle_text, .battle_won_text

	ctxt "Exploring is"
	line "always exciting,"
	cont "but tiring too."
	done

.before_battle_text
	ctxt "It's not too often"
	line "that we see your"
	cont "kind in here."
	done

.battle_won_text
	ctxt "You share the same"
	line "ambitions though,"
	cont "I respect that."
	done

SilkTunnelB1F_Trainer_2:
	trainer EVENT_SILK_TUNNEL_B1F_TRAINER_2, HIKER, 7, .before_battle_text, .battle_won_text

	ctxt "Who knows what"
	line "unseen caverns"
	para "lie right below"
	line "our feet?"
	done

.before_battle_text
	ctxt "How far down are"
	line "you going?"
	done

.battle_won_text
	ctxt "Wow."

	para "That's low."
	done

SilkTunnelB1F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 7
	warp_def $2, $4, 1, SILK_TUNNEL_B2F
	warp_def $5, $7, 5, SILK_TUNNEL_1F
	warp_def $7, $d, 3, SILK_TUNNEL_B2F
	warp_def $3, $7, 4, SILK_TUNNEL_B2F
	warp_def $f, $17, 7, SILK_TUNNEL_1F
	warp_def $b, $19, 6, SILK_TUNNEL_B2F
	warp_def $3, $19, 6, SILK_TUNNEL_1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_HIKER, 13, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, SilkTunnelB1F_Trainer_1, -1
	person_event SPRITE_HIKER, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, SilkTunnelB1F_Trainer_2, -1
