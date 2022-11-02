PrisonF1_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 1
	dbw MAPCALLBACK_TILES, PrisonF1_UpdateLockedDoors

PrisonF1_UpdateLockedDoors:
	copy wCageKeyDoorsArrayBank
	dba PrisonF1ChangeBlockArray
	db (PrisonF1ChangeBlockArrayEnd - PrisonF1ChangeBlockArray) / 5
	endcopy
	farjump UpdateCageKeyDoorsScript

PrisonF1ChangeBlockArray:
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_1, 20, 6, $1a
PrisonF1ChangeBlockArrayEntrySizeEnd:
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_2, 34, 4, $1a
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_3, 36, 18, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_4, 34, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_5, 26, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_6, 18, 26, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_7, 12, 22, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_8, 4, 22, $18
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_9, 4, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_10, 10, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_11, 36, 30, $57
	eventflagchangeblock EVENT_PRISON_LOCKED_DOOR_12, 22, 30, $57
PrisonF1ChangeBlockArrayEnd:

PrisonF1CellSignpost:
	ctxt "Versuch nicht,"
	line "über diese Grube"
	para "zu springen!"

	para "Du sollst hier"
	line "deine verdiente"
	cont "Strafe absitzen."
	done

PrisonF1BlackPatroller:
	faceplayer
	opentext
	checkevent EVENT_PRISON_ROOF_CARD
	sif true
		jumptext .after_card_explanation_text
	writetext .intro_text
	verbosegiveitem ROOF_CARD, 1
	waitbutton
	writetext .after_give_card_text
	setevent EVENT_PRISON_ROOF_CARD
	endtext

.intro_text
	start_asm
	ld hl, wStringBuffer1
	ld a, "h"
	ld [hli], a
	ld a, [wPlayerGender]
	rra
	jr c, .female
	ld a, "i"
	ld [hli], a
	ld [hl], "s"
	jr .done_gender
.female
	ld a, "e"
	ld [hli], a
	ld [hl], "r"
.done_gender
	inc hl
	ld [hl], "@"
	ld hl, .intro_text_contents
	ret

.intro_text_contents
	ctxt "Ich kenne dich."

	para "Du hast mich"
	line "undercover hoch-"
	cont "genommen!"

	para "Ich könnte dich"
	line "dafür hassen,"
	para "dass ich hier"
	line "gelandet bin <...> Aber"
	para "ich habe hier über"
	line "mein Leben gut"
	cont "nachdenken können."

	para "Nicht nur über"
	line "mein Schicksal,"
	para "sondern über alle"
	line "anderen Menschen,"
	para "deren Leben auch"
	line "nur von einer"
	para "Entscheidung"
	line "abhängen."

	para "Ich hatte die"
	line "Entscheidung"
	para "getroffen, einer"
	line "Gruppe beizutre-"
	para "ten, die mit"
	line "Gewalt ihren Weg"
	cont "gehen wollten."

	para "Ich dachte, ich"
	line "tue Gutes <...>"
	para "<...> dass ich auf"
	line "diesem Weg den"
	para "Wachstum von"
	line "#mon erhöhen"
	para "und so der Welt"
	line "was Gutes tun"
	cont "würde <...>"

	para "Ich glaubte, dass"
	line "das, was ich tue"
	para "gut war <...> Bis wir"
	line "auf dich trafen:"
	para "Du <...> freundlich,"
	line "nett zu #mon &"
	para "übetriffst selbst" ;gender selected above
	line "unsere besten"
	cont "Leute!"

	para "Du zeigst deinem"
	line "#mon Team"
	para "großen Respekt &"
	line "hast so eine enge"
	para "positive Bindung"
	line "zu ihnen aufgebaut"

	para "Die Welt braucht"
	line "mehr solcher"
	cont "Trainer wie dich!"

	para "Hier, nimm das."

	para "Du verdienst es"
	line "mehr als ich."
	sdone

.after_give_card_text
	ctxt "Diese Karte fand"
	line "ich auf dem Boden."

	para "Es gewährt dir"
	line "Zutritt zum Dach."

	para "Das Tor zum Keller"
	line "ist durch einen"
	para "speziellen Code"
	line "gesichert."

	para "Da halten Sie die"
	line "gefährlichsten"
	cont "#mon gefangen."

	para "Jemand anderes"
	line "müsste den Code"
	cont "kennen."
	done

.after_card_explanation_text
	ctxt "Pass auf dich"
	line "gut auf."
	done
	
PrisonF1_Trainer_1:
	trainer EVENT_PRISON_F1_TRAINER_1, COOLTRAINERM, 12, .before_battle_text, .battle_won_text

	ctxt "Du scheinst eine"
	line "sehr sensible"
	para "Person zu sein."

	para "Du strebst nach"
	line "dem Leben, das du"
	para "dir wünschst,"
	line "statt so zu leben"
	para "wie du musst und"
	line "genau deshalb"
	para "werden dir und"
	line "deinem Umfeld nur"
	para "Gutes"
	line "wiederfahren."

	para "Hier eine Info,"
	line "die dich ebenfalls"
	para "weiterbringen"
	line "wird:"
	cont "RAUF ZUM DACH!"

	para "Ein paar Wärter"
	line "gingen da rauf um,"
	para "etwas zu trinken &"
	line "zu rauchen während"
	cont "ihrer Pausen."

	para "Manche von ihnen"
	line "sind vieleicht so"
	para "betrunken, dass"
	line "sie dir den"
	para "Code zum Keller"
	line "nennen könnten."
	done

.before_battle_text
	ctxt "So ein Gefängnis"
	line "ist gar nicht mal"
	cont "so schlecht."

	para "Ich muss meine"
	line "Schulden nicht"
	cont "mehr zahlen."
	done

.battle_won_text
	ctxt "Ohne Moos nix"
	line "los."
	done

PrisonF1_Trainer_2:
	trainer EVENT_PRISON_F1_TRAINER_2, FISHER, 14, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	faceplayer
	showtext .after_battle_text
	check_just_battled
	sif false
		end
	readpersonxy 5, wScriptBuffer
	writebyte 35 + 4
	comparevartobyte wScriptBuffer
	sif !=, 2
		end
	writebyte 26 + 4
	comparevartobyte wScriptBuffer + 1
	sif !=, 2
		end
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 4, PrisonF1_BlockableTrainerMovesRight
	selse
		applymovement 4, PrisonF1_BlockableTrainerMovesLeft
	sendif
	end

.before_battle_text
	ctxt "<...> Ich hoffe, meine"
	line "Freundin Jasmine"
	para "wartet da draußen"
	line "noch auf mich."
	done

.battle_won_text
	ctxt "Nicht Fair!"
	done

.after_battle_text
	ctxt "Sorry, ich habe"
	line "keine Infos, die"
	para "ich mit dir teilen"
	line "würde."
	sdone

PrisonF1_Trainer_3:
	trainer EVENT_PRISON_F1_TRAINER_3, BIKER, 9, .before_battle_text, .battle_won_text, NULL, .Script

.before_battle_text
	ctxt "Sie lassen"
	line "mittlerweile auch"
	cont "Kinder hier rein?"

	para "Das Gefängnis ist"
	line "nun offiziell"
	cont "uncool <...>"
	done

.battle_won_text
	ctxt "Ich glaubs"
	line "einfach nicht!"

	para "Das Gefängnis ist"
	line "nun ein Ort für"
	para "Hipster geworden,"
	line "die sich ein-"
	para "sperren lassen,"
	line "um auch hier drin"
	para "den Leuten auf"
	line "den Sack gehen zu"
	cont "dürfen."
	done

.give_key_text
	ctxt "Der einzige Grund,"
	line "warum ich mich"
	para "hier einsperren"
	line "lies, war Respekt"
	cont "zu erlangen."

	para "<...> Weshalb ich"
	line "diesen Schlüssel"
	para "nicht mehr"
	line "benötige."
	sdone

.after_key_text
	ctxt "Der einzige Grund,"
	line "warum ich mich"
	para "hier einsperren"
	line "lies, war den"
	para "Respekt meiner"
	line "Mitinsassen zu"
	cont "verdienen."
	done

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_3
	sif true
		jumptextfaceplayer .after_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_3
PrisonF1_TrainerGiveKey:
	verbosegiveitem CAGE_KEY, 1
	waitbutton
	sif false
		jumptext .no_room_text
	setevent -1
	closetextend

.no_room_text
	ctxt "Du hast keinen"
	line "Platz frei!"
	done

PrisonF1_Trainer_4:
	trainer EVENT_PRISON_F1_TRAINER_4, SAILOR, 4, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_4
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_4
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "Ich brauch mehr"
	line "Platz!"
	done

.battle_won_text
	ctxt "Du hast einen"
	line "großen Fehler"
	cont "gemacht!"
	done

.give_key_text
	ctxt "Wenn du mir diesen"
	line "Schlüssel nimmst,"
	para "werde ich sauer"
	line "auf dich sein."
	sdone

.after_give_key_text
	ctxt "BETRUG!"
	done

PrisonF1_Trainer_5:
	trainer EVENT_PRISON_F1_TRAINER_5, MINER, 1, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_5
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_5
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "Bereit für paar"
	line "Informationen?"

	para "Und wie wäre es"
	line "mit einem Kampf?"
	done

.battle_won_text
	ctxt "Uff, du bist gut!"
	done

.give_key_text
	ctxt "Es ist schon so"
	line "lange her, dass"
	para "mich ein Kampf"
	line "so gereizt hat."

	para "Aber sorry, leider"
	line "habe ich keine"
	para "Informationen"
	line "für dich."

	para "Aber ich habe"
	line "einen Schlüssel"
	para "hier irgendwo"
	line "rumliegen."
	sdone

.after_give_key_text
	ctxt "Verschwinde!"
	done

PrisonF1_Trainer_6:
	trainer EVENT_PRISON_F1_TRAINER_6, BIRD_KEEPER, 8, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_6
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_6
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "Hallooo ABF!"
	done

.battle_won_text
	ctxt "WAS WAR DAS DENN?"
	done

.give_key_text
	ctxt "Ich glaub's nicht,"
	line "dass du das tun"
	para "konntest, nach"
	line "all dem, was wir"
	para "gemeinsam durch-"
	line "gemacht haben!"	

	para "Nimm einfach den"
	line "Schlüssel und geh!"
	sdone

.after_give_key_text
	ctxt "Sag nichts mehr!"
	line "Ich brauche Zeit"
	cont "für mich."
	done

PrisonF1_Trainer_7:
	trainer EVENT_PRISON_F1_TRAINER_7, SAILOR, 5, .before_battle_text, .battle_won_text, NULL, .Script

.Script
	scall .PrisonF1_Trainer_7_GivesKey
	check_just_battled
	sif false
		end
	readpersonxy 15, wScriptBuffer
	writebyte 34 + 4
	comparevartobyte wScriptBuffer
	sif !=, 2
		end
	writebyte 4 + 4
	comparevartobyte wScriptBuffer + 1
	sif !=, 2
		end
	checkcode VAR_FACING
	sif =, RIGHT, then
		applymovement 8, PrisonF1_BlockableTrainerMovesRight
	selse
		applymovement 8, PrisonF1_BlockableTrainerMovesLeft
	sendif
	end

.PrisonF1_Trainer_7_GivesKey
	opentext
	checkevent EVENT_PRISON_GOT_KEY_FROM_TRAINER_7
	sif true
		jumptext .after_give_key_text
	writetext .give_key_text
	writehalfword EVENT_PRISON_GOT_KEY_FROM_TRAINER_7
	jump PrisonF1_TrainerGiveKey

.before_battle_text
	ctxt "Es ist viel zu"
	line "kalt hier drin <...>"
	done

.battle_won_text
	ctxt "Das hat mich"
	line "gewärmt."
	done

.give_key_text
	ctxt "Nimm diesen"
	line "schlüssel und"
	cont "geh!"
	sdone

.after_give_key_text
	ctxt "Geh doch endlich!"
	done

PrisonF1_BlockableTrainerMovesLeft:
	step_left
	step_end

PrisonF1_BlockableTrainerMovesRight:
	step_right
	step_end

PrisonF1_MapEventHeader:: db 0, 0

.Warps: db 11
	warp_def 35, 18, 1, SAXIFRAGE_ISLAND
	warp_def 35, 19, 1, SAXIFRAGE_ISLAND
	warp_def 2, 2, 2, PRISON_PATHS
	warp_def 17, 22, 7, PRISON_PATHS
	warp_def 15, 31, 3, PRISON_PATHS
	warp_def 8, 37, 1, PRISON_F2
	warp_def 12, 34, 1, PRISON_B1F
	warp_def 26, 0, 1, PRISON_BATHS
	warp_def 27, 0, 2, PRISON_BATHS
	warp_def 28, 39, 1, PRISON_WORKOUT
	warp_def 29, 39, 2, PRISON_WORKOUT

.CoordEvents: db 0

.BGEvents: db 13
	signpost 7, 20, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 0
	signpost 5, 34, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 1
	signpost 23, 5, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 7
	signpost 23, 13, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 6
	signpost 27, 19, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 5
	signpost 27, 27, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 4
	signpost 19, 37, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 2
	signpost 27, 35, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 3
	signpost 30, 4, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 8
	signpost 30, 10, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 9
	signpost 2, 19, SIGNPOST_TEXT, PrisonF1CellSignpost
	signpost 30, 22, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 11
	signpost 30, 36, SIGNPOST_JUMPSTDNOSFX, cagekeydoor, 10

.ObjectEvents: db 13
	person_event SPRITE_COOLTRAINER_M, 20, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 0, PrisonF1_Trainer_1, -1
	person_event SPRITE_FISHER, 25, 35, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_2, -1
	person_event SPRITE_BIKER, 24, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_3, -1
	person_event SPRITE_SAILOR, 20, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_4, -1
	person_event SPRITE_MINER, 32, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_5, -1
	person_event SPRITE_BIRDKEEPER, 32, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_6, -1
	person_event SPRITE_SAILOR, 3, 35, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, PrisonF1_Trainer_7, -1
	person_event SPRITE_PALETTE_PATROLLER, 32, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, PrisonF1BlackPatroller, EVENT_PHLOX_LAB_CEO
	person_event SPRITE_POKE_BALL, 5, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_PRISON_F1_ITEM_CAGE_KEY_1
	person_event SPRITE_POKE_BALL, 16, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, CAGE_KEY, EVENT_PRISON_F1_ITEM_CAGE_KEY_2
	person_event SPRITE_POKE_BALL, 24, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, PP_UP, EVENT_PRISON_F1_ITEM_PP_UP
	person_event SPRITE_POKE_BALL, 5, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_ITEMBALL, 1, FLUFFY_COAT, EVENT_PRISON_F1_ITEM_FLUFFY_COAT
	person_event SPRITE_POKE_BALL, 32, 23, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 3, FRIEND_BALL, EVENT_PRISON_F1_ITEM_FRIEND_BALLS
