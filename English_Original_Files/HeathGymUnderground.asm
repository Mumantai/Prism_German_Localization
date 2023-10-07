HeathGymUnderground_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

HeathGymUndergroundInstructionsGuy:
	ctxt "Hah!"

	para "Lava may seem"
	line "useless to some,"
	para "but to me, it's a"
	line "big money maker!"

	para "Interact with the"
	line "lava to smelt"
	para "whatever ore you"
	line "may have mined."

	para "Or turn your coal"
	line "into ash."

	para "Just make sure you"
	line "have your Soot"
	para "Sack before you"
	line "put your coal in"
	cont "there!"

	para "Oh, and you'll need"
	line "an Ore Case to"
	para "store your smelted"
	line "Ores."

	para "Talk to my dealer"
	line "over there to"
	cont "receive one."
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
	ctxt "Hehehe<...>"

	para "You can sell your"
	line "ores to me for"
	cont "big money."

	para "Take this Ore Case"
	line "so you have a"
	para "place to store all"
	line "of the ores you"
	cont "smelt."
	prompt

.want_to_sell_ores_text
	ctxt "Ah, you wish to"
	line "sell me some ores?"

	para "Hmm<...>"

	para "All your ores sum"
	line "up to a total of"
	cont "¥@"
	deciram wTotalOrePrices, 3, 7
	ctxt "."

	para "Will you sell"
	line "these ores to me?"
	done

.sold_ores_text
	ctxt "Very well. In"
	line "exchange for your"
	para "ores, here are"
	line "your ¥@"
	deciram wTotalOrePrices, 3, 7
	text "."
	done

.refused_text
	ctxt "Very well. Please"
	line "come again when"
	para "you feel the need"
	line "to sell some ores."
	done

.no_ores_text
	ctxt "What? You don't"
	line "have any ores in"
	cont "your Ore Case."

	para "Smelt some ores"
	line "first, then talk"
	para "to me to sell"
	line "them."
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
