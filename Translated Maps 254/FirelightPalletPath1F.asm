FirelightPalletPath1F_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

const_value = 4
	const FIRELIGHT_PALLET_PATH_VARANEOUS
	const FIRELIGHT_PALLET_PATH_NOBU
	const FIRELIGHT_PALLET_PATH_OFFICER
const_value = 8
	const FIRELIGHT_PALLET_PATH_PALETTE_PINK
	const FIRELIGHT_PALLET_PATH_PALETTE_RED
	const FIRELIGHT_PALLET_PATH_PALETTE_BLUE

FirelightPalletPath1FCutscene:
	checkevent EVENT_VARANEOUS_REVIVED
	sif true
		end
	opentext
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, RIGHT
	writetext .palette_text_1
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	writetext .palette_text_2
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, LEFT
	writetext .palette_text_3
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, RIGHT
	writetext .palette_text_4
	writetext .palette_text_5
	writetext .palette_text_6
	writetext .palette_text_7
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	writetext .palette_text_8
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, DOWN
	writetext .palette_text_9
	closetext
	applymovement PLAYER, .player_approaches_palette_members
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, DOWN
	opentext
	writetext .before_awaking_varaneous_text
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, UP
	playsound SFX_AEROBLAST
	earthquake 16
	appear FIRELIGHT_PALLET_PATH_VARANEOUS
	cry VARANEOUS
	closetext
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_jumps_towards_palette_members
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, UP
	showtext .after_awaking_varaneous_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_attacks_red
	playsound SFX_KARATE_CHOP
	spriteface FIRELIGHT_PALLET_PATH_VARANEOUS, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, LEFT
	pause 16
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, UP
	showtext .varaneous_attacks_red_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_attacks_pink
	playsound SFX_KARATE_CHOP
	spriteface FIRELIGHT_PALLET_PATH_VARANEOUS, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, LEFT
	pause 16
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, UP
	opentext
	writetext .varaneous_attacks_pink_text
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_approaches_player
	spriteface PLAYER, RIGHT
	refreshscreen 0
	pokepic VARANEOUS
	cry VARANEOUS
	closepokepic
	opentext
	writetext .varaneous_sniffs_player_text
	cry VARANEOUS
	closetext
	applymovement FIRELIGHT_PALLET_PATH_VARANEOUS, .varaneous_leaves
	spriteface PLAYER, LEFT
	opentext
	writetext .nobu_notices_palettes_text
	spriteface PLAYER, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_PINK, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_RED, DOWN
	spriteface FIRELIGHT_PALLET_PATH_PALETTE_BLUE, DOWN
	closetext
	appear FIRELIGHT_PALLET_PATH_NOBU
	appear FIRELIGHT_PALLET_PATH_OFFICER
	follow FIRELIGHT_PALLET_PATH_OFFICER, FIRELIGHT_PALLET_PATH_NOBU
	applymovement FIRELIGHT_PALLET_PATH_OFFICER, .officer_and_nobu_approach_player
	spriteface FIRELIGHT_PALLET_PATH_OFFICER, UP
	stopfollow
	showtext .officer_arrests_palettes_text
	applymovement FIRELIGHT_PALLET_PATH_NOBU, .nobu_approaches_player
	opentext
	writetext .nobu_talks_to_player_text
	special Special_BattleTowerFade
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ROUTE_80_NOBU, 5, 4
	special InitRoamMons
	setevent EVENT_VARANEOUS_REVIVED
	setevent EVENT_FIRELIGHT_POLICE
	writebyte VARANEOUS
	special SpecialSeenMon
	spriteface PLAYER, LEFT
	end

.palette_text_1
	ctxt "Blau: Ich bin ver-"
	line "wirrt, Rot. Warum"
	cont "sind wir hier?"
	para "Und warum tragen"
	line "wir immer noch"
	cont "diese Gummianzüge?"
	sdone

