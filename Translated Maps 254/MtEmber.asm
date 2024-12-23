MtEmber_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MtEmberMoltres:
	faceplayer
	opentext
	writetext .cry_text
	cry MOLTRES
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_MOLTRES
	loadwildmon MOLTRES, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_MOLTRES
	disappear 2
	end

.cry_text
	ctxt "Gyaoo!!!"
	done

MtEmber_Trainer_1:
	trainer EVENT_MT_EMBER_TRAINER_1, MINER, 3, .before_battle_text, .battle_won_text
	ctxt "Das vulkanische"
	line "Gestein in dieser"
	para "Gegend ist sehr"
	line "reich an seltenen"
	cont "Mineralien."
	para "Ich werde im Nu"
	line "ein Vermögen"
	cont "schürfen!"
	done

.before_battle_text
	ctxt "Puh, das war eine"
	line "lange Session."
	para "Lust auf eine"
	line "Pause?"
	done

.battle_won_text
	ctxt "Nun zurück an die"
	line "Arbeit."
	done

MtEmber_Trainer_2:
	trainer EVENT_MT_EMBER_TRAINER_2, PICNICKER, 8, .before_battle_text, .battle_won_text
	ctxt "Unsere Regierung"
	line "hat diesem Ort"
	para "kürzlich den"
	line "Umweltschutzstatus"
	cont "entzogen."
	para "Ich dränge dich,"
	line "bitte hier nicht"
	cont "abzubauen."
	done

.before_battle_text
	ctxt "Stehen geblieben!"
	done

.battle_won_text
	ctxt "Bitte <...> höre"
	line "mir zu."
	done

MtEmber_Trainer_3:
	trainer EVENT_MT_EMBER_TRAINER_3, MINER, 4, .before_battle_text, .battle_won_text
	ctxt "Hier betreibe ich"
	line "bereits Bergbau."
	para "Finde deinen"
	line "eigenen platz!"
	done

.before_battle_text
	ctxt "Was glaubst du,"
	line "machst du hier?"
	done

.battle_won_text
	ctxt "Ich kann deine"
	line "Unverschämtheit"
	cont "nicht fassen!"
	done

MtEmber_Trainer_4:
	trainer EVENT_MT_EMBER_TRAINER_4, BIRD_KEEPER, 9, .before_battle_text, .battle_won_text
	ctxt "Wie kannst du"
	line "deine Taten vor"
	para "dir selbst"
	line "rechtfertigen?"
	para "Du zerstörst die"
	line "Zukunft deiner"
	cont "Kinder!"
	para "Bedeutet unser"
	line "natürliches"
	para "ökologisches"
	line "Gleichgewicht dir"
	cont "etwas?"
	done

.before_battle_text
	ctxt "Ich lasse dich"
	line "nicht unseren"
	para "schönen Planeten"
	line "zerstören!"
	done

.battle_won_text
	ctxt "Mit dir rede ich"
	line "nicht mehr."
	done

MtEmber_Trainer_5:
	trainer EVENT_MT_EMBER_TRAINER_5, MINER, 5, .before_battle_text, .battle_won_text
	ctxt "Und dann habe ich"
	line "natürlich diesen"
	para "schrecklichen"
	line "Schmerz auf meiner"
	cont "linken Seite."
	done

.before_battle_text
	ctxt "Ich denke, du"
	line "solltest wissen,"
	para "dass ich mich sehr"
	line "niedergeschlagen"
	cont "fühle <...>"
	done

.battle_won_text
	ctxt "Warum jetzt"
	line "aufhören, gerade"
	cont "wenn ich es hasse?"
	done

MtEmber_Trainer_6:
	trainer EVENT_MT_EMBER_TRAINER_6, OFFICER, 8, .before_battle_text, .battle_won_text
	ctxt "Es ist völlig"
	line "legal, in dieser"
	cont "Gegend abzubauen."
	para "Wenn diesen"
	line "Öko-Spinnern das"
	para "nicht gefällt,"
	line "können sie jemand"
	cont "anderen wählen."
	done

.before_battle_text
	ctxt "Halt!"
	para "Ich werde euch"
	line "Öko-Aktivisten"
	para "nicht länger"
	line "tolerieren, die"
	para "auf meinem Terrain"
	line "Ärger machen!"
	done

.battle_won_text
	ctxt "Ach du bist gar"
	line "kein Aktivist?"
	done

MtEmber_NPC_1:
	ctxt "Dies ist die"
	line "Ruhestätte des"
	cont "großen Phönix."
	para "Es heißt, er"
	line "erscheint nur"
	para "denen, die reinen"
	line "Geistes sind."
	para "Und dann reist er"
	line "mit diesem, bis"
	para "sie diese Welt"
	line "verlassen."
	done

MtEmber_NPC_2:
	ctxt "Ich versuche,"
	line "friedlich zu"
	cont "protestieren."
	para "Meine #mon"
	line "sollten nicht"
	para "unter der Arroganz"
	line "der Menschheit"
	cont "leiden müssen."
	para "Bitte denk an sie,"
	line "bevor du deine"
	para "Spitzhacke"
	line "benutzt."
	done

MtEmber_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 21, 6, 2, MT_EMBER_ROOM_1
	warp_def 15, 30, 1, MT_EMBER_ROOM_2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 13
	person_event SPRITE_MOLTRES, 4, 31, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtEmberMoltres, EVENT_MOLTRES
	person_event SPRITE_POKE_BALL, 4, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, ULTRA_BALL, EVENT_MT_EMBER_ITEM_ULTRA_BALLS
	person_event SPRITE_POKE_BALL, 34, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MOON_STONE, EVENT_MT_EMBER_ITEM_MOON_STONE
	person_event SPRITE_POKE_BALL, 16, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_ANCIENTPOWER, 0, EVENT_MT_EMBER_TM_ANCIENTPOWER
	person_event SPRITE_MINER, 30, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_1, -1
	person_event SPRITE_PICNICKER, 19, 27, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, MtEmber_Trainer_2, -1
	person_event SPRITE_MINER, 24, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, MtEmber_Trainer_3, -1
	person_event SPRITE_BIRDKEEPER, 37, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_4, -1
	person_event SPRITE_MINER, 38, 29, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, MtEmber_Trainer_5, -1
	person_event SPRITE_OFFICER, 42, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, MtEmber_Trainer_6, -1
	person_event SPRITE_SAGE, 11, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, MtEmber_NPC_1, -1
	person_event SPRITE_TWIN, 33, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, MtEmber_NPC_2, -1
	person_event SPRITE_POKE_BALL, 26, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 5, MINING_PICK, EVENT_MT_EMBER_ITEM_MINING_PICKS