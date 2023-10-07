RijonLeagueYuki_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueYuki_Yuki:
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, 0
	setlasttalked 255
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	checkcode VAR_BADGES
	sif >, 19, then
		loadtrainer YUKI, 2
	selse
		loadtrainer YUKI, 1
	sendif
	startbattle
	reloadmapafterbattle
	playmapmusic
	showtext .after_battle_text
	applymovement 2, .step_away
	disappear 2
	end

.step_away
	teleport_from
	remove_person
	step_end

.before_battle_text
	ctxt "Welcome, Trainer!"

	para "What you've"
	line "experienced on"
	para "your journey is"
	line "unique."

	para "Anyone could"
	line "conquer the Gyms"
	para "and traverse"
	line "Seneca Caverns,"
	para "but no one would"
	line "have done it as"
	cont "you have."

	para "You're as unique"
	line "as a crystalized"
	para "snowflake flutter-"
	line "ing and tumbling"
	para "through the cold"
	line "mountain air on a"
	cont "winter's morning."

	para "I am Yuki, the"
	line "Master Ice Trainer"
	para "of Naljo and your"
	line "first opponent in"
	cont "the Rijon League."

	para "Put your best foot"
	line "forward!"
	sdone

.battle_won_text
	ctxt "What a way to"
	line "break the ice!"
	done

.after_battle_text
	ctxt "By outlasting and"
	line "overcoming my icy"
	para "onslaught, you've"
	line "proven that you"
	para "and your #mon"
	line "can withstand"
	cont "anything!"

	para "Go onto the next"
	line "room, your next"
	cont "challenge awaits."
	sdone

RijonLeagueYuki_MapEventHeader:
	;filler
	db 0, 0

	;warps
	db 2
	dummy_warp $11, $2
	warp_def $5, $d, 1, RIJON_LEAGUE_SORA

	;xy triggers
	db 0

	;signposts
	db 0

	;people-events
	db 1
	person_event SPRITE_YUKI, 8, 12, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RijonLeagueYuki_Yuki, -1
