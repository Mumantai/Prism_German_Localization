LongTunnelSidescroll_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

LongTunnelSidescrollGuard:
	faceplayer
	opentext
	checkitem RIJON_PASS
	sif false, then
		checkevent EVENT_ROUTE_73_GUARD
		sif true
			jumptext .no_pass_text_2
		jumptext .no_pass_text_1
	sendif
	writetext .gave_rijon_pass_text
	takeitem RIJON_PASS, 1
	showtext .before_leaving_text
	applymovement 2, .guard_goes_away
	disappear 2
	setevent EVENT_RIJON_GUARD
	end

.guard_goes_away
	step_right
	step_up
	step_up
	step_right
	step_up
	step_up
	step_up
	step_end

.no_pass_text_1
	ctxt "Hello."

	para "I can't let you"
	line "through without"
	cont "a Rijon Pass."

	para "Come back when"
	line "you have one."
	done

.no_pass_text_2
	ctxt "A Rijon Pass is"
	line "required to pass."
	done

.gave_rijon_pass_text
	ctxt "<PLAYER> handed the"
	line "Rijon Pass to"
	cont "the guard."
	prompt

.before_leaving_text
	ctxt "Let me verify"
	line "this card<...>"

	para "It looks like you"
	line "are good to go!"

	para "Enjoy the Rijon"
	line "region!"
	sdone

LongTunnelSidescroll_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $5, $6, 3, LONG_TUNNEL_PATH
	warp_def $5, $62, 5, LONG_TUNNEL_PATH

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 2
	person_event SPRITE_OFFICER, 17, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LongTunnelSidescrollGuard, EVENT_RIJON_GUARD
	person_event SPRITE_POKE_BALL, 6, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 5, MINING_PICK, EVENT_LONG_TUNNEL_SIDESCROLL_ITEM_MINING_PICKS
