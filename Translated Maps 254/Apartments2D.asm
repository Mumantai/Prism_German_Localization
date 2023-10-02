Apartments2D_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

Apartments2DNPC:
	faceplayer
	opentext
	checkevent EVENT_SPURGE_APARTMENT_TM67
	sif true
		jumptext .after_giving_TM_text
	writetext .give_TM_text
	givetm TM_TRI_ATTACK + RECEIVED_TM
	setevent EVENT_SPURGE_APARTMENT_TM67
	closetextend

.give_TM_text
	ctxt "Die Welt ist im"
	line "ständigen Wandel."
	para "Die Technologie"
	line "entwickelt sich"
	cont "endlos weiter."
	para "Also muss ich die"
	line "TM hier loswerden"
	para "und diesem Trend"
	line "entgegenwirken!"
	para "Ich brauche ja eh"
	line "mehr Platz hier <...>"
	sdone

.after_giving_TM_text
	ctxt "TM67 enthält"
	line "Triplette."
	para "Sein Typ ist die"
	line "Kombination von"
	para "Feuer, Eis und"
	line "Elektro."
	para "Somit kann es den"
	line "Gegner zufällig"
	para "verbrennen,"
	line "einfrieren oder"
	cont "paralysieren."
	done

Apartments2D_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $9, $4, 3, APARTMENTS_F3
	warp_def $9, $5, 3, APARTMENTS_F3

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 1
	person_event SPRITE_SCIENTIST, 5, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Apartments2DNPC, -1