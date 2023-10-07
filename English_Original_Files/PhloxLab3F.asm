PhloxLab3F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

PHLOX_LAB_CEO EQU 2
PHLOX_LAB_OFFICER EQU 6
PHLOX_LAB_BLACK_PATROLLER EQU 7

PhloxLabHiddenItem_2:
	opentext
	checkevent EVENT_PHLOX_LAB_HIDDENITEM_UP_GRADE
	sif false, then
		setevent EVENT_PHLOX_LAB_HIDDENITEM_UP_GRADE
		verbosegiveitem UP_GRADE
		waitbutton
		closetextend
	selse
		farjumptext TrashCanText
		waitbutton
		closetextend
	sendif

PhloxLabF3CEO:
	faceplayer
	showtext .introduction_text
	checkcode VAR_FACING
	sif =, LEFT, then
		applymovement PLAYER, .player_moves_down
		spriteface PHLOX_LAB_CEO, DOWN
		spriteface PLAYER, UP
	sendif
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadtrainer SCIENTIST, 13
	startbattle
	reloadmapafterbattle
	playmapmusic
	appear PHLOX_LAB_OFFICER
	appear PHLOX_LAB_BLACK_PATROLLER
	follow PHLOX_LAB_OFFICER, PHLOX_LAB_BLACK_PATROLLER
	applymovement PHLOX_LAB_OFFICER, .officer_walks_up
	stopfollow
	spriteface PHLOX_LAB_BLACK_PATROLLER, RIGHT
	applymovement PLAYER, .player_moves_right
	spriteface PLAYER, LEFT
	applymovement PHLOX_LAB_OFFICER, .officer_and_patroller_walk_right
	applymovement PHLOX_LAB_BLACK_PATROLLER, .officer_and_patroller_walk_right
	spriteface PHLOX_LAB_OFFICER, RIGHT
	opentext
	writetext .officer_appears_text
	spriteface PHLOX_LAB_OFFICER, DOWN
	writetext .officer_talks_to_black_text
	writetext .black_talks_text
	spriteface PHLOX_LAB_OFFICER, RIGHT
	writetext .officer_talks_to_player_text
	special ClearBGPalettes
	disappear PHLOX_LAB_OFFICER
	disappear PHLOX_LAB_BLACK_PATROLLER
	disappear PHLOX_LAB_CEO
	disappear 3
	disappear 4
	disappear 5
	special Special_ReloadSpritesNoPalettes
	playwaitsfx SFX_EXIT_BUILDING
	reloadmap
	setevent EVENT_PHLOX_LAB_CEO
	setevent EVENT_PHLOX_LAB_OFFICER
	end

.officer_and_patroller_walk_right
	step_right
	step_right
.player_moves_right
	step_right
	step_end

.player_moves_down
	step_down
	step_left
	step_end

.officer_walks_up
	step_up
	step_up
	step_up
	step_up
	step_end

.introduction_text
	ctxt "I see you're here."

	para "A child cannot"
	line "fathom all of the"
	para "numerous factors"
	line "that move this"
	cont "world forward."

	para "They don't under-"
	line "stand how little"
	para "one can accomplish"
	line "by clinging to"
	para "such weak-minded,"
	line "petty ideals."

	para "When I was young,"
	line "I believed the"
	para "improvement of"
	line "#mon came from"
	para "understanding the"
	line "individuality,"
	para "and so I set out"
	line "to clone Pokemon"
	para "in order to prove"
	line "my hypothesis."

	para "Unfortunately,"
	line "after the cloning"
	para "incident which"
	line "created Mewtwo,"
	para "cloning of #mon"
	line "was banned, and my"
	para "life's work was"
	line "stolen from me."

	para "I wanted to dis-"
	line "cover the strength"
	para "in the individual-"
	line "ity of #mon."

	para "Yet, it was the"
	line "strength of an"
	para "individual #mon"
	line "that took away"
	para "everything I'd"
	line "built in life."

	para "Since then, I've"
	line "devoted my time"
	para "into building a"
	line "medical research"
	para "company sworn to"
	line "the advancement of"
	para "mapping through"
	line "the full genetic"
	para "augmentation of"
	line "all #mon."

	para "You may not agree"
	line "with what I do,"
	para "but it's men like"
	line "me that keep the"
	para "world moving ever"
	line "forward, always."

	para "#mon are simply"
	line "tools for us!"

	para "Battle me so you"
	line "may know the"
	para "superiority of the"
	line "genetically-"
	cont "altered #mon!"
	sdone

