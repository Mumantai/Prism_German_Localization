Route69SouthGate_MapScriptHeader:
 ;trigger count
	db 2

	maptrigger .first_time_speech_trigger
	maptrigger GenericDummyScript

 ;callback count
	db 0

.first_time_speech_trigger
	priorityjump Route69SouthGate_FirstTimeThrough
	end

Route69SouthGateHiddenItem:
	dw EVENT_ROUTE_69_SOUTH_GATE_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route69SouthGateGuard:
	checkevent EVENT_RIVAL_ROUTE_69
	sif true
		jumptextfaceplayer .after_beating_rival_text
	jumptextfaceplayer .before_beating_rival_text

.before_beating_rival_text
	ctxt "Be careful."

	para "At times, Naljo"
	line "is unpredictable."
	done

.after_beating_rival_text
	ctxt "Keep on fighting"
	line "<'>til the end!"
	done

Route69SouthGate_FirstTimeThrough:
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
	ctxt "Whoa there!"

	para "I can't let you"
	line "through, sorry."

	para "There's a hold up"
	line "at the house up"
	para "ahead by some"
	line "young punk."

	para "I've already"
	line "called someone"
	para "else to send"
	line "backup."

	para "<...>"

	para "<...>wait. Prof. Ilk"
	line "sent you to help?"

	para "Well, I hope he"
	line "knows what he's"
	cont "doing<...>"

	para "<...>look, I have to"
	line "stand here 24/7"
	para "ever since crime"
	line "went up."

	para "It can be a real"
	line "drag<...>"

	para "Oh, sorry about"
	line "complaining there."

	para "Anyway, I see you"
	line "don't have a Map."

	para "<...>so just take one,"
	line "I don't feel like"
	para "filing a missing"
	line "persons report"
	cont "today<...>"

	para "<PLAYER> was handed"
	line "a Town Map!"
	done

.after_map_text
	ctxt "The house just up"
	line "ahead is where the"
	cont "commotion is."

	para "I bet you will be"
	line "able to handle it!"
	sdone

Route69SouthGate_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 4
	warp_def $5, $0, 3, ROUTE_70
	warp_def $4, $9, 1, ROUTE_69_SOUTH
	warp_def $5, $9, 2, ROUTE_69_SOUTH
	warp_def $4, $0, 1, ROUTE_70

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 1, 7, SIGNPOST_ITEM, Route69SouthGateHiddenItem

	;people-events
	db 1
	person_event SPRITE_OFFICER, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route69SouthGateGuard, -1