.palette_text_2
	ctxt "Rot: DAS SIND"
	line "KEINE GUMMIANZÜGE!"
	para "Es sind klassische"
	line "Naljo-Gewänder."
	para "Wie ich bereits"
	line "sagte, Andy, sind"
	para "wir endlich fertig"
	line "damit, Naljo nach"
	para "den Kugeln der"
	line "Wächter-#mon"
	cont "zu durchkämmen."
	para "Sobald Varaneous"
	line "erwacht, wird Nal-"
	para "jo wieder zu dem"
	line "Paradies, das un-"
	para "sere Vorfahren"
	line "einst kannten!"
	sdone

.palette_text_3
	ctxt "Pink: Warum sind"
	line "eigentlich nur"
	cont "wir drei hier?"
	para "Einer von den"
	line "anderen wurde"
	para "verhaftet, aber"
	line "was ist mit den"
	cont "anderen beiden?"
	sdone

.palette_text_4
	ctxt "Rot: Die sind auch"
	line "bloß Verräter."
	para "Sie sahen uns als"
	line "Kriminelle, die"
	para "nur an Geld und"
	line "seltenen #mon"
	cont "interessiert sind."
	para "Wir sind nicht"
	line "Team Rocket! Wir"
	para "wollen bloß, dass"
	line "unsere Kultur"
	para "nicht durch Außen-"
	line "stehende in Ver-"
	cont "gessenheit gerät."
	sdone

.palette_text_5
	ctxt "Pink: Aber <...> sie"
	line "wollten doch nur"
	para "Geld beschaffen,"
	line "damit wir es noch"
	cont "weiterbringen."
	para "Nach all dem, ist"
	line "es am Ende nu<...>"
	sdone

.palette_text_6
	ctxt "Rot: Sei still!"
	para "Geld interessiert"
	line "mich nicht!"
	para "Das Geld hat"
	line "Naljo verdorben!"
	sdone

.palette_text_7
	ctxt "Blau: Ich weiß ja"
	line "nicht, ob das eine"
	cont "so gute Idee ist <...>"
	para "Ich glaub, bei der"
	line "Sache halte ich"
	cont "mich lieber raus <...>"
	sdone

.palette_text_8
	ctxt "Rot: Wenn du mich"
	line "auch verrätst,"
	cont "wirst du büßen!"
	para "In meiner Welt"
	line "gibt es keine"
	cont "'Notausgänge' <...>"
	para "<...> verstanden?"
	para "Weißt du noch, was"
	line "ich diesem Rüpel"
	para "von Team Rocket"
	line "angetan habe, der"
	para "meine #mon"
	line "stehlen wollte?"
	sdone

.palette_text_9
	ctxt "Pink: <...> Bitte,"
	line "ich möchte nicht"
	cont "daran denken."
	para "<...>"
	para "Moment mal. Das"
	line "Balg ist uns bis"
	cont "hierher gefolgt!"
	sdone

.player_approaches_palette_members
	step_up
	step_up
	step_right
	turn_head_up
	step_end

.before_awaking_varaneous_text
	ctxt "Rot: Warum stellst"
	line "du dich uns immer"
	cont "wieder in den Weg?"
	para "Dieses #mon"
	line "ist der Schlüssel,"
	para "der Naljos Zukunft"
	line "sichern wird!"
	para "Seine Macht kann"
	line "die Meere brodeln"
	cont "lassen!"
	para "Endlich ist die"
	line "Macht, Naljo zu"
	para "beschützen, in"
	line "greifbarer Nähe!"
	para "So lange es noch"
	line "am Aufwachen ist,"
	para "ist die Chance"
	line "mein, es mir zu"
	cont "unterwerfen!"
	para "Die Verkörperung"
	line "von Feuer, Krieg"
	para "und Zerstörung <...>"
	line "Gehört mir allein!"
	sdone

.varaneous_jumps_towards_palette_members
	step_down
	jump_step_down
	step_end

