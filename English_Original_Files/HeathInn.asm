HeathInn_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 1

	dbw 5, .set_blackout

.set_blackout:
	blackoutmod HEATH_VILLAGE
	return

HeathInnNPC:
	ctxt "This village is"
	line "purely family-run."

	para "It only consists"
	line "of family members"
	para "and has stayed"
	line "that way for"
	cont "centuries now."

	para "My cousin Rinji"
	line "often takes our"
	para "children into his"
	line "forest to become"
	cont "#mon Trainers."

	para "My grandmother"
	line "manages the rooms"
	cont "in this very inn,"
	para "and my brother"
	line "runs the shop."
	done

HeathInnAttendant:
	opentext
	special PlaceMoneyTopRight
	writetext .opening_text
	yesorno
	sif false
		jumptext .declined_text
	checkmoney 0, 100
	sif =, 2
		jumptext .not_enough_money_text
	writetext .accepted_text
	special ClearBGPalettes
	writebyte 4
.loop
	playwaitsfx SFX_SNORE
	pause 20
	addvar -1
	iftrue .loop
	special HealParty
	reloadmap
	takemoney 0, 100
	jumptext .after_healing_text

.opening_text
	ctxt "Oh dear, you and"
	line "your #mon look"
	cont "tired."

	para "I'll let you rent"
	line "a room for ¥100."
	done

.declined_text
	ctxt "Oh, OK then, you're"
	line "always welcome"
	para "to stay if you'd"
	line "like."
	done

.accepted_text
	ctxt "Thank you, have"
	line "a good rest!"
	prompt

.after_healing_text
	ctxt "Welcome back, I"
	line "hope you enjoyed"
	cont "your stay."
	done

.not_enough_money_text
	ctxt "I'm afraid your"
	line "wallet is nearly"
	cont "empty."
	done

HeathInn_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $9, $9, 5, HEATH_VILLAGE
	warp_def $9, $a, 5, HEATH_VILLAGE

.CoordEvents
	db 0

.BGEvents
	db 2
	signpost 1, 14, SIGNPOST_JUMPSTD, magazinebookshelf
	signpost 1, 3, SIGNPOST_JUMPSTD, magazinebookshelf

.ObjectEvents
	db 3
	person_event SPRITE_BLACK_BELT, 6, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, HeathInnNPC, -1
	person_event SPRITE_GRANNY, 4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HeathInnAttendant, -1
	person_event SPRITE_YOUNGSTER, 4, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PLAYER, PERSONTYPE_MART, 0, MART_STANDARD, HEATH_STANDARD_MART, -1
