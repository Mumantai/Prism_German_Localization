MilosF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

MilosF1_RareCandy:
	dw EVENT_MILOS_F1_HIDDENITEM_RARE_CANDY
	db RARE_CANDY

MilosF1_Rival:
	trainer EVENT_MILOS_F1_RIVAL, RIVAL1, RIVAL1_3, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Oh schau, es ist"
	line "das Kind das nie"
	cont "aufhören will."

	para "Die hartnäckigkeit"
	line "in dir, ist nichts"
	para "als eine Plage für"
	line "Naljo Bewohner."

	para "Ich hab kein Bock"
	line "mehr auf dein"
	para "Gutmenschen"
	line "verhalten, das"
	para "sich mir in den"
	line "Weg stellt!"

	done

.battle_won_text
	ctxt "Meine #mon sind"
	line "zu schwach!"
	done

.after_battle_text
	ctxt "Ich tue was ich"
	line "tun muss, OK?"

	para "Jemand wie ich,"
	line "braucht sich nicht"
	cont "zu rechtfertigen."

	para "Lass mich einfach"
	line "all<...> alleine<...>"
	done

MilosF1Officer:
	faceplayer
	opentext
	writetext .introduction_text
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer OFFICER, 1
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext .after_battle_text
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warpfacing LEFT, PHACELIA_POLICE_F2, 3, 1
	spriteface 2, RIGHT
	opentext
	writetext .mission_text
	callasm .dress_up_as_palette
	closetext
	setevent EVENT_ROUTE_85_POLICEMAN_GONE
	setevent EVENT_IN_UNDERCOVER_MISSION
	blackoutmod PHACELIA_CITY
	callasm CancelMapSign
	jumptext .after_getting_changed_text

.dress_up_as_palette
	ld a, [wPlayerGender]
	ld [wSavedPlayerCharacteristics2], a
	and 1
	add a, $c
	ld [wPlayerGender], a
	ret

.introduction_text
	ctxt "Ich bewache den"
	line "Ort hier."

	para "Hm<...> warte,"
	line "wer bist du?"

	para "<...>"

	para "Ich sehe."

	para "Hast du einen"
	line "Ausweis<...>?"

	para "Ein Visum?"

	para "Ein Reisepass?"
	sdone

.before_battle_text
	ctxt "Warte, du"
	line "entsprichst der"
	para "Fahndung! Nach dem"
	line "wir die ganze "
	cont "zeit suchen."

	para "Ein Kind mit "
	line "Spitzen Haaren,"
	para "aus einer fremden"
	line "Region und der"
	para "seine #mon"
	line "schlecht behandelt"

	para "<...>"

	para "Was? Du sagst du"
	line "kannst beweisen,"
	para "dass du deine"
	line "#mon gut"
	cont "behandelst?"

	para "Zeigs mir, in"
	line "einem Kampf."
	sdone

.battle_won_text
	ctxt "Du hattest"
	line "recht!"
	done

.after_battle_text
	ctxt "Du hast bewiesen,"
	line "dass du nicht der-"
	cont "jenige bist."

	para "Du darfst hier"
	line "aber dennoch nicht"
	cont "sein."

	para "Folg mir."
	sdone

.mission_text
	ctxt "Wenn du für mich"
	line "auf eine under-"
	para "cover Mission"
	line "gehen könntest und"
	para "einen kriminellen"
	line "ausfindig machst,"
	cont "kannst du bleiben!"

	para "Paletten"
	line "Patrouillen"
	para "sind in der gegend"
	line "und ich brauche"
	para "dich um einen zu"
	line "fangen."

	para "Nimm diesen Anzug"
	line "um deren Vertrauen"
	para "zu gewinnen und"
	line "Sie zu mir"
	cont "zu führen."
	sdone

.after_getting_changed_text
	ctxt "Du siehst<...>"

	para "naja<...>"

	para "Interesannt aus."

	para "Bring mir jetzt"
	line "einen kriminellen."
	done

MilosF1_MapEventHeader:: db 0, 0

.Warps
	db 8
	warp_def $3, $b, 5, ROUTE_77
	warp_def $25, $2f, 2, MILOS_TOWERCLIMB
	warp_def $39, $25, 1, PHACELIA_CITY
	warp_def $1d, $5, 2, MILOS_B2FB
	warp_def $1b, $21, 3, MILOS_B1F
	warp_def $39, $39, 2, PHACELIA_GYM
	warp_def $11, $1b, 2, MILOS_B2F
	warp_def $15, $15, 1, MILOS_B1F

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 28, 25, SIGNPOST_ITEM, MilosF1_RareCandy

.ObjectEvents
	db 7
	person_event SPRITE_SILVER, 8, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, MilosF1_Rival, EVENT_MILOS_F1_RIVAL
	person_event SPRITE_POKE_BALL, 42, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, TRADE_STONE, EVENT_MILOS_F1_ITEM_TRADE_STONE
	person_event SPRITE_POKE_BALL, 56, 54, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, CALCIUM, EVENT_MILOS_F1_ITEM_CALCIUM
	person_event SPRITE_POKE_BALL, 5, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, NUGGET, EVENT_MILOS_F1_ITEM_NUGGET
	person_event SPRITE_POKE_BALL, 24, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, ESCAPE_ROPE, EVENT_MILOS_F1_ITEM_ESCAPE_ROPE
	person_event SPRITE_BOULDER, 48, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_OFFICER, 57, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MilosF1Officer, EVENT_ARRESTED_PALETTE_BLACK
