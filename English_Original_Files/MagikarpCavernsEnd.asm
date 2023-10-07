MagikarpCavernsEnd_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MagikarpCavernsEndNPC:
	faceplayer
	opentext
	writetext .text
	setevent EVENT_MAGIKARP_TEST
	restorecustchar
	clearflag ENGINE_POKEMON_MODE
	clearflag ENGINE_CUSTOM_PLAYER_SPRITE
	warp LAUREL_CITY, 34, 12
	closetextend

.text
	ctxt "There's something"
	line "different about"
	cont "you now<...>"

	para "You appear to have"
	line "gained great"
	para "respect for the"
	line "many hardships of"
	para "#mon, much like"
	line "the natives of"
	cont "Naljo have."

	para "People who moved"
	line "here from many"
	para "lands solely use"
	line "their #mon as"
	cont "mere tools!"

	para "You may want to"
	line "speak to the last"
	para "remaining"
	line "descendant of"
	para "<``>The Messenger<''>,"
	line "on Route 80."

	para "For you both share"
	line "the same vision of"
	cont "life with #mon."

	para "Well done!"

	para "I give you my"
	line "permission to go"
	para "south of the"
	line "Laurel Forest."
	sdone

MagikarpCavernsEnd_MapEventHeader:: db 0, 0

.Warps
	db 1
	dummy_warp 9, 2

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_ELDER, 7, 4, SPRITEMOVEDATA_00, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_SCRIPT, 0, MagikarpCavernsEndNPC, -1