.after_awaking_varaneous_text
	ctxt "Rot: Varaneous."
	line "Du bist erwacht!"
	para "Dein Schlaf hielt"
	line "Jahrhunderte an."
	para "Naljo braucht dich"
	line "und die drei"
	cont "anderen Wächter."
	para "Naljos Kultur"
	line "schwindet und"
	para "seine Nachkommen"
	line "gaben deine Vision"
	para "auf und empfangen"
	line "Fremde nun mit"
	cont "offenen Armen."
	sdone

.varaneous_attacks_pink
	fast_slide_step_right
.varaneous_attacks_red
	fast_slide_step_down
	fast_slide_step_up
	step_end

.varaneous_attacks_red_text
	ctxt "Rot: Was?!"
	para "Wieso solltest du"
	line "mich angreifen <...>?"
	para "Ich bin doch <...>!"
	prompt

.varaneous_attacks_pink_text
	ctxt "Pink: Mein Bein <...>"
	para "Es ist gebrochen!"
	sdone

.varaneous_approaches_player
	fast_slide_step_right
	jump_step_down
	fast_slide_step_left
	step_end

.varaneous_sniffs_player_text
	ctxt "Varaneous:"
	line "-Schnüffelt-"
	sdone

.varaneous_leaves
	fast_slide_step_down
	fast_jump_step_left
	fast_jump_step_left
	fast_jump_step_left
	fast_jump_step_left
	step_end

.nobu_notices_palettes_text
	ctxt "Rot: Das #mon"
	line "hat die anderen"
	cont "Kugeln gestohlen!"
	para "Nobu: Officer,"
	line "da sind sie!"
	sdone

.officer_and_nobu_approach_player
	step_right
	step_up
	step_right
	step_up
	step_up
	step_up
	step_up
	step_end

.officer_arrests_palettes_text
	ctxt "Officer: Sieht so"
	line "aus, als hätten"
	para "wir euch endlich"
	line "geschnappt."
	para "Wir werden euch"
	line "schön wegsperren."
	para "Moment, wo sind"
	line "der Grüne und"
	cont "die Gelbe hin?"
	para "Egal, wir machen"
	line "Fortschritte <...>"
	para "Hey, du! Gehörst"
	line "du auch zu denen?"
	prompt

.nobu_approaches_player
	step_right
	turn_head_up
	step_end

.nobu_talks_to_player_text
	ctxt "Nobu: Nein, Sir."
	para "Der Wahnsinnige in"
	line "rot plant schon"
	para "seit Jahren, die"
	line "Wächter zu wecken."
	para "Officer: Etwa die"
	line "aus diesen alten"
	cont "Geschichten?"
	para "Nobu: Genau die."
	line "Aber Moment!"
	para "<...> Wieso wurden sie"
	line "angegriffen und"
	cont "nicht du <...>?"
	para "Warte mal <...>"
	para "Dich hab ich doch"
	line "schon im Fernsehen"
	cont "gesehen <...>"
	para "Moment!"
	para "Siegfried ist echt"
	line "dein Vater?"
	para "Der legendäre"
	line "Drachen-Trainer?"
	para "Jetzt ergibt alles"
	line "einen Sinn!"
	para "<...>"
	para "Bist du verwirrt?"
	para "Gehen wir nach"
	line "Hause und ich"
	cont "erkläre dir alles."
	prompt

FirelightPalletPath1F_PalettePink:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_PINK, PATROLLER, 8, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 2, .movement
	disappear 2
	end

.movement
	step_left
	step_left
	step_left
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

.before_battle_text
	ctxt "Warte, was machst"
	line "du denn hier?"
	para "Du wirst uns nicht"
	line "aufhalten!"
	done

.battle_won_text
	ctxt "Du bist echt hart."
	done

.after_battle_text
	ctxt "Wir tun nur, was"
	line "wir tun müssen."
	para "Das würdest du"
	line "nicht verstehen."
	para "Wir werden alles"
	line "Nötige tun, um"
	para "unsere Träume"
	cont "zu verwirklichen!"
	para "Der Zweck heiligt"
	line "immer die Mittel!"
	sdone

