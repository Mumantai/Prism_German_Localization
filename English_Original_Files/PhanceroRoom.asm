PhanceroRoom_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

PhanceroNPC:
	faceplayer
	opentext
	writetext .encounter_text
	cry PHANCERO
	waitbutton
	closetext
	setlasttalked 255
	loadwildmon PHANCERO, 70
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	writecode VAR_EVENTMONRESPAWN, EVENTMONRESPAWN_PHANCERO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_PHANCERO
	disappear 7
	playsound SFX_WARP_TO
	applymovement PLAYER, .warp_from
	warp HAUNTED_MANSION_BASEMENT, 12, 10
	playsound SFX_WARP_FROM
	applymovement PLAYER, .warp_to
	special HealParty
	showtext .get_balls_text
	giveitem GREAT_BALL, 6
	end

.warp_from
	teleport_from
	step_end

.warp_to
	teleport_to
	step_end

.encounter_text
	text "└<BOLDB>┘Gyaaa!!!!│+'M<DOT>¥"
	done

.get_balls_text
	ctxt "You find your bag"
	line "slightly heavier<...>"
	sdone

PhanceroEncounterData:
	dbww 2, PhanceroEncounter1Text, EVENT_PHANCERO_ENCOUNTER_1
PhanceroEncounterDataEntrySizeEnd:
	dbww 3, PhanceroEncounter2Text, EVENT_PHANCERO_ENCOUNTER_2
	dbww 4, PhanceroEncounter3Text, EVENT_PHANCERO_ENCOUNTER_3
	dbww 5, PhanceroEncounter4Text, EVENT_PHANCERO_ENCOUNTER_4
	dbww 6, PhanceroEncounter5Text, EVENT_PHANCERO_ENCOUNTER_5

PhanceroEncounter1:
	switch 0
PhanceroEncounter2:
	switch 1
PhanceroEncounter3:
	switch 2
PhanceroEncounter4:
	switch 3
PhanceroEncounter5:
	writebyte 4
	sendif

	loadarray PhanceroEncounterData
	faceplayer
	opentext
	readarrayhalfword 1
	writetext -1
	cry PHANCERO
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_FLASH
	readarray 0
	setlasttalked 0
	disappear LAST_TALKED
	special FadeInPalettes
	readarrayhalfword 3
	setevent -1
	end

PhanceroEncounter1Text:
	text "└]¥<BOLDB>┘GyM♀"
	done

PhanceroEncounter2Text:
	text "♀!│♂+'M<DOT>¥♀"
	done

PhanceroEncounter3Text:
	text "└]F<BOLDB>!!!T3¥♀"
	done

PhanceroEncounter4Text:
	text "└¥┌│┘D5▶'M<DOT>¥└♀"
	done

PhanceroEncounter5Text:
	text "│─│││││¥R¥└¥♀▼▼▼<BOLDB><BOLDB>"
	done

GlitchCitySignpost1:
	text "5r!k№RVbNUX/Vma▲Fu2fVa│¥Zu5y2108│-DOsd3x│#×Z│¥│3]♀pjBTL'M'Mekk¥h│M│V"
	cont "wY#a│#×│H'M_Tk_#<RIGHT>4&'r./<MN>♀'d<LEFT>"
	para "r&CAtDIS70_▲IF│││iFYouH4V3AsPec1ALCODE<DOWN>[<''>0┌s◀│└¥"
	done

GlitchCitySignpost2:
	text "┐▼│¥┐└--┌-♂♀_┐♀¥└▼┐¥+¥│]┌¥¥[¥#-│┐¥┘!┘┘♂×♀│¥¥└-♀"
	cont "<RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>FA<RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>T<RIGHT><RIGHT><RIGHT><RIGHT>E<RIGHT><RIGHT>4&'r./<MN>♀'d<LEFT>"
	para "+ENDsr└¥♀r×│_└♀№♀<MN><MN><MN><MN><MN><MN><MN><MN>HERE┘¥┐│r┘♀×♀¥┐└¥♀№]◀r-×└└┐_│#♀_#♂×CODE<DOWN>[№0┌s◀│└¥"
	done

GlitchCitySignpost3:
	text "M│5U││0;2f┐D×D♀XZ#k№Ts#j♀8└!┌№5U¥│2Lx№MZhZrU!h│bu│!mhrjVj┌│BZV┐¥-k!sZr│jFj┌"
	cont "wY#a│#×│H'M_Tk_#<RIGHT>4&'r./<MN>♀'d<LEFT>"
	para "r&CAt0fI4lc_uF+t-+wdVCIFYOUH444V3A5Pec1ALCODE<DOWN>[№0┌s◀│└¥"
	done

GlitchCitySignpostBurned:
	text "M│5U││0;2f┐<...>YOUh│r▼!¥│__│!mh<...>tRY│┌│haRd┐¥-k!sZr│jFj┌"
	line "wY#a│#×│H'aRD<RIGHT>./<MN>to_READ"
	line "r&CAt0f<...>thEE┘SIGN<DOWN>[№0┌s◀│└¥"
	para "YOUh│rU!h│but│▼│¥it'sss¥┐└¥♀too▼│¥<...>ChArrrrrrrEd│toREad<DOWN>[№0┌s◀│└¥"
	done

PhanceroRoom_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 6
	signpost 9, 73, SIGNPOST_TEXT, GlitchCitySignpost1
	signpost 9, 61, SIGNPOST_TEXT, GlitchCitySignpost2
	signpost 9, 45, SIGNPOST_TEXT, GlitchCitySignpost2
	signpost 9, 49, SIGNPOST_TEXT, GlitchCitySignpost1
	signpost 13, 41, SIGNPOST_TEXT, GlitchCitySignpost3
	signpost 3, 1, SIGNPOST_TEXT, GlitchCitySignpostBurned

.ObjectEvents: db 6
	person_event SPRITE_PHANCERO, 4, 79, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroEncounter1, EVENT_PHANCERO_ENCOUNTER_1
	person_event SPRITE_PHANCERO, 11, 55, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroEncounter2, EVENT_PHANCERO_ENCOUNTER_2
	person_event SPRITE_PHANCERO, 5, 43, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroEncounter3, EVENT_PHANCERO_ENCOUNTER_3
	person_event SPRITE_PHANCERO, 5, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroEncounter4, EVENT_PHANCERO_ENCOUNTER_4
	person_event SPRITE_PHANCERO, 7, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroEncounter5, EVENT_PHANCERO_ENCOUNTER_5
	person_event SPRITE_PHANCERO, 1, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PhanceroNPC, -1
