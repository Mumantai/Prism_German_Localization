SilkTunnelB3F_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

SilkTunnelB3F_Trainer_1:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_1, HIKER, 10, .before_battle_text, .battle_won_text

	ctxt "Kleine Steine &"
	line "Kleinstein, hmm?"
	done

.before_battle_text
	ctxt "Hey du!"

	para "Ich sammle gerne"
	line "Steine, auch"
	para "solche wie diese"
	line "da!"

	done

.battle_won_text
	ctxt "Verdammt noch mal."

	done

SilkTunnelB3F_Trainer_2:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_2, HIKER, 11, .before_battle_text, .battle_won_text

	ctxt "Wie viel haben"
	line "diese Schuhe"
	cont "gekostet?"

	para "Die Wirtschaft in"
	line "deiner Region muss"
	para "völlig außer"
	line "Kontrolle sein!?"

	done

.before_battle_text
	ctxt "Das sind ein paar"
	line "coole Schuhe."

	para "Für jedes Terrain,"
	line "richtig?"

	done

.battle_won_text
	text "Ack!"
	done

SilkTunnelB3F_Trainer_3:
	trainer EVENT_SILK_TUNNEL_B3F_TRAINER_3, PICNICKER, 7, .before_battle_text, .battle_won_text

	ctxt "Wenn du Zubat und"
	line "dergleichen"
	para "ignorierst, ist"
	line "dieser Tunnel ein"
	para "großartiger Ort"
	line "zum Entspannen."

	done

.before_battle_text
	ctxt "Nenn mich komisch,"
	line "aber ich finde"
	para "diesen Ort"
	line "entspannend."

	done

.battle_won_text
	ctxt "Zumindest die"
	line "meiste Zeit!"

	done

SilkTunnelB3F_MapEventHeader ;filler
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
	person_event SPRITE_POKE_BALL, 12, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, DUSK_STONE, EVENT_SILK_TUNNEL_B3F_ITEM_DUSK_STONE
