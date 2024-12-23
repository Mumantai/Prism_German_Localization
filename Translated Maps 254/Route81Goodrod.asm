Route81Goodrod_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Route81GoodrodNPC:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_81_GOODROD
	sif true
		jumptext .already_gave_rod_text
	giveitem GOOD_ROD, 1
	sif false
		jumptext .no_space_text
	writetext .introduction_text
	playwaitsfx SFX_ITEM
	itemnotify
	setevent EVENT_ROUTE_81_GOODROD
	endtext

.introduction_text
	ctxt "Hi!"
	para "Ich bin der Angel"
	line "Gurus <...> ähm."
	para "Nunja, ich bin mit"
	line "Ihm verwandt."
	para "Ich habe hier eine"
	line "professionelle"
	para "Angel für dich."
	line "Wir nennen sie"
	cont "Profiangel!"
	para "Viel Spaß!"
	done

.already_gave_rod_text
	ctxt "Die Profiangel ist"
	line "viel besser als"
	cont "die alte Angel."
	para "Fang damit große"
	line "#mon für mich!"
	done

.no_space_text
	ctxt "Du hast kein"
	line "platz im Beutel!"
	done

Route81Goodrod_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $7, $2, 7, ROUTE_81
	warp_def $7, $3, 7, ROUTE_81

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route81GoodrodNPC, -1