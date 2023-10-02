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
	ctxt "Willkommen!"
	para "Ich bin der"
	line "Eier-Gutachter!"
	para "Einige spezielle"
	line "Eier sind in"
	para "wirklichkeit"
	line "#mon."
	para "Bring mir ein Ei"
	line "und ich kann dir"
	para "sagen, ob es in"
	line "Wahrheit ein"
	para "seltenes #mon"
	cont "ist!"
	sdone

.egg_text
	ctxt "Hammer!"
	para "Dein <STRBF3>"
	line "ist tatsächlich"
	para "ein seltenes"
	line "#mon!"
	sdone

.got_egg_text
	ctxt "<PLAYER> nimmt das"
	line "Ei ins Team auf."
	done

.invalid_egg_text
	ctxt "Das Ei <...>"
	para "ist zwar"
	line "besonders <...> Aber"
	para "leider kein"
	line "#mon."
	done

.come_back_text
	ctxt "Komm gerne wieder,"
	line "wenn du weitere"
	cont "Eier findest!"
	done

.no_more_eggs_text
	ctxt "Ich glaub, es gibt"
	line "keine weiteren"
	para "speziellen Eier"
	line "mehr <...>"
	para "Tut mir leid."
	done

.no_room_in_party_text
	ctxt "Du hast kein Platz"
	line "in deinem Team."
	para "Komm mit mehr"
	line "Platz zurück!"
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