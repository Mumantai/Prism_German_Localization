SilkTunnelB3F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SilkTunnelB3F_Trainer_1:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_1, HIKER, 10, .before_battle_text, .battle_won_text

	ctxt "Geodes and"
	line "Geodude, eh?"
	done

.before_battle_text
	ctxt "Hey there!"

	para "I like collecting"
	line "rocks, including"
	cont "these ones!"
	done

.battle_won_text
	ctxt "Darn it all."
	done

SilkTunnelB3F_Trainer_2:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_2, HIKER, 11, .before_battle_text, .battle_won_text

	ctxt "How much did those"
	line "shoes cost?"

	para "The economy in"
	line "your region must"
	cont "be out of control."
	done

.before_battle_text
	ctxt "Those are some"
	line "cool shoes."

	para "All terrain,"
	line "right?"
	done

.battle_won_text
	text "Ack!"
	done

SilkTunnelB3F_Trainer_3:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_3, PICNICKER, 6, .before_battle_text, .battle_won_text

	ctxt "If you ignore the"
	line "Zubat and such,"
	para "this tunnel is a"
	line "great place to"
	cont "unwind."
	done

.before_battle_text
	ctxt "Call me weird, but"
	line "I find this place"
	cont "relaxing."
	done

.battle_won_text
	ctxt "Most of the time!"
	done

SilkTunnelB3F_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $21, $1b, 1, SILK_TUNNEL_B4F
	warp_def $3, $1b, 7, SILK_TUNNEL_B2F
	warp_def $b, $17, 2, SILK_TUNNEL_B2F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 5
	person_event SPRITE_HIKER, 16, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, SilkTunnelB3F_Trainer_1, -1
	person_event SPRITE_HIKER, 17, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, SilkTunnelB3F_Trainer_2, -1
	person_event SPRITE_PICNICKER, 26, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, SilkTunnelB3F_Trainer_3, -1
	person_event SPRITE_POKE_BALL, 21, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_ETHER, EVENT_SILK_TUNNEL_B3F_ITEM_MAX_ETHER
	person_event SPRITE_POKE_BALL, 12, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PROTECTOR, EVENT_SILK_TUNNEL_B3F_ITEM_PROTECTOR