FirelightPalletPath1F_PaletteBlue:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_BLUE, PATROLLER, 11, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 3, .movement
	disappear 3
	end

.movement
	rept 5
		step_right
	endr
	step_down
	step_down
	step_down
	step_left
	rept 5
		step_down
	endr
	step_end

.before_battle_text
	ctxt "Das wird der Kampf"
	line "meines Lebens!"
	para "Ich werde alles"
	line "geben und siegen!"
	done

.battle_won_text
	ctxt "Keine Gnade, was?"
	done

.after_battle_text
	ctxt "Ich bin mir nicht"
	line "sicher, was der"
	para "Boss so vor hat,"
	line "aber er hat alle"
	cont "hierher gerufen."
	para "Alles, was er"
	line "tat, führte zu"
	para "diesem einem"
	line "Moment hin."
	cont "Ich bin gespannt."
	sdone

FirelightPalletPath1F_PaletteRed:
	trainer EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_RED, PATROLLER, 16, .before_battle_text, .battle_won_text, NULL, .script

.script
	opentext
	writetext .after_battle_text
	closetext
	applymovement 7, .movement
	disappear 7
	end

.movement
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	rept 4
		step_up
	endr
	step_end

.before_battle_text
	ctxt "Weißt du was?"
	para "Du bist zu spät!"
	para "Wir haben bereits"
	line "alles, was wir"
	cont "brauchen <...>!"
	done

.battle_won_text
	ctxt "Macht nichts <...>"
	done

.after_battle_text
	ctxt "<...>"
	para "Du bist genau wie"
	line "dein Vater."
	para "Er, der seine"
	line "Wurzeln vergaß, um"
	para "nach Beliebtheit"
	line "zu streben, als"
	para "selbsternannter"
	line "#mon-Meister."
	para "Nun, all dies wird"
	line "sich nun ändern."
	para "Deine Familie hat"
	line "Naljo zum letzten"
	cont "Mal betrogen!"
	para "Die stolze Kultur"
	line "von Naljo wird"
	cont "wiederauferstehen!"
	sdone

FirelightPalletPath1F_MapEventHeader:: db 0, 0

.Warps
	db 5
	warp_def $d, $1a, 5, FIRELIGHT_PALLETPATH_1F
	warp_def $1d, $b, 4, FIRELIGHT_PALLETPATH_1F
	warp_def $33, $37, 2, FIRELIGHT_PALLETPATH_B1F
	warp_def $5, $7, 2, FIRELIGHT_PALLETPATH_1F
	warp_def $30, $21, 1, FIRELIGHT_PALLETPATH_1F

.CoordEvents
	db 1
	xy_trigger 0, 17, 47, FirelightPalletPath1FCutscene

.BGEvents
	db 0

.ObjectEvents
	db 9
	person_event SPRITE_PALETTE_PATROLLER, 52, 51, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TRAINER, 3, FirelightPalletPath1F_PalettePink, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_PINK
	person_event SPRITE_PALETTE_PATROLLER, 5, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, FirelightPalletPath1F_PaletteBlue, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_BLUE
	person_event SPRITE_VARANEOUS, 10, 48, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 1, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_SAGE, 20, 44, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIRELIGHT_POLICE
	person_event SPRITE_BRUCE, 20, 45, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIRELIGHT_POLICE
	person_event SPRITE_PALETTE_PATROLLER, 29, 48, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 1, FirelightPalletPath1F_PaletteRed, EVENT_FIRELIGHT_PALLETPATH_1F_PALETTE_RED
	person_event SPRITE_PALETTE_PATROLLER, 14, 49, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_PALETTE_PATROLLER, 14, 48, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED
	person_event SPRITE_PALETTE_PATROLLER, 14, 47, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_VARANEOUS_REVIVED