SpurgeGymHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SpurgeGymHouseAbra:
	faceplayer
	opentext
	writetext .text
	cry ABRA
	endtext

.text
	ctxt "Abra: Aabraa<...>"
	done

SpurgeGymHouseTeleportationNPC:
	faceplayer
	opentext
	writetext .introduction_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 400
	sif !=, 2, then
		writetext .paid_text
	selse
		writetext .not_enough_money_text
	sendif
	takemoney 0, 400
	waitbutton
	closetext
	playsound SFX_WARP_FROM
	special FadeOutPalettes
	waitsfx
	warp SPURGE_GYM_1F, 4, 4 ; add actual coords
	end

.introduction_text
	ctxt "Fufufu<...> Are you"
	line "stuck, child?"

	para "My Abra can let"
	line "you out, for a"
	cont "small fee<...>"

	para "How's about<...> ¥400?"
	done

.declined_text
	ctxt "Fufufu<...> fine by"
	line "me."
	done

.paid_text
	ctxt "Fufufu<...> very well."
	done

.not_enough_money_text
	ctxt "Eh?! You don't have"
	line "enough money?"

	para "Give me whatever"
	line "you have, then."
	done

SpurgeGymHouse_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 1
	warp_def $0, $7, 1, SPURGE_GYM_B1F

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_GRAMPS, 4, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SpurgeGymHouseTeleportationNPC, -1
	person_event SPRITE_ABRA, 4, 2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, SpurgeGymHouseAbra, -1
