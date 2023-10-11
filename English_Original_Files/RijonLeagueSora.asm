RijonLeagueSora_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueSora_Sora:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer SORA, 2
	selse
		loadtrainer SORA, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	playsound SFX_WHIRLWIND
	applymovement 2, .vanish
	disappear 2
	end

.vanish
	teleport_from
	remove_person
	step_end

.before_battle_text
	ctxt "How ya doin',"
	line "Trainer?"

	para "Or should I say<...>"
	line "CHALLENGER!"

	para "There we go, that"
	line "has a better sound"
	cont "to it."

	para "I'm Sora, the"
	line "flying #mon"
	para "Trainer of the"
	line "Rijon League!"

	para "You've made it"
	line "past the first"
	para "gate, but it's only"
	line "going to get more"
	para "difficult from"
	line "here on out,"
	cont "buck-o!"

	para "Try not to get"
	line "blown away by my"
	cont "sheer power!"
	sdone

.battle_won_text
	ctxt "I'm breathless!"
	done

.after_battle_text
	ctxt "Seriously, not"
	line "many Trainers can"
	para "overpower me, but"
	line "I'm glad, you got a"
	cont "good vibe."

	para "If you've defeated"
	line "me, then you and"
	para "your #mon have"
	line "the inner strength"
	para "and power to"
	line "overcome the"
	para "challenges of the"
	line "League."

	para "Congratulations,"
	line "challenger!"

	para "Move on to your"
	line "next opponent."
	sdone

RijonLeagueSora_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 3
	dummy_warp $10, $3
	warp_def $5, $10, 1, RIJON_LEAGUE_DAICHI
	warp_def $5, $11, 1, RIJON_LEAGUE_DAICHI

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_SORA, 5, 9, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RijonLeagueSora_Sora, -1
