Route69Gate_MapScriptHeader;trigger count
	db 2

	maptrigger .first_time_speech_trigger
	maptrigger GenericDummyScript

 ;callback count
	db 0

.first_time_speech_trigger
	priorityjump Route69Gate_FirstTimeThrough
	end

Route69GateHiddenItem:
	dw EVENT_ROUTE_69_GATE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route69GateGuard:
	checkevent EVENT_RIVAL_ROUTE_69
	sif true
		jumptextfaceplayer .after_beating_rival_text
	jumptextfaceplayer .before_beating_rival_text

.before_beating_rival_text
	ctxt "Sei vorsichtig."

	para "Manchmal ist Naljo"
	line "berechenbar."
	done

.after_beating_rival_text
	ctxt "Kämpfe weiter und"
	line "immer weiter!"
	done

Route69Gate_FirstTimeThrough:
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	spriteface 2, DOWN
	showemote EMOTE_SHOCK, 2, 15
	applymovement 2, .guard_walks_to_player
	opentext
	writetext .opening_text
	playwaitsfx SFX_DEX_FANFARE_50_79
	waitbutton
	setflag ENGINE_HAS_MAP
	dotrigger 1
	writetext .after_map_text
	closetext
	applymovement 2, .guard_walks_back
	special RestartMapMusic
	end

.guard_walks_to_player
	step_down
	step_down
	turn_head_left
	step_end

.guard_walks_back
	step_up
	step_up
	turn_head_down
	step_end

.opening_text
	ctxt "Hey du!"

	para "Ich kann dich"
	line "nicht durchlassen!"

	para "Irgendein Punk,"
	line "macht am Haus auf"
	cont "dem Hügel einen"
	cont "riesen Aufstand."

	para "Ich habe schon"
	line "Unterstützung"
	cont "gerufen."

	para "<...>"

	para "<...>warte. Prof. Ilk"
	line "schickt dich?"

	para "Ich hoffe, er weiß"
	line "was er tut<...>"

	para "<...>ich muss Tag"
	line "und Nacht Wache"
	cont "stehen, seit die"
	cont "Kriminalität hier"
	cont "gestiegen ist."

	para "Das zieht einen"
	line "schon runter<...>"

	para "Aber ich sollte"
	line "mich nicht so viel"
	cont "beschweren."
	
	para "Wie ich sehe, hast"
	line "du keine Karte."
	
	para "Hier, nimm. Ich"
	line "will doch nicht,"
	cont "dass du dich noch"
	cont "verläufst<...>"

	para "<PLAYER> erhält"
	line "eine Karte!"
	done

.after_map_text
	ctxt "Setz dem Aufruhr"
	line "oben auf dem Hügel"
	cont "ein Ende."

	para "Ich wette, das"
	line "kriegst du hin!"
	sdone

Route69Gate_MapEventHeader ;filler
	db 0, 0

;warps
	db 4
	warp_def $5, $0, 3, ROUTE_70
	warp_def $4, $9, 1, ROUTE_69
	warp_def $5, $9, 2, ROUTE_69
	warp_def $4, $0, 1, ROUTE_70

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 1, 7, SIGNPOST_ITEM, Route69GateHiddenItem

	;people-events
	db 1
	person_event SPRITE_OFFICER, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route69GateGuard, -1
