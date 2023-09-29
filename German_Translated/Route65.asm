Route65_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route65HiddenItem:
	dw EVENT_ROUTE_65_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route65Sign:
	ctxt "Der Pfad zur"
	next "Rijon-Liga!"
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
	ctxt "Prismaschlüssel:"
	line "Baum außerhalb der"
	cont "Maritima Arena."
	done

Route65_Rival:
	trainer EVENT_ROUTE_65_RIVAL, RIVAL1, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	jumptext .after_battle_text

.before_battle_text
	ctxt "Bleib stehen!"

	para "Seit ich aus dem"
	line "Gefängnis raus bin"
	para "sehe ich diese"
	line "Welt mit anderen"
	cont "Augen!"

	para "Das Leben als"
	line "Flüchtling ist"
	cont "sehr schwer."

	para "Wenn ich Nachts"
	line "kein Auge zu"
	para "kriege, wird mir"
	line "klar, wie froh ich"
	para "bin, meine #mon"
	line "um mich herum"
	cont "zu haben."

	para "Mein Band zu ihnen"
	line "wurde stärker und"
	para "dadurch wurde auch"
	line "ich immer stärker."

	para "Es ist Zeit, meine"
	line "Kraft in einem"
	cont "Kampf zu testen!"
	done

.battle_won_text
	ctxt "Ich muss noch viel"
	line "mehr lernen."
	done

.after_battle_text
	ctxt "Ich weiß, dass ich"
	line "meinen #mon und"
	para "Anderen viel Scha-"
	line "den zugefügt habe." 
	
	para "Doch dank dir, bin"
	line "bin ich bereit für"
	cont "einen Neuanfang."
	
	para "Ich werde ein"
	cont "besserer Trainer!"

	para "Die Art, wie deine" 
	line "#mon kämpfen,"
	para "zeigt mir deine"
	line "innere Stärke und"
	cont "Entschlossenheit."

	para "Ein Trainer wie du"
	line "ist dazu bestimmt,"
	cont "Champion zu sein."	

	para "Ich hoffe wir"
	line "sehen uns wieder,"
	cont "Trainer<...>"
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
