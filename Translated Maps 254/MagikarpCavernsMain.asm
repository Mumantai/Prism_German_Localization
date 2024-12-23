MagikarpCavernsMain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 2
	dbw MAPCALLBACK_OBJECTS, .TryHidingTunodBlocker
	dbw MAPCALLBACK_NEWMAP, .TryHidingTunodBlocker

.TryHidingTunodBlocker
	checkflag ENGINE_MARSHBADGE
	sif true
		setevent EVENT_0
	return

MagikarpCavernsMainTrialNPC:
	faceplayer
	checkevent EVENT_MAGIKARP_TEST
	sif true
		jumptext .already_completed_text
	opentext
	writetext .introduction_text
	yesorno
	sif false
		jumptext .refused_text
	copybytetovar wNumItems
	sif >, MAX_ITEMS - 5
		jumptext .big_bag
	showtext .accepted_text
	setflag ENGINE_POKEMON_MODE
	setflag ENGINE_CUSTOM_PLAYER_SPRITE
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	callasm .SetPlayerSpriteAsMagikarp
	warp MAGIKARP_CAVERNS_RAPIDS, 10, 11
	end

.SetPlayerSpriteAsMagikarp:
	ld a, MAGIKARP
	ld [wPokeonlyMainSpecies], a
	ld a, SPRITE_WALKING_MAGIKARP
	ld [wPlayerSprite], a
	ret

.introduction_text
	ctxt "Willkommen!"
	para "Wie ich sehe, hast"
	line "du es um den"
	para "heiligen Fisch"
	line "geschafft."
	para "<...>"
	para "Oh, dir ist nicht"
	line "aufgefallen, wie"
	para "diese Höhle"
	line "aufgebaut ist?"
	para "Die Felsen hier"
	line "habe ich nach dem"
	para "Ebenbild des #-"
	line "mons, das ich an-"
	cont "bete, aufgestellt."
	para "Ja, das heilige"
	line "Fisch-#mon:"
	cont "Karpador!"
	para "Alte Geschichten"
	line "sagen uns, dass"
	para "es früher viel"
	line "mächtiger war als"
	cont "heute."
	para "Mein Stamm betet"
	line "seit Generationen"
	para "dafür, dass es"
	line "wieder so mächtig"
	cont "wird wie damals."
	para "<...>"
	para "Was meinst du mit"
	line "'Garados'?"
	para "BLASPHEMIE!"
	para "Ich rede von"
	line "seiner ursprüng-"
	cont "lichen Form!"
	para "OK, weißt du was?"
	line "Ich rede nicht mit"
	cont "Ungläubigen."
	para "<...>"
	para "Wie war das?"
	para "Der Pfad im Wald"
	line "wird versperrt?"
	para "HAHA!"
	para "<...> Weißt du was?"
	para "Mein Kollege wird"
	line "dich vorbeilassen,"
	para "wenn du dich"
	line "meiner Prüfung"
	cont "stellst."
	para "In dieser Prüfung"
	line "verwandele ich"
	para "dich in ein"
	line "Karpador!"
	para "In dieser heiligen"
	line "Form, wirst du"
	para "verstehen, was es"
	line "bedeutet, ein"
	cont "Karpador zu sein!"
	para "Wie Karpador der"
	line "Härte der Natur"
	cont "trotzen!"
	para "Dann erkennst du"
	line "vielleicht die"
	para "wahre Stärke"
	line "dieser #mon!"
	para "Sei dir aber"
	line "bewusst, dass du"
	para "erst zurück-"
	line "verwandelt wirst,"
	para "wenn du die"
	line "Prüfung bestehst."
	para "Sonst bleibst du"
	line "für immer ein"
	cont "Karpador <...>"
	para "<...>"
	para "Traust du dich?"
	done

.accepted_text
	ctxt "Gut <...>"
	para "Viel Erfolg!"
	sdone

.already_completed_text
	ctxt "Sehr gut gemacht!"
	done

.refused_text
	ctxt "Wie du willst."
	para "Mein Kollege im"
	line "Wald wird dich"
	para "niemals ohne meine"
	line "Erlaubnis vor-"
	cont "beilassen."
	done

.big_bag
	ctxt "Du hast zu viele"
	line "Items dabei,"
	para "die du als"
	line "Karpador nicht"
	cont "tragen kannst!"
	para "Verstaue einige"
	line "deiner Items im PC"
	cont "und komm wieder."
	done

MagikarpCavernsMainSage:
	faceplayer
	opentext
	checkevent EVENT_0
	sif false
		jumptext .block_text
	writetext .before_battle_text
	waitbutton
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SAGE, 8
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	setevent EVENT_WON_AGAINST_MAGIKARP_SAGE
	writetext .after_battle_text
	waitbutton
	special FadeOutPalettes
	disappear 6
	special Special_ReloadSpritesNoPalettes
	cry MAGIKARP
	reloadmap
	end

.block_text
	ctxt "Einen Moment."
	para "Nördlich dieser"
	line "Höhle liegt die"
	cont "Tunod-Region."
	para "Du bist noch nicht"
	line "stark genug, um"
	para "mit den Trainern"
	line "dort mitzuhalten."
	para "Komm zurück, wenn"
	line "du dich als"
	para "Trainer bewiesen"
	line "hast!"
	done

.before_battle_text
	ctxt "Mein Kind!"
	para "An dem leuchten in"
	line "deinen Augen"
	para "erkenne ich, dass"
	line "du die Pracht der"
	para "Welt in all ihrer"
	line "Vielfalt erlebt"
	cont "hast."
	para "Zeig mir in einem"
	line "Kampf, was du"
	cont "erlebt hast."
	para "Los gehts, du"
	line "Erleuchteter!"
	done

.battle_won_text
	ctxt "Aua!"
	para "Der Kampf war"
	line "nahezu heilig!"
	done

.after_battle_text
	ctxt "Es ist klar, dass"
	line "du alles gelernt"
	para "hast, was diese"
	line "Welt dir bieten"
	cont "kann."
	para "Doch das Universum"
	line "hat noch viel mehr"
	para "zu bieten!"
	para "Denke daran, du"
	para "junge Knospe."
	para "Die Karpador sind"
	line "immer an deiner"
	para "Seite!"
	para "Geh hinaus, lerne"
	line "mehr von der Welt!"
	para "Ich werde deine"
	line "Reise weiter"
	cont "beobachten <...>"
	done


MagikarpCavernsMain_MapEventHeader:: db 0, 0

.Warps: db 16
	warp_def 11, 3, 8, MAGIKARP_CAVERNS_MAIN
	warp_def 3, 13, 3, MAGIKARP_CAVERNS_MAIN
	warp_def 15, 27, 2, MAGIKARP_CAVERNS_MAIN
	warp_def 7, 55, 7, MAGIKARP_CAVERNS_MAIN
	warp_def 19, 57, 14, MAGIKARP_CAVERNS_MAIN
	warp_def 23, 45, 11, MAGIKARP_CAVERNS_MAIN
	warp_def 21, 31, 4, MAGIKARP_CAVERNS_MAIN
	warp_def 37, 3, 1, MAGIKARP_CAVERNS_MAIN
	warp_def 45, 17, 12, MAGIKARP_CAVERNS_MAIN
	warp_def 47, 23, 13, MAGIKARP_CAVERNS_MAIN
	warp_def 31, 35, 6, MAGIKARP_CAVERNS_MAIN
	warp_def 29, 41, 9, MAGIKARP_CAVERNS_MAIN
	warp_def 29, 49, 10, MAGIKARP_CAVERNS_MAIN
	warp_def 57, 35, 5, MAGIKARP_CAVERNS_MAIN
	warp_def 57, 17, 3, LAUREL_CITY
	warp_def 9, 27, 1, ROUTE_87

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 21, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, HARD_STONE, EVENT_MAGIKARP_CAVERNS_MAIN_ITEM_HARD_STONE
	person_event SPRITE_POKE_BALL, 21, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PRISM_SCALE, EVENT_MAGIKARP_CAVERNS_MAIN_ITEM_PRISM_SCALE
	person_event SPRITE_ELDER, 32, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MagikarpCavernsMainTrialNPC, -1
	person_event SPRITE_BOULDER, 25, 45, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1
	person_event SPRITE_ELDER, 10, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MagikarpCavernsMainSage, EVENT_WON_AGAINST_MAGIKARP_SAGE