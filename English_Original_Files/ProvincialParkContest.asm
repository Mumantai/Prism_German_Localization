ProvincialParkContest_MapScriptHeader:
	;trigger count
	db 1
	maptrigger GenericDummyScript

	;callback count
	db 0

ProvincialParkContest_Spot1:
	switch 1

ProvincialParkContest_Spot2:
	switch 2

ProvincialParkContest_Spot3:
	switch 3

ProvincialParkContest_Spot4:
	switch 4

ProvincialParkContest_Spot5:
	switch 5

ProvincialParkContest_Spot6:
	switch 6

ProvincialParkContest_Spot7:
	switch 7

ProvincialParkContest_Spot8:
	switch 8

ProvincialParkContest_Spot9:
	switch 9

ProvincialParkContest_Spot10:
	switch 10

ProvincialParkContest_Spot11:
	switch 11

ProvincialParkContest_Spot12:
	switch 12

ProvincialParkContest_Spot13:
	writebyte 13

	sendif
	farjump ParkSpotScript

ProvincialParkContest_FirelightCavernsEntranceNPC:
	faceplayer
	showtext .firelight_caverns_not_allowed_text
	spriteface 2, DOWN
	end

.firelight_caverns_not_allowed_text
	ctxt "Firelight Caverns"
	line "are off-limits"
	para "during the"
	line "challenge."

	para "Insisting won't"
	line "make me move."
	sdone

ProvincialParkContest_GateNPC:
	faceplayer
	scall ProvincialParkContest_QuitParkMinigame
	sif false
		spriteface 3, LEFT
	end

ProvincialParkContest_GateNPCTrigger:
	spriteface 3, DOWN
	scall ProvincialParkContest_QuitParkMinigame
	sif true
		end
	spriteface 3, LEFT
	applymovement PLAYER, .go_back
	end

.go_back
	step_left
	step_end

ProvincialParkContest_QuitParkMinigame:
	opentext
	writetext .are_you_leaving_text
	yesorno
	closetext
	sif false
		end
	farscall StopParkMinigameScript
	writebyte 1
	end

.are_you_leaving_text
	ctxt "Are you leaving?"
	line "The challenge is"
	cont "over if you leave."
	done

ProvincialParkContest_MapEventHeader:
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 1
	xy_trigger 0, 9, 33, ProvincialParkContest_GateNPCTrigger

	; signposts
	db 13
	signpost 11, 13, SIGNPOST_UP, ProvincialParkContest_Spot1
	signpost  7, 23, SIGNPOST_UP, ProvincialParkContest_Spot2
	signpost 17, 25, SIGNPOST_UP, ProvincialParkContest_Spot3
	signpost 25,  7, SIGNPOST_UP, ProvincialParkContest_Spot4
	signpost 23, 19, SIGNPOST_UP, ProvincialParkContest_Spot5
	signpost 33, 15, SIGNPOST_UP, ProvincialParkContest_Spot6
	signpost 41,  5, SIGNPOST_UP, ProvincialParkContest_Spot7
	signpost 37,  9, SIGNPOST_UP, ProvincialParkContest_Spot8
	signpost 43, 17, SIGNPOST_UP, ProvincialParkContest_Spot9
	signpost 37, 33, SIGNPOST_UP, ProvincialParkContest_Spot10
	signpost 25, 27, SIGNPOST_UP, ProvincialParkContest_Spot11
	signpost 47, 31, SIGNPOST_UP, ProvincialParkContest_Spot12
	signpost 11,  5, SIGNPOST_UP, ProvincialParkContest_Spot13

	; people events
	db 3
	person_event SPRITE_OFFICER, 48, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ProvincialParkContest_FirelightCavernsEntranceNPC, -1
	person_event SPRITE_OFFICER,  8, 33, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ProvincialParkContest_GateNPC, -1
	person_event SPRITE_POKE_BALL, 9, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 2, PP_UP, EVENT_PROVINCIAL_PARK_ITEM_PP_UPS
