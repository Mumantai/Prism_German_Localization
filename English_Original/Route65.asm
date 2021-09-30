Route65_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route65HiddenItem:
	dw EVENT_ROUTE_65_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route65Sign:
	ctxt "Path to Rijon"
	next "League"
	done

Route65QRCode:
	opentext
	qrcode 3
	checkitem QR_READER
	sif false
		closetextend
	farwritetext UsingQRScannerText
	playwaitsfx SFX_CALL
	jumptext .text

.text
	ctxt "Prism Key: Tree"
	line "outside Seashore"
	cont "Gym"
	done

Route65_Rival:
	trainer EVENT_ROUTE_65_RIVAL, RIVAL1, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Don't go any"
	line "further."

	para "I travelled this"
	line "world with diff-"
	para "erent eyes since"
	line "I escaped prison."

	para "Life as a fugitive"
	line "is difficult and"
	cont "empty."

	para "When I lay awake"
	line "at night with my"
	para "#mon at my"
	line "side, I realize"
	para "that I am actually"
	line "thankful for their"
	cont "presence."

	para "My bonds with them"
	line "have grown while I"
	para "have grown"
	line "stronger."

	para "It's time for me to"
	line "test my strength"
	cont "in battle!"
	done

.battle_won_text
	ctxt "I still have more"
	line "to learn."
	done

.after_battle_text
	ctxt "I know I've done"
	line "much harm to"
	para "others as well as"
	line "my own #mon," 
	para "but thanks to the"
	line "example you set,"
	para "I'm ready to start"
	line "over and be the"
	cont "better Trainer."

	para "The way your" 
	line "#mon battle"
	para "reflects your"
	line "inner strength and"
	cont "resolve."

	para "A Trainer like you"
	line "is destined to be"
	cont "champion."

	para "So long until next"
	line "time, Trainer."
	done

Route65_MapEventHeader ;filler
	db 0, 0

;warps
	db 3
	warp_def $73, $d, 1, ROUTE_67_GATE
	warp_def $8b, $7, 1, JAERU_GATE
	warp_def $8b, $8, 2, JAERU_GATE

	;xy triggers
	db 0

	;signposts
	db 4
	signpost 136, 8, SIGNPOST_LOAD, Route65Sign
	signpost 21, 12, SIGNPOST_LOAD, Route65Sign
	signpost 100, 14, SIGNPOST_ITEM, Route65HiddenItem
	signpost 123, 4, SIGNPOST_READ, Route65QRCode

	;people-events
	db 1
	person_event SPRITE_SILVER, 15, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 6, Route65_Rival, -1
