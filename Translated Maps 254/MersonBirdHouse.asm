MersonBirdHouse_MapScriptHeader:
 ;trigger count
	db 0
 ;callback count
	db 0

MersonBirdHouseDude:
	faceplayer
	opentext
	checkevent EVENT_TM62
	sif true
		jumptext .after_TM_text
	writetext .before_TM_text
	givetm TM_SKY_ATTACK + RECEIVED_TM
	setevent EVENT_TM62
	closetextend

.before_TM_text
	ctxt "Ha!"
	para "Die Flinkheit"
	line "eines Vogel-"
	para "#mon ist nicht"
	line "zu übertreffen!"
	para "Du scheinst ein"
	line "Reisender wie ich"
	para "zu sein, der vor"
	line "Mut nur strotzt!"
	para "Ich denke, du"
	line "wirst diese TM so"
	cont "lieben wie ich!"
	sdone

.after_TM_text
	ctxt "TM62 enthält"
	line "Himmelsfeger!"
	para "Es benötigt zwar"
	line "eine Runde um"
	para "aufzuladen, doch"
	line "danach verursacht"
	para "es deinem Feind"
	line "enormen Schaden!"
	done

MersonBirdHouseSwellow:
	faceplayer
	opentext
	writetext .text
	cry SWELLOW
	endtext

.text
	ctxt "Schwalboss: Schwa!"
	ctxt "Xatu: Tu!"
	done
MersonBirdHouseXatu:
	faceplayer
	opentext
	writetext .text
	cry XATU
	endtext

.text
	ctxt "Tauboss: Boss oss!"
	done

MersonBirdHousePidgeot:
	faceplayer
	opentext
	writetext .text
	cry PIDGEOT
	endtext

.text
	done

MersonBirdHouse_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def $7, $2, 5, MERSON_CITY
	warp_def $7, $3, 5, MERSON_CITY

.CoordEvents
	db 0

.BGEvents
	db 0

.ObjectEvents
	db 4
	person_event SPRITE_SWELLOW, 7, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MersonBirdHouseSwellow, -1
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MersonBirdHouseDude, -1
	person_event SPRITE_XATU, 2, 7, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MersonBirdHouseXatu, -1
	person_event SPRITE_PIDGEOT, 4, 0, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MersonBirdHousePidgeot, -1