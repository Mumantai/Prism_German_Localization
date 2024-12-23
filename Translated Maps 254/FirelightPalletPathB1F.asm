FirelightPalletPathB1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

FirelightPalletPathB1FNobu:
	faceplayer
	opentext
	checkevent EVENT_NOBUS_AGGRON_IN_PARTY
	sif false
		jumptext .intro_text
	writetext .found_aggron_text
	special SpecialReturnNobusAggron
	anonjumptable
	dw .not_aggron
	dw .not_aggron
	dw .gave_back_aggron
	dw .only_mon

.intro_text
	ctxt "Mein Kind, kannst"
	line "du mir helfen?"
	para "<...> ugh."
	para "Ich kann mich"
	line "nicht mehr"
	cont "bewegen!"
	para "Mein Partner hat"
	line "einen Körper aus"
	cont "Stahl."
	para "Er könnte mich"
	line "wegtragen."
	para "Kannst du ihn"
	line "zu mir führen?"
	para "Er ist gerade in"
	line "meinem Haus, auf"
	para "der Route 80 <...>"
	para "Beeil dich bitte!"
	done

.found_aggron_text
	ctxt "Hast du meinen"
	line "Partner gefunden?"
	para "<...>"
	para "Gott sei Dank!"
	sdone

.not_aggron
	jumptext .not_aggron_text

.not_aggron_text
	ctxt "Man ärgert ältere"
	line "Menschen nicht."
	done

.only_mon
	jumptext .only_mon_text

.only_mon_text
	ctxt "Ich habe zwar noch"
	line "Schmerzen, jedoch"
	para "weiß ich, dass es"
	line "hier gefährlich"
	cont "ist ohne #mon!"
	para "Bring bitte mehr"
	line "#mon mit."
	done

.gave_back_aggron
	closetext
	appear 3
	cry AGGRON
	showtext .give_back_aggron_text
	applymovement PLAYER, .player_move_away
	applymovement 3, .aggron_approaches
	follow 3, 2
	applymovement 3, .aggron_nobu_leave
	stopfollow
	disappear 3
	disappear 2
	playsound SFX_EXIT_BUILDING
	setevent EVENT_AGGRON_NOT_IN_FIRELIGHT
	clearevent EVENT_NOBUS_AGGRON_IN_PARTY
	clearevent EVENT_NOBU_NOT_IN_HOUSE
	waitsfx
	end

.player_move_away
	step_down
	step_right
	step_end

.aggron_approaches
	step_left
	step_end

.aggron_nobu_leave
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

.give_back_aggron_text
	ctxt "Mein Partner"
	line "bringt mich nun"
	cont "nach Hause, Danke!"
	para "Ich hätte noch"
	line "eine Bitte an"
	cont "dich."
	para "Am Ende dieses"
	line "Tunnels findet"
	para "man die Grabstädte"
	line "eines mächtigen"
	cont "Naljo-Wächters."
	para "Idioten mit"
	line "traditionellen"
	para "Naljo-Gewändern"
	line "versuchen es"
	cont "wiederzubeleben."
	para "Sie erhoffen sich,"
	line "dass dieser"
	para "Wächter Naljo zu"
	line "dem Ort machen"
	para "wird, das es schon"
	line "vor hunderten von"
	cont "Jahren einmal war."
	para "Sie wissen jedoch"
	line "nicht, dass die"
	para "Wächter alle in"
	line "Naljo umbringen"
	para "werden, die nicht"
	line "der Blutlinie der"
	para "ersten Generation"
	line "Naljos angehören."
	para "Unschuldige Leute"
	line "und #mon werden"
	para "umkommen, wenn es"
	line "erwacht!"
	para "Du musst sie"
	line "aufhalten!"
	sdone

FirelightPalletPathB1F_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $21, $25, 1, FIRELIGHT_ROOMS
	warp_def $9, $7, 3, FIRELIGHT_PALLETPATH_1F

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 5
	person_event SPRITE_SAGE, 23, 36, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 1, FirelightPalletPathB1FNobu, EVENT_RESCUED_NOBU
	person_event SPRITE_AGGRON, 24, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_AGGRON_NOT_IN_FIRELIGHT
	person_event SPRITE_POKE_BALL, 5, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_FIRELIGHT_PALLETPATH_B1F_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 17, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_DUST_DEVIL, 0, EVENT_FIRELIGHT_PALLETPATH_B1F_TM_DUST_DEVIL
	person_event SPRITE_BOULDER, 21, 33, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_JUMPSTD, 0, strengthboulder, -1