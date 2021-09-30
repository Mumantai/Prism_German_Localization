RijonLeagueMura_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

RijonLeagueMuraStatue:
	jumptext .text

.text
	ctxt "Eine Statue von"
	line "Muras Despotar!"
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
	ctxt "Wer ist da? Ein"
	line "Herausforderer?"

	para "Oh, das sah ich"
	line "nicht kommen." 

	para "Normalerweise"
	line "werden Sie von"
	para "Sora besiegt oder"
	line "durch Daichis"
	para "Gelaber in den"
	line "Schlaf versetzt."
	
	para "Aber darum gehts"
	line "beim Trainer-"
	cont "dasein!"

	para "Mit dem un-"
	line "berechebaren zu"
	cont "rechnen!"

	para "Ein Trainer muss"
	line "wissen, wann er"
	para "angreifen und wann"
	line "er sich besser"
	para "zurückziehen "
	line "sollte."

	para "Als ich in der"
	line "Rijon Liga um den"
	para "Titel des Champion"
	line "gekämpft habe,"
	para "konnte ich der"
	line "einzigartigen"
	para "zusammensetzung"
	line "des #mon Teams"
	para "meines Gegners"
	line "nichts entgegen"
	cont "stellen<...>"
	
	para "Das ich immer bei"
	line "der selben"
	para "Strategie blieb,"
	line "war der Grund, das"
	para "mich den Titel"
	line "gekostet hat."

	para "Mal schauen ob du"
	line "das Gewisse etwas"
	cont "hast!"
	sdone

.battle_won_text
	ctxt "Ich bin"
	line "beeindruckt."

	para "Du kämpfst genau"
	line "wie dieser eine"
	cont "Trainer!"

	para "Das heist wohl,"
	line "dass du das Zeug"
	para "zum #mon"
	line "Meister hast."
	done

.after_battle_text
	ctxt "Bevor du zum"
	line "nächsten Raum"
	para "gehst, nimm dir"
	line "die Zeit um über"
	para "dich und deine"
	line "Reise bis hier"
	cont "her nachzudenken."

	para "Du bist nicht mehr"
	line "die Person, die du"
	para "warst, als du "
	line "dieses Abenteuer"
	cont "gestartet hast." 

	para "Die Prüfungen der"
	line "Top-4 bewiesen,"
	para "dass du alle"
	line "Qualitäten eines"
	para "Champs in dir"
	line "hast!"

	para "Du hast Disziplin,"
	line "Stärke, Balance"
	para "und du kannst dich"
	line "der Situation"
	cont "anpassen!"
	sdone

RijonLeagueMura_MapEventHeader ;filler
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
