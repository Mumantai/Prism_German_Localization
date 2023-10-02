AcquaStart_MapScriptHeader:
; trigger count
	db 0
; callback count
	db 0

AcquaStart_ForcedWildShinx:
	loadwildmon SHINX, 2
	startbattle
	reloadmapafterbattle
	dotrigger 1
	wildon
	end

AcquaStartMinecart:
	checkevent EVENT_MOUND_CAVE_RIVAL
	sif false
		jumptext .broken_cart_text
	farjump MinecartScript

.broken_cart_text
	ctxt "Diese Lore ist"
	line "kaputt!"
	done

AcquaStartLarvitar:
	faceplayer
	refreshscreen 0
	pokepic LARVITAR
	cry LARVITAR
	waitbutton
	closepokepic
	opentext
	writetext .found_larvitar_text
	yesorno
	sif false
		jumptext .declined_text
	setevent EVENT_ACQUA_LARVITAR
	writetext .holding_ball_text
	buttonsound
	waitsfx
	disappear 2
	pokenamemem LARVITAR, 0
	writetext .got_larvitar_text
	playwaitsfx SFX_CAUGHT_MON
	buttonsound
	givepoke LARVITAR, 5, NO_ITEM, 0
	closetextend

.found_larvitar_text
	ctxt "Dieses Larvitar"
	line "versperrt den Weg!"
	para "<...> Es sieht"
	line "einsam aus."
	para "Vieleicht will es"
	line "mitkommen."
	para "Willst du es"
	line "mitnehmen?"
	done

.holding_ball_text
	ctxt "Komisch <...>"
	para "Das Larvitar"
	line "hält einen"
	cont "#ball."
	para "<PLAYER> hat"
	line "Larvitar mit dem"
	cont "#ball gefangen."
	done

.got_larvitar_text
	ctxt "<PLAYER> erhält"
	line "<STRBF1>!"
	done

.declined_text
	ctxt "Dann bist du auf"
	line "dich gestellt."
	done

AcquaStart_MapEventHeader:: db 0, 0

.Warps
	db 2
	warp_def 5, 37, 1, ACQUA_TUTORIAL
	warp_def 1, 3, 1, ACQUA_ROOM

.CoordEvents
	db 1
	xy_trigger 0, 2, 35, AcquaStart_ForcedWildShinx

.BGEvents
	db 1
	signpost 36, 28, SIGNPOST_READ, AcquaStartMinecart

.ObjectEvents
	db 3
	person_event SPRITE_LARVITAR, 17, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AcquaStartLarvitar, EVENT_ACQUA_LARVITAR
	person_event SPRITE_POKE_BALL, 8, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, MAX_REVIVE, EVENT_ACQUA_START_ITEM_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 28, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_YELLOW, PERSONTYPE_TMHMBALL, TM_BODY_SLAM, 0, EVENT_ACQUA_TM76