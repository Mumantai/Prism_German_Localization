RijonLeagueMura_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueMuraStatue:
	jumptext .text

.text
	ctxt "It's a statue of"
	line "Mura's Tyranitar!"
	done

RijonLeagueMura_Mura:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer MURA, 2
	selse
		loadtrainer MURA, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	playsound SFX_JUMP_KICK
	applymovement 2, .vanish
	disappear 2
	end

.vanish
	teleport_from
	remove_person
	step_end

.before_battle_text
	ctxt "Whoa there, a"
	line "Challenger?"

	para "I didn't see that"
	line "coming."

	para "Usually people"
	line "either get beaten"
	para "by Sora or put to"
	line "sleep by Daichi's"
	cont "meditation lesson."

	para "But that's what"
	line "being a Trainer is"
	cont "all about!"

	para "Expecting the"
	line "unexpected and"
	para "adapting to any"
	line "given situation."

	para "A Trainer must be"
	line "able to know when"
	para "to push for a vic-"
	line "tory or pull back"
	para "to spare your"
	line "#mon from"
	cont "injury."

	para "When I was a"
	line "challenger for the"
	para "Rijon Champion"
	line "title, I couldn't"
	para "adapt to my oppo-"
	line "nents' varied and"
	cont "unique #mon."

	para "My inability to"
	line "change up my"
	para "strategy is"
	line "ultimately what"
	cont "cost me the title."

	para "Let's see if you"
	line "have what it"
	cont "takes!"

	para "I won't make this"
	line "easy!"
	sdone

.battle_won_text
	ctxt "I'm simply amazed."

	para "You battle just"
	line "like that Trainer!"

	para "Well, I guess that"
	line "means you have"
	para "what it takes to"
	line "be the Champion"
	cont "of Rijon."
	done

.after_battle_text
	ctxt "Before you enter"
	line "that room, take a"
	para "moment to reflect"
	line "on your journey"
	cont "and your growth."

	para "You are no longer"
	line "the person you"
	para "were when you"
	line "started your"
	cont "adventure."

	para "The trials of the"
	line "Elite Four proved"
	para "that you have all"
	line "the qualities of"
	cont "a Champion."

	para "You are disci-"
	line "plined, you are"
	para "powerful, you are"
	line "balanced, and you"
	para "can adapt to any"
	line "situation."
	sdone

RijonLeagueMura_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	warp_def $3, $a, 1, RIJON_LEAGUE_LANCE
	warp_def $3, $b, 1, RIJON_LEAGUE_LANCE
	dummy_warp $9, $5

	;xy triggers
	db 0

	;signposts
	db 1
	signpost 5, 7, SIGNPOST_READ, RijonLeagueMuraStatue

	;people-events
	db 1
	person_event SPRITE_MURA, 5, 6, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RijonLeagueMura_Mura, -1
