AzaleaKurt_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, .open_basement

.open_basement
	checkevent EVENT_UNLOCK_KURT_CHAMBER
	sif true
		changeblock 14, 4, $1e
	return

AzaleaKurtBallMakingTools:
	farjump BallMakingScript

AzaleaKurtKurt:
	ctxt "Ich bin Kurt."
	para "Früher habe ich"
	line "Tag und Nacht nur"
	cont "#bälle gebaut."
	para "Doch heutzutage <...>"
	para "Du kannst aber"
	line "gerne selbst Hand"
	cont "anlegen."
	para "Werkzeuge findest"
	line "du auf dem Tisch"
	para "rechts. Du wirst"
	line "schon rausfinden,"
	cont "wie das geht."
	done

AzaleaKurtGranddaughter:
	faceplayer
	opentext
	copybytetovar wBallMakingLevel
	sif <, 35
		jumptext .low_level_text
	checkevent EVENT_UNLOCK_KURT_CHAMBER
	sif true
		jumptext .already_unlocked_basement_text
	writetext .before_unlocking_basement_text
	follow 2, PLAYER
	closetext
	checkcode VAR_FACING
	sif =, UP, then
		applymovement 2, .movement_facing_up
	selse
		applymovement 2, .movement_not_facing_up
	sendif
	stopfollow
	playsound SFX_ENTER_DOOR
	changeblock 14, 4, $1e
	setevent EVENT_UNLOCK_KURT_CHAMBER
	jumptext .unlocked_basement_text

.movement_facing_up
	slow_step_right
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	turn_head_left
	step_end

.movement_not_facing_up
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	turn_head_left
	step_end

.low_level_text
	ctxt "Mein Opa baute vor"
	line "seiner Krankheit"
	para "die #bälle noch"
	line "ganz alleine."
	para "Jetzt bringt er"
	line "Leuten bei, wie"
	cont "sie selbst welche"
	cont "herstellen können."
	done

.before_unlocking_basement_text
	ctxt "Wow, du kannst"
	line "Freundesbälle"
	cont "herstellen?"
	para "Ich sollte dir das"
	line "nicht zeigen <...>"
	cont "aber folge mir."
	sdone

.unlocked_basement_text
	ctxt "In meiner Hütte"
	line "gibt es Werkzeuge,"
	para "mit denen man"
	line "seltene Bälle"
	cont "herstellen kann."
	para "Sie sind schwierig"
	line "herzustellen, also"
	para "wird es nicht"
	line "immer erfolgreich"
	cont "sein."
	para "Aber je mehr"
	line "Erfahrung du hast,"
	para "umso einfacher ist"
	line "die Herstellung."
	done

.already_unlocked_basement_text
	ctxt "Vieleicht kannst"
	line "du Opas Erbe"
	cont "fortführen."
	para "Ich glaub an dich!"
	done

AzaleaKurt_MapEventHeader:: db 0, 0

.Warps
	db 3
	warp_def $7, $3, 3, AZALEA_TOWN
	warp_def $7, $4, 3, AZALEA_TOWN
	warp_def $5, $f, 1, AZALEA_KURT_BASEMENT

.CoordEvents
	db 0

.BGEvents
	db 1
	signpost 2, 14, SIGNPOST_READ, AzaleaKurtBallMakingTools

.ObjectEvents
	db 2
	person_event SPRITE_LASS, 4, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AzaleaKurtGranddaughter, -1
	person_event SPRITE_KURT, 2, 3, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, AzaleaKurtKurt, -1