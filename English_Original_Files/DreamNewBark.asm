DreamNewBark_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

DreamNewBarkNPC:
	faceplayer
	opentext
	writetext .main_text
	playsound SFX_PERISH_SONG
	setevent EVENT_HAUNTED_FOREST_GENGAR
	warp HAUNTED_MANSION, 49, 24
	jumptext .gengar_text

.main_text
	ctxt "Greetings."

	para "What?"

	para "No, I'm not a"
	line "Palette Patroller."

	para "In fact, I don't"
	line "even exist!"

	para "You are merely"
	line "lucid dreaming."

	para "You subconsciously"
	line "created me a mere"
	cont "few minutes ago."

	para "<...>"

	para "What role do I"
	line "have in your"
	cont "dream<...>?"

	para "Well<...> do you"
	line "understand the"
	para "main problems"
	line "facing the region"
	cont "known as Naljo?"

	para "You, with your"
	line "#mon, have the"
	para "power to restore"
	line "this nation to its"
	para "now somewhat"
	line "former glory."

	para "<...>"

	para "How I know that?"

	para "You made me, so<...>"

	para "Don't you know that"
	line "somewhere in you?"

	para "The region which"
	line "you came from<...>"

	para "It is without any"
	line "problems, right?"

	para "Naljo was that way"
	line "too in the past -"
	cont "free of problems."

	para "<...>"

	para "What happened?"

	para "Corruption."

	para "Greed."

	para "Depression."

	para "<...>"

	para "Be more specific?"

	para "But that's all you"
	line "know. You told me"
	cont "this."

	para "Your region could"
	line "be next, together"
	para "with all the other"
	line "regions that lie"
	cont "in proximity<...>"

	para "<...>"

	para "What do you mean"
	line "<``>greed ruined"
	cont "the Naljo region?<''>"

	para "<...>"

	para "Gengar: Mmmm!"
	line "Very tasty!"

	para "Lots of delicious"
	line "conflict in this"
	para "area. I'm going to"
	line "enjoy this meal!"

	para "<...>"

	para "Looks like I'm"
	line "dinner for Gengar."

	para "Don't forget what"
	line "I've told you."

	para "You can turn out"
	line "to be a hero<...>"

	para "You will find out"
	line "everything, and"
	para "grow to understand"
	line "it, soon enough."

	para "Trust me<...>"

	para "As in<...>"

	para "Trust yourself<...>"
	sdone

.gengar_text
	ctxt "-BELCH-"

	para "That was yummy!"

	para "I need to watch my"
	line "belly's weight."

	para "No more dreams for"
	line "me for at least a"
	cont "week!"
	done

DreamNewBark_MapEventHeader:: db 0, 0

.Warps
	db 0

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_PALETTE_PATROLLER, 14, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_PLAYER + 8, PERSONTYPE_SCRIPT, 0, DreamNewBarkNPC, -1
