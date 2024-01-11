HeathInn_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_blackout

.set_blackout:
	blackoutmod HEATH_VILLAGE
	return

HeathInnNPC:
	ctxt "Es gibt nur eine"
	line "Familie hier in"
	cont "unserem Heidenau."
	para "Meine Familie lebt"
	line "hier schon seit"
	cont "Jahrhunderten so."
	para "Mein Cousin Rinji"
	line "übt mit den"
	para "Kindern oft im"
	line "Wald wie man"
	cont "Kämpft."
	para "Meine Oma kümmert"
	line "sich um die Räume"
	para "in diesem Gasthaus"
	line "und meinem Bruder"
	cont "gehört der Markt."
	done

HeathInnAttendant:
	opentext
	special PlaceMoneyTopRight
	writetext .opening_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 100
	sif =, 2
		jumptext .not_enough_money_text
	writetext .accepted_text
	special ClearBGPalettes
	writebyte 4
.loop
	playwaitsfx SFX_SNORE
	pause 20
	addvar -1
	iftrue .loop
	special HealParty
	reloadmap
	takemoney 0, 100
	jumptext .after_healing_text

.opening_text
	ctxt "Oh, du und deine"
	line "#mon sehen müde"
	cont "aus."
	para "Für ¥100 könnt ihr"
	line "euch hier erholen."
	done

.declined_text
	ctxt "Oh, na gut. Ihr"
	line "seid hier immer"
	cont "willkommen."
	done

.accepted_text
	ctxt "Danke, erholt"
	line "euch gut!"
	prompt

.after_healing_text
	ctxt "Willkommen zurück!"
	line "Ich hoffe, du hast"
	para "deinen Aufenthalt"
	line "bei uns genossen."
	done

.not_enough_money_text
	ctxt "Du hast nicht"
	line "genug Geld dabei."
	done

HeathInn_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $9, $9, 5, HEATH_VILLAGE
	warp_def $9, $a, 5, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 1, 14, SIGNPOST_JUMPSTD, magazinebookshelf
	signpost 1, 3, SIGNPOST_JUMPSTD, magazinebookshelf

.ObjectEvents
	db 3
	person_event SPRITE_BLACK_BELT, 6, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathInnNPC, -1
	person_event SPRITE_GRANNY, 4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HeathInnAttendant, -1
	person_event SPRITE_YOUNGSTER, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_MART, 0, MART_STANDARD, HEATH_STANDARD_MART, -1