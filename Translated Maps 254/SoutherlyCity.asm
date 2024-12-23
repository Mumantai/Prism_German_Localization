SoutherlyCity_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_fly_flag

.set_fly_flag
	setflag ENGINE_FLYPOINT_SOUTHERLY_CITY
	return

SoutherlyCityGymSign:
	ctxt "#mon Arena"
	next "Leiter: Ernest"
	next "Der Trainer mit"
	next "der Feuerkraft!"
	done

SoutherlyCityBattleBuildingSign:
	ctxt "×Kampf-Dojo×"
	next "Teste deine"
	next "Fähigkeiten!"
	done

SoutherlyCityCitySign:
	ctxt "Das Tor zum"
	next "Paradies!"
	done

SoutherlyCityAirportSign:
	ctxt "Transport Hub"
	nl   ""
	next "Flughafen &"
	next "Magnetbahn"
	done

SoutherlyCityBridgeBlock:
	faceperson PLAYER, LEFT
	scall SoutherlyCityBridgeGuard
	applymovement PLAYER, .move_away
	end

.move_away
	step_down
	step_end

SoutherlyCityBridgeGuard:
	jumptextfaceplayer .text

.text
	ctxt "An der Brücke wird"
	line "noch gearbeitet."
	done

SoutherlyCityRunwayGuard:
	ctxt "Das ist die "
	line "Rollbahn für "
	cont "unseren Flughafen."
	para "Ich kann dich hier"
	line "nicht durchlassen,"
	para "außer du checkst "
	line "am Terminal ein."
	done

SoutherlyCityTeleporter:
	ctxt "Die neue Magnet-"
	next "bahn erweiterung"
	next "hat nun geöffnet!"
	nl   ""
	next "<DOWN> Transport Hub"
	done

SoutherlyCityNPC1:
	ctxt "Der Flughafen hat "
	line "ein neues "
	cont "Flugzeug!"
	para "Es ist komplett "
	line "mit #mon "
	cont "verziert!"
	done

SoutherlyCityNPC2:
	ctxt "Jedes Mal, wenn "
	line "man denkt, man hat"
	para "den Dreh bei der "
	line "Ausdauerübung "
	para "raus, wird man "
	line "erneut überrascht!"
	para "Ich versuche es "
	line "schon seit Jahren!"
	done

SoutherlyCityNPC3:
	ctxt "Es ist verdammt "
	line "schwer rüber nach "
	cont "Naljo zu kommen."
	para "Hoffentlich bauen "
	line "sie bald eine "
	cont "Brücke."
	done

SoutherlyCityTyphlosion:
	faceplayer
	opentext
	writetext .text
	cry TYPHLOSION
	endtext

.text
	ctxt "Tornupto: Roar!"
	done

SoutherlyCityTyphlosionTrainer:
	ctxt "Mein Tornupto ist "
	line "mein bester "
	cont "Freund!"
	para "Ich weiß noch, als"
	line "es ein kleines "
	cont "Feurigel war <...> "
	done

SoutherlyCity_MapEventHeader:: db 0, 0

.Warps
	db 7
	warp_def $7, $6, 1, SOUTHERLY_HOUSE2
	warp_def $7, $b, 1, SOUTHERLY_HOUSE
	warp_def $7, $16, 1, SOUTHERLY_BATTLE_HOUSE
	warp_def $11, $5, 1, SOUTHERLY_MART
	warp_def $11, $b, 1, SOUTHERLY_GYM
	warp_def $1b, $9, 1, SOUTHERLY_AIRPORT
	warp_def $11, $14, 1, SOUTHERLY_POKECENTER

.CoordEvents
	db 1
	xy_trigger 0, $4, $10, SoutherlyCityBridgeBlock

.BGEvents
	db 5
	signpost 17, 13, SIGNPOST_LOAD, SoutherlyCityGymSign
	signpost  7, 25, SIGNPOST_LOAD, SoutherlyCityBattleBuildingSign
	signpost  7, 15, SIGNPOST_LOAD, SoutherlyCityCitySign
	signpost 27, 13, SIGNPOST_LOAD, SoutherlyCityAirportSign
	signpost 17, 18, SIGNPOST_LOAD, SoutherlyCityTeleporter

.ObjectEvents
	db 7
	person_event SPRITE_LASS, 25, 15, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC1, -1
	person_event SPRITE_BLACK_BELT, 8, 24, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC2, -1
	person_event SPRITE_FISHER, 28, 23, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyCityNPC3, -1
	person_event SPRITE_COOLTRAINER_F, 9, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_TEXTFP, 0, SoutherlyCityTyphlosionTrainer, -1
	person_event SPRITE_TYPHLOSION, 9, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SoutherlyCityTyphlosion, -1
	person_event SPRITE_OFFICER, 32,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TEXTFP, 0, SoutherlyCityRunwayGuard, -1
	person_event SPRITE_OFFICER, 4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SoutherlyCityBridgeGuard, -1