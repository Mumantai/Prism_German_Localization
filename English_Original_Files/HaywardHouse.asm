HaywardHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

EggAppraiserScript:
	clearevent EVENT_0
	faceplayer
	opentext
	checkevent EVENT_EGG_APPRAISER
	sif false, then
		writetext .introduction_text
		setevent EVENT_EGG_APPRAISER
	sendif
	writebyte GOLD_EGG
	copyvartobyte wTempNumber
	checkitem 0
	sif true, then
		scall .check_egg
		sif false
			end
		giveegg HO_OH, 1
		setevent EVENT_GOT_HOOH_EGG
		scall .got_egg
	sendif
	writebyte SILVER_EGG
	copyvartobyte wTempNumber
	checkitem 0
	sif true, then
		scall .check_egg
		sif false
			end
		giveegg LUGIA, 1
		scall .got_egg
	sendif
	checkevent EVENT_0
	sif false, then
		checkitem CRYSTAL_EGG
		sif true
			jumptext .invalid_egg_text
		checkitem RUBY_EGG
		sif true
			jumptext .invalid_egg_text
		checkitem SAPPHIRE_EGG
		sif true
			jumptext .invalid_egg_text
		checkitem EMERALD_EGG
		sif true
			jumptext .invalid_egg_text
		checkitem LUCKY_EGG
		sif true
			jumptext .invalid_egg_text
	sendif
	checkevent EVENT_GOT_HOOH_EGG
	sif false
		jumptext .come_back_text
	checkevent EVENT_GOT_LUGIA_EGG
	sif false
		jumptext .come_back_text
	jumptext .no_more_eggs_text

.check_egg
	copybytetovar wTempNumber
	itemtotext 0, 0
	copyvartobyte wCurItem
	writetext .egg_text
	checkcode VAR_PARTYCOUNT
	addvar -6
	sif false
		jumptext .no_room_in_party_text
	copybytetovar wTempNumber
	takeitem ITEM_FROM_MEM
	writebyte 1
	end

.got_egg
	writetext .got_egg_text
	playwaitsfx SFX_GET_EGG_FROM_DAYCARE_MAN
	setevent EVENT_0
	end

.introduction_text
	ctxt "Welcome, welcome!"

	para "I am the Egg"
	line "Appraiser!"

	para "Certain special"
	line "eggs are actually"
	cont "#mon."

	para "Bring me an egg"
	line "and I'll see if"
	para "it's actually a"
	line "rare #mon!"
	sdone

.egg_text
	ctxt "Incredible!"

	para "This <STRBF3> is"
	line "actually a #mon"
	cont "egg!"
	sdone

.got_egg_text
	ctxt "<PLAYER> added"
	line "the egg to the"
	cont "party!"
	done

.invalid_egg_text
	ctxt "This egg<...>"

	para "It's special all"
	line "right."

	para "But it's not a"
	line "#mon, sorry!"
	done

.come_back_text
	ctxt "Come back if you"
	line "find more special"
	cont "eggs."
	done

.no_more_eggs_text
	ctxt "I don't think you"
	line "will be able to"

	para "find more special"
	line "#mon eggs."

	para "How I could help!"
	done

.no_room_in_party_text
	ctxt "You don't have any"
	line "room for this."

	para "Please free some"
	line "space in your"
	cont "party."
	done

HaywardHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 7, 2, 8, HAYWARD_CITY
	warp_def 7, 3, 8, HAYWARD_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_R_MANIAC, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EggAppraiserScript, -1
