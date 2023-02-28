Route69IlkBrotherHouse_MapScriptHeader;trigger count
	db 2

	maptrigger .first_rival_event_trigger
	maptrigger GenericDummyScript
 ;callback count
	db 0

.first_rival_event_trigger
	priorityjump IlkBrothersInTrouble
	end

Route69IlkBrotherHouseStove:
	ctxt "Hmm, dieser Herd"
	line "ist dreckig!"
	done

Route69IlkBrotherHouseSink:
	ctxt "Bäh!"

	para "Was für eine!"
	line "dreckige Spüle!"
	done

Route69IlkBrotherHouseN64:
	ctxt "Es ist eine N64!"
	done

IlkBrothersInTrouble:
	musicfadeout MUSIC_RIVAL_ENCOUNTER, 8
	applymovement PLAYER, .walk_to_ilk_bro
	showemote EMOTE_SHOCK, 2, 15
	showtext .text
	dotrigger 1
	setevent EVENT_ROUTE_69_ILK_BRO_TRAPPED
	end

.walk_to_ilk_bro
	step_up
	step_up
	step_up
	turn_head_left
	step_end

.text
	ctxt "Endlich!"

	para "Die Polizei ist"
	line "da!"

	para "Warte<...>"

	para "Du bist nurn Kind<...>"

	para "<...>"

	para "Die Polizei sendet"
	line "dich? Was denken"
	cont "die sich bloß?"

	para "<...>"

	para "Oh? Prof. Ilk"
	line "sandte dich?"

	para "Naja dann<...>"

	para "Siehst du den"
	line "Jungen da?"

	para "Er ist einge-"
	line "brochen und will"
	cont "mein Kindwurm!"

	para "Unternimm etwas!"
	sdone

IlkBrothersTalkToRival:
	showtext .talk_to_bagon_text
	showemote EMOTE_SHOCK, 3, 15
	faceplayer
	opentext
	writetext .before_battle_text
	winlosstext .battle_won_text, .battle_lost_text
	setlasttalked 255
	loadtrainer RIVAL1, RIVAL1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	setlasttalked 3
	dontrestartmapmusic
	startbattle
	disappear 4
	setevent EVENT_RIVAL_ROUTE_69
	reloadmap
	special HealParty
	playmusic MUSIC_RIVAL_AFTER
	showtext .after_battle_text
	playmusic MUSIC_NONE
	playsound SFX_WARP_FROM
	applymovement 3, .rival_teleports
	disappear 3
	waitsfx
	playmapmusic
	spriteface 2, UP
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement PLAYER, .walk_to_ilk_bro_facing_right
	selse
		applymovement PLAYER, .walk_to_ilk_bro
	sendif
	spriteface 2, RIGHT
	opentext
	writetext .ilk_bro_after_battle_text
	special SpecialNameRival
	clearevent EVENT_ROUTE_69_ILK_BRO_TRAPPED
	jumptext .after_naming_rival_text

.rival_teleports
	teleport_from
	remove_person
	step_end

.walk_to_ilk_bro
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_left
	step_end

.walk_to_ilk_bro_facing_right
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_left
	step_end

.talk_to_bagon_text
	ctxt "Haha!"

	para "Du gehörst mir<...>"

	para "<...>oder willst du"
	line "verletzt werden?"
	sdone

.before_battle_text
	ctxt "Was willst du Furz"
	line "denn von mir?"

	para "Komm mir nicht"
	line "in die Quere!"
	sdone

.battle_won_text
	ctxt "Dieses Werkzeug"
	line "muss noch"
	cont "trainiert werden<...>"

	para "Ich mache es"
	line "stärker, egal was"
	cont "es mich kostet!"
	done

.battle_lost_text
	ctxt "Hah!"

	para "Du bist so"
	line "erbärmlich!"
	done

.after_battle_text
	ctxt "Das war nur Glück."

	para "Zeit zu gehen."

	para "Ich habe von dem"
	line "alten Sack bereits"
	cont "was ich brauch."

	para "Ciao!"

	para "<RIVAL> ben."
	line "Fluchtseil."
	sdone

.ilk_bro_after_battle_text
	ctxt "Ich habe alles"
	line "gesehen! Wow!"

	para "Das war ein toller"
	line "Kampf!"

	para "Sagte er dir"
	line "seinen Namen?"
	sdone

.after_naming_rival_text
	ctxt "<RIVAL>, also?"

	para "Dein Larvitar<...>"

	para "Ist es das von"
	line "meinem Bruder?"
	
	para "Oh, du hast ihn"
	line "bereits getroffen?"

	para "Ach, du solltest"
	line "nach mir sehen?"

	para "So ist mein Bruder"
	line "nunmal<...>"
	
	para "Bring ihm bitte"
	line "auch sein Larvitar"
	para "zurück, die beiden"
	line "haben gemeinsam"
	para "viel durch"
	line "gemacht<...>"
	
	para "Er liebt dieses"
	line "#mon sehr<...>"
	done

Route69IlkBrotherHouseIlkBrother:
	checkevent EVENT_RIVAL_ROUTE_69
	sif true
		jumptextfaceplayer .after_battling_rival
	jumptextfaceplayer .before_battling_rival

.before_battling_rival
	ctxt "Bitte, beeil dich!"
	done

.after_battling_rival
	ctxt "Vielen Dank das"
	line "du versucht hast"
	cont "ihn zu stoppen."

	para "Ich hoffe Kindwurm"
	line "geht es gut<...>"
	done

Route69IlkBrotherHouse_MapEventHeader ;filler
	db 0, 0

;warps
	db 2
	warp_def $9, $4, 3, ROUTE_69
	warp_def $9, $5, 3, ROUTE_69

	;xy triggers
	db 0

	;signposts
	db 5
	signpost 1, 0, SIGNPOST_TEXT, Route69IlkBrotherHouseStove
	signpost 0, 0, SIGNPOST_TEXT, Route69IlkBrotherHouseStove
	signpost 0, 1, SIGNPOST_TEXT, Route69IlkBrotherHouseSink
	signpost 1, 1, SIGNPOST_TEXT, Route69IlkBrotherHouseSink
	signpost 2, 9, SIGNPOST_TEXT, Route69IlkBrotherHouseN64

	;people-events
	db 3
	person_event SPRITE_SCIENTIST, 6, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route69IlkBrotherHouseIlkBrother, -1
	person_event SPRITE_SILVER, 2, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlkBrothersTalkToRival, EVENT_RIVAL_ROUTE_69
	person_event SPRITE_BAGON, 1, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_ROUTE_69
