HeathGymUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGymUndergroundInstructionsGuy:
	ctxt "Hah!"
	para "Für die Meisten"
	line "ist Lava nutzlos,"
	para "aber für mich ist"
	line "sie bares Geld!"
	para "Interagiere mit"
	line "der Lava, um Erze"
	cont "zu schmelzen."
	para "Oder mach Kohle"
	line "zu Asche."
	para "Beachte jedoch,"
	line "dass du für Asche"
	para "eine Aschetasche"
	line "benötigst!"
	para "Ach, für das"
	line "geschmolzene Erz"
	para "brauchst du auch"
	line "eine Erztasche."
	para "Mein Händler dort"
	line "drüben sollte noch"
	cont "eine haben."
	done

HeathGymUndergroundOreBuyer:
	faceplayer
	checkevent EVENT_RECEIVED_ORE_CASE
	sif true, then
		callasmf CalculateTotalWorthOfOres
		sif false
			jumptext .no_ores_text
		opentext
		writetext .want_to_sell_ores_text
		yesorno
		sif false, then
			jumptext .refused_text
		selse
			loadarray wTotalOrePrices, 0
			cmdwitharrayargs
			db givemoney_command, %10, 0, 0
			endcmdwitharrayargs
			callasm .ClearOreCaseInventory
			killsfx
			playwaitsfx SFX_TRANSACTION
			jumptext .sold_ores_text
		sendif
	sendif
	opentext
	writetext .introduction_text
	verbosegiveitem ORE_CASE
	sif false
		closetextend
	setevent EVENT_RECEIVED_ORE_CASE
	endtext

.ClearOreCaseInventory
	ld hl, wOreCaseInventory
	ld bc, 10
	xor a
	jp ByteFill

.introduction_text
	ctxt "Hehehe <...>"
	para "Für gutes Geld"
	line "kauf ich dir"
	cont "deine Erze ab."
	para "Nimm diese"
	line "Erztasche, damit"
	para "du geschmolzene"
	line "Erze verstauen"
	cont "kannst."
	prompt

.want_to_sell_ores_text
	ctxt "Ah, willst du mir"
	line "Erze verkaufen?"
	para "Hmm <...>"
	para "Für all diese Erze"
	line "würde ich dir"
	cont "¥@"
	deciram wTotalOrePrices, 3, 7
	ctxt " geben."
	para "Wärst du damit"
	line "einverstanden?"
	done

.sold_ores_text
	ctxt "Super. Hier hast"
	line "du ¥@"
	deciram wTotalOrePrices, 3, 7
	ctxt " für"
	cont "deine Erze."
	done

.refused_text
	ctxt "Gut. Bitte komm"
	line "jederzeit wieder,"
	para "wenn du Erze ver-"
	line "kaufen möchtest."
	done

.no_ores_text
	ctxt "Was? Du hast keine"
	line "Erze in deiner"
	cont "Erztasche."
	para "Schmilz erst ein"
	line "paar Erze, bevor"
	para "du mir was ver-"
	line "kaufen möchtest."
	done

HeathGymUnderground_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $11, $5, 3, HEATH_GYM_UNDERGROUND
	warp_def $13, $7, 3, HEATH_GYM_HOUSE
	warp_def $b, $3, 1, HEATH_GYM_UNDERGROUND

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_BLACK_BELT, 2, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_TEXTFP, 0, HeathGymUndergroundInstructionsGuy, -1
	person_event SPRITE_GRAMPS, 2, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_ORANGE, PERSONTYPE_SCRIPT, 0, HeathGymUndergroundOreBuyer, -1