const_value set 2
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST

PokecenterBackroom_MapScriptHeader:
.MapTriggers
	db 4

	; triggers
	maptrigger GenericDummyScript
	maptrigger .left_cable_trade_center_trigger
	maptrigger .left_cable_colosseum_trigger
	maptrigger .left_time_capsule_trigger

.MapCallbacks
	db 0

.left_cable_trade_center_trigger
	priorityjump Script_LeftCableTradeCenter
	end

.left_cable_colosseum_trigger
	priorityjump Script_LeftCableColosseum
	end

.left_time_capsule_trigger
	priorityjump Script_LeftTimeCapsule
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_LINK_OPEN
	sif false
		jumptextfaceplayer Text_TradeRoomClosed
	checkevent EVENT_NOBUS_AGGRON_IN_PARTY
	sif true
		jumptextfaceplayer Text_TradeRoomClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	sif false
		closetextend
	special Special_SetBitsForLinkTradeRequest
	scall PokecenterBackroom_WaitSaveAndCheck
	sif false
		end
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse PokecenterBackroom_IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokecenterBackroom_EnterRoom
	warpcheck
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetextend

LinkReceptionistScript_Battle:
	checkevent EVENT_LINK_OPEN
	sif false
		jumptextfaceplayer Text_BattleRoomClosed
	checkevent EVENT_NOBUS_AGGRON_IN_PARTY
	sif true
		jumptextfaceplayer Text_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	sif false
		closetextend
	special Special_SetBitsForBattleRequest
	scall PokecenterBackroom_WaitSaveAndCheck
	sif false
		end
	copybytetovar wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special Special_CheckBothSelectedSameRoom
	iffalse PokecenterBackroom_IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall PokecenterBackroom_EnterRoom
	warpcheck
	end

.LinkedToFirstGen:
	special Special_FailedLinkToPast
	writetext Text_CantLinkToThePast
	special Special_CloseLink
	closetextend

LinkReceptionistScript_TimeCapsule:
	checkflag ENGINE_TIME_CAPSULE
	sif false
		jumptextfaceplayer Text_TimeCapsuleClosed
	special Special_SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	sif false
		closetextend
	special Special_CheckTimeCapsuleCompatibility
	sif =, 1
		jumptext Text_RejectNewMon
	sif =, 2
		jumptext Text_RejectMonWithNewMove
	scall PokecenterBackroom_WaitSaveAndCheck
	sif false
		end
	copybytetovar wOtherPlayerLinkMode
	iffalse .OK
	special Special_CheckBothSelectedSameRoom
	jump PokecenterBackroom_IncompatibleRooms

.OK:
	special Special_EnterTimeCapsule
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

Script_LeftCableTradeCenter:
Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	dotrigger $0
	domaptrigger BATTLE_CENTER, $0
	end

PokecenterBackroom_IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special Special_CloseLink
	closetextend

PokecenterBackroom_WaitSaveAndCheck:
	writetext Text_PleaseWait
	special Special_WaitForLinkedFriend
	sif false, then
		special WaitForOtherPlayerToExit
		jumptext Text_FriendNotReady
	sendif
	writetext Text_MustSaveGame
	yesorno
	iffalse .did_not_save
	special Special_TryQuickSave
	sif false, then
.did_not_save
		writetext Text_PleaseComeAgain
		jump .abort_link
	sendif
	writetext Text_PleaseWait
	special Special_CheckLinkTimeout
	sif false, then
		writetext Text_LinkTimedOut
.abort_link
		special WaitForOtherPlayerToExit
		closetext
	sendif
	end

PokecenterBackroom_EnterRoom:
	applymovement2 PokeCenter2F_Movement_SlowUpLeft_LookRight
	applymovement PLAYER, PokeCenter2F_Movement_Up3
	end

Script_WalkOutOfLinkTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2F_Movement_SlowUpLeft_LookRight
	applymovement PLAYER, PokeCenter2F_Movement_Down3
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, PokeCenter2F_Movement_SlowRightDown
	end

Script_WalkOutOfLinkBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2F_Movement_SlowUpLeft_LookRight
	applymovement PLAYER, PokeCenter2F_Movement_Down3
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, PokeCenter2F_Movement_SlowRightDown
	end

TimeCapsuleScript_CheckPlayerGender:
	checkcode VAR_FACING
	if_equal LEFT, .MaleFacingLeft
	if_equal RIGHT, .MaleFacingRight
	applymovement2 PokeCenter2F_Movement_SlowLeft_LookDown
	applymovement PLAYER, PokeCenter2F_Movement_Up2
	end

.MaleFacingLeft:
	applymovement2 PokeCenter2F_Movement_SlowLeft_LookDown
	applymovement PLAYER, PokeCenter2F_Movement_LeftUp
	end

.MaleFacingRight:
	applymovement2 PokeCenter2F_Movement_SlowRight_LookDown
	applymovement PLAYER, PokeCenter2F_Movement_RightUp
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2F_Movement_SlowLeft_LookRight
	applymovement PLAYER, PokeCenter2F_Movement_Down2
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, PokeCenter2F_Movement_SlowRight_LookDown
	dotrigger $0
	domaptrigger TIME_CAPSULE, $0
	end

MapPokeCenter2FSignpost0Script:
	refreshscreen $0
	special Special_DisplayLinkRecord
	closetextend

PokeCenter2F_Movement_Up3:
	step_up
PokeCenter2F_Movement_Up2:
	step_up
PokeCenter2F_Movement_Up:
	step_up
	step_end

PokeCenter2F_Movement_Down3:
	step_down
PokeCenter2F_Movement_Down2:
	step_down
PokeCenter2F_Movement_Down:
	step_down
	step_end

PokeCenter2F_Movement_Left:
	step_left
	step_end

PokeCenter2F_Movement_LeftUp:
	step_left
	step_up
	step_end

PokeCenter2F_Movement_Right:
	step_right
	step_end

PokeCenter2F_Movement_RightUp:
	step_right
	step_up
	step_end

PokeCenter2F_Movement_SlowRightDown:
	slow_step_right
	slow_step_down
	step_end

PokeCenter2F_Movement_SlowUpLeft_LookRight:
	slow_step_up
PokeCenter2F_Movement_SlowLeft_LookRight:
	slow_step_left
PokeCenter2F_Movement_LookRight:
	turn_head_right
	step_end

PokeCenter2F_Movement_SlowLeft_LookDown:
	slow_step_left
	turn_head_down
	step_end

PokeCenter2F_Movement_SlowRight_LookDown:
	slow_step_right
	turn_head_down
	step_end

PokeCenter2F_Movement_SlowRight_LookLeft:
	slow_step_right
	turn_head_left
	step_end

PokeCenter2F_Movement_Spin:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end

PokeCenter2F_Movement_Spin_LookLeft:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_left
	step_end

PokeCenter2F_Movement_Spin_LookDown:
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end

Text_BattleReceptionistIntro:
	ctxt "Willkommen im"
	line "Kabel Club "
	cont "Kolosseum."

	para "Hier kannst du"
	line "gegen einen Freund"
	cont "kämpfen."

	para "Möchtest du "
	line "kämpfen?"

	done

Text_TradeReceptionistIntro:
	ctxt "Willkommen im"
	line "Kabel Club "
	cont "Kolosseum."

	para "Hier kannst du"
	line "dein #mon mit"
	para "einem Freund "
	line "tauschen."

	para "Möchtest du "
	line "tauschen?"

	done

Text_TimeCapsuleReceptionistIntro:
	ctxt "Willkommen bei der"
	line "Kabel Club "
	cont "Zeitkapsel."

	para "Hier kannst du in"
	line "die Vergangenheit"
	para "reisen und dein"
	line "#mon tauschen."

	para "Möchtest du "
	line "tauschen?"

	done

Text_FriendNotReady:
	ctxt "Dein Freund ist"
	line "nicht bereit."

	prompt

Text_MustSaveGame:
	ctxt "Du musst"
	line "speichern, bevor"
	para "die Verbindung"
	line "hergestellt wird."

	done

Text_PleaseWait:
	ctxt "Bitte warten."

	done

Text_LinkTimedOut:
	ctxt "Die Verbindung"
	line "wurde auf Grund"
	para "von Inaktivität "
	line "getrennt."

	prompt

Text_PleaseComeAgain:
	ctxt "Komm bald wieder."

	prompt

Text_PleaseComeIn:
	ctxt "Komm herein."

	prompt

Text_TemporaryStagingInLinkRoom:
	ctxt "Wir bringen dich"
	line "zum Link-Raum."

	done

Text_CantLinkToThePast:
	ctxt "Du kannst hier"
	line "nicht in die"
	para "Vergangenheit "
	line "reisen."

	prompt

Text_IncompatibleRooms:
	ctxt "Es wurden"
	line "inkompatible Räume"
	cont "gewählt."

	prompt

Text_PleaseEnter:
	ctxt "Tritt ein."

	prompt

Text_RejectNewMon:
	ctxt "Du kannst <STRBF1>"
	line "nicht nehmen."

	done

Text_RejectMonWithNewMove:
	ctxt "Du kannst <STRBF1>"
	line " nicht nehmen, da"
	cont " es <STRBF2> hat."

	done

Text_TimeCapsuleClosed:
	ctxt "Es tut mir leid -"
	line "die Zeitkapsel"
	para "wird gerade "
	line "eingestellt."

	done

Text_TradeRoomClosed:
	ctxt "Es tut mir leid -"
	line "die Tauschmaschine"
	para "wird gerade "
	line "eingestellt."

	done

Text_BattleRoomClosed:
	ctxt "Es tut mir leid -"
	line "die Kampfmaschine"
	para "wird gerade "
	line "eingestellt."

	done

Text_OhPleaseWait:
	ctxt "Oh, bitte warten."

	done

Text_ChangeTheLook:
	ctxt "Wir müssen hier"
	line "das Aussehen"
	cont "ändern<...> "
	done

Text_LikeTheLook:
	ctxt "Wie gefällt dir"
	line "dieser Style?"

	done

PokecenterBackroom_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 7, 7, -1, POKECENTER_BACKROOM
	warp_def 0, 3, 1, TRADE_CENTER
	warp_def 0, 11, 1, BATTLE_CENTER
	warp_def 2, 7, 1, TIME_CAPSULE
	warp_def 7, 8, -1, POKECENTER_BACKROOM

.CoordEvents: db 0

.BGEvents: db 1
	signpost 3, 7, SIGNPOST_READ, MapPokeCenter2FSignpost0Script

.ObjectEvents: db 3
;	person_event SPRITE_LINK_RECEPTIONIST, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
;	person_event SPRITE_LINK_RECEPTIONIST, 2, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
;	person_event SPRITE_LINK_RECEPTIONIST, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	person_event SPRITE_LINK_RECEPTIONIST, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Text_TradeRoomClosed, -1
	person_event SPRITE_LINK_RECEPTIONIST, 2, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Text_BattleRoomClosed, -1
	person_event SPRITE_LINK_RECEPTIONIST, 3, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TEXTFP, 0, Text_TimeCapsuleClosed, -1
