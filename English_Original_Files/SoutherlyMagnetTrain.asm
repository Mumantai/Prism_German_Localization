SoutherlyMagnetTrain_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

SoutherlyMagnetTrainEmployee:
	opentext
	writetext .greeting
	checkevent EVENT_REGISTERED_SOUTHERLY
	sif false, then
		writetext .branch_line_open
		setevent EVENT_REGISTERED_SOUTHERLY
	sendif
	writetext .want_to_travel
	yesorno
	closetext
	sif false
		end
	special FadeOutPalettes
	playwaitsfx SFX_WING_ATTACK
	playwaitsfx SFX_TRAIN_ARRIVED
	warp TORENIA_MAGNET_TRAIN, 1, 14
	end

.greeting
	ctxt "Greetings!"
	sdone

.branch_line_open
	ctxt "We've just opened"
	line "our new expansion."

	para "You can now travel"
	line "back to Naljo in a"
	cont "flash!"

	para "Please note, you"
	line "will need to"
	para "change at Torenia"
	line "to reach other"
	cont "destinations."
	sdone

.want_to_travel
	ctxt "Would you like to"
	line "travel on our new"
	para "expansion line to"
	line "Naljo?"
	sdone

SoutherlyMagnetTrainNPC:
	ctxt "Our government"
	line "negotiated a"
	para "connection to the"
	line "Magnet Train"
	cont "network for Tunod."

	para "It took several"
	line "years to tunnel"
	cont "under the ocean."

	para "The airport wasn't"
	line "too happy sharing"
	para "the building with"
	line "a competitor."

	para "Me?"

	para "I think it shows"
	line "how committed we"
	para "are to protecting"
	line "our environment."

	para "Unlike Naljo, we"
	line "actually respect"
	para "nature, instead of"
	line "tearing it down."
	done

SoutherlyMagnetTrain_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	warp_def $11, $8, 3, SOUTHERLY_AIRPORT
	warp_def $11, $9, 4, SOUTHERLY_AIRPORT

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 2
	person_event SPRITE_OFFICER, 9, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SoutherlyMagnetTrainEmployee, -1
	person_event SPRITE_PICNICKER, 14, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TEXTFP, 0, SoutherlyMagnetTrainNPC, -1