.battle_won_text
	text "No!"
	done

.officer_appears_text
	ctxt "Well, well, we"
	line "meet again, my"
	cont "young friend."

	para "Once again, you've"
	line "managed to do the"
	cont "job of the police."

	para "I swear, you must"
	line "be getting some"
	para "extra information"
	line "from someone on"
	cont "the inside."
	sdone

.officer_talks_to_black_text
	ctxt "Anyways, you've"
	line "done good work"
	cont "here, kid."

	para "Darn good work."

	para "Thanks to you,"
	line "this corporation"
	para "will pay hefty"
	line "fines, and all"
	para "those involved"
	line "will be getting"
	para "some prison time"
	line "as well."
	sdone

.black_talks_text
	ctxt "Black: And the"
	line "#mon will be"
	para "rehabilitated and"
	line "sent back to their"
	cont "original Trainers."
	sdone

.officer_talks_to_player_text
	ctxt "Officer: You know,"
	line "kid, you did break"
	cont "out of Saxifrage."

	para "If you didn't help"
	line "us out, you'd be"
	cont "sent right back."

	para "But since you've"
	line "helped out on our"
	cont "investigations,"
	para "I'm giving you a"
	line "full pardon."

	para "Since this case is"
	line "closed, it's time"
	para "for me to go back"
	line "to do what I enjoy"
	cont "doing at home."

	para "Being the one and"
	line "only Gym Leader of"
	cont "Spurge City."

	para "I'm sure I'll be"
	line "seeing you real"
	cont "soon for a visit."

	para "And the next time"
	line "I see you, you"
	para "should be prepared"
	line "for a tough fight,"
	para "because I don't"
	line "just let anyone up"
	para "to Rijon's League"
	line "to show off my"
	cont "precious badge."
	sdone

PhloxLabF3Trainer1:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_1, SCIENTIST, 10, .before_battle_text, .battle_won_text

	ctxt "Battling isn't my"
	line "thing, really."

	para "But the ones up"
	line "ahead know what"
	cont "they're doing."
	done

.before_battle_text
	ctxt "Since I've been in"
	line "charge of money,"
	para "I've been setting"
	line "aside some money"
	para "for myself off the"
	line "books, so I'm set."
	done

.battle_won_text
	ctxt "You're looking at"
	line "the new Executive"
	cont "of Exeggutor!"
	done

PhloxLabF3Trainer2:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_2, SCIENTIST, 11, .before_battle_text, .battle_won_text

	ctxt "This isn't what I"
	line "want to do with my"
	cont "life, honestly."
	done

.before_battle_text
	ctxt "I don't have time"
	line "for this, kid."

	para "There's still a lot"
	line "of timecards that"
	cont "need filing."
	done

.battle_won_text
	ctxt "I guess I'll put in"
	line "my two weeks<...>"
	done

PhloxLabF3Trainer3:
	trainer EVENT_PHLOX_LAB_F3_TRAINER_3, SCIENTIST, 12, .before_battle_text, .battle_won_text

	ctxt "I should've waited"
	line "until you beat the"
	cont "CEO first, huh."
	done

.before_battle_text
	ctxt "I'm glad you're"
	line "taking over this"
	cont "company for me."

	para "Somebody had to,"
	line "and once you do it"
	para "I'll come from"
	line "behind and steal"
	cont "your victory!"
	done

.battle_won_text
	ctxt "Oh well<...>"
	done

PhloxLabJournal_13:
	jumptext .text

.text
	ctxt "May 25, 1999"
	line "Former benefactor"
	cont "has contacted us."

	para "They claim to be"
	line "experimenting with"
	para "radio waves to"
	line "induce evolution."

	para "Premise is most"
	line "intriguing."

	para "They have agreed"
	line "to send more test"
	para "subjects and their"
	line "data in exchange"
	para "for some of our"
	line "enhanced #mon."

	para "We have also been"
	line "given many years"
	cont "of funding!"

	para "These are very"
	line "exciting times."
	done

PhloxLabJournal_14:
	jumptext .text

.text
	ctxt "Aug 19, 2000"
	line "Mahogany has gone"
	para "quiet. Cause is"
	line "undetermined."

	para "The last subjects"
	line "have been received"
	para "and experiments"
	line "have begun."

	para "Excellent results"
	line "so far using the"
	cont "radio method."
	done

PhloxLabJournal_15:
	jumptext .text

.text
	ctxt "May 13, 2005"
	line "Funding has nearly"
	cont "run dry."

	para "No. 05 suggests we"
	line "start to source"
	para "from the local"
	line "populace."

	para "They reason no one"
	line "cares for this"
	para "town, ergo no one"
	line "will be missed."

	para "Logic is sound."
	line "Proceeding."
	done

PhloxLabJournal_16:
	jumptext .text

.text
	ctxt "Jul 20, 2009"
	line "At last, we have"
	para "been contacted by"
	line "a new group."

	para "They have proposed"
	line "a partnership."

	para "They are able to"
	line "fund us, as well"
	para "as gather test"
	line "subjects."

	para "This in exchange"
	line "for our enhanced"
	cont "#mon."

	para "We have agreed."
	line "Production begins"
	cont "immediately."
	done

PhloxLabJournal_17:
	jumptext .text

.text
	ctxt "Jan 1, 2010"
	line "Completed delivery"
	para "of 6 enhanced"
	line "Eevee from both"
	para "methods of"
	line "production."

	para "All are performing"
	line "exceptionally!"

	para "We will no longer"
	line "be short of raw"
	cont "material."

	para "We have finally"
	line "perfected our"
	cont "design."

	para "We are going to be"
	line "rich!"
	done

PhloxLabJournal_18:
	jumptext .text

.text
	ctxt "The date on this"
	line "journal is recent;"
	para "it looks like it"
	line "has not been"
	cont "finished yet<...>"

	para "<...>"

	para "Someone has broken"
	line "into our lab and"
	para "released our best"
	line "test subjects!"

	para "Our facilities"
	line "have been damaged"
	cont "significantly."

	para "I fear that what"
	line "happened to the"
	para "other labs over"
	line "the years is"
	para "finally happening"
	line "to us."

	para "I shall not allow"
	line "our efforts to be"
	cont "in vain!"

	para "I have just sent"
	line "copies of our"
	para "plans, designs and"
	line "research to anyone"
	cont "I can reach."

	para "They will finish"
	line "what we started,"
	para "for the benefit of"
	line "humanity!"

	para "Even if I am"
	line "arrested, surely"
	para "no evidence will"
	line "stick."

	para "It's not like the"
	line "subjects can talk"
	para "(at least, not"
	line "anymore), and even"
	para "if they could, who"
	line "would even beli-"

	para "<...>"

	para "The file ends"
	line "here."
	done

PhloxLab3F_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 16, 16, 2, PHLOX_LAB_2F

.CoordEvents: db 0

.BGEvents: db 7
	signpost  1, 13, SIGNPOST_READ, PhloxLabHiddenItem_2
	signpost 16, 13, SIGNPOST_UP, PhloxLabJournal_13
	signpost 16,  9, SIGNPOST_UP, PhloxLabJournal_14
	signpost  8,  3, SIGNPOST_UP, PhloxLabJournal_15
	signpost  4,  3, SIGNPOST_UP, PhloxLabJournal_16
	signpost  8, 13, SIGNPOST_UP, PhloxLabJournal_17
	signpost  4, 13, SIGNPOST_UP, PhloxLabJournal_18

.ObjectEvents: db 6
	person_event SPRITE_SCIENTIST, 5, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PhloxLabF3CEO, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 17, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, PhloxLabF3Trainer1, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 16, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer2, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_SCIENTIST, 12, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, PhloxLabF3Trainer3, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_BRUCE, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER
	person_event SPRITE_PALETTE_PATROLLER, 11, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_PHLOX_LAB_OFFICER
