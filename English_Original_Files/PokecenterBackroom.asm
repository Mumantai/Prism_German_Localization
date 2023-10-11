const_value = 2
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
	dotrigger 0
	domaptrigger BATTLE_CENTER, 0
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
	dotrigger 0
	domaptrigger TIME_CAPSULE, 0
	end

MapPokeCenter2FSignpost0Script:
	refreshscreen 0
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
	ctxt "Welcome to Cable"
	line "Club Colosseum."

	para "You may battle a"
	line "friend here."

	para "Would you like to"
	line "battle?"
	done

Text_TradeReceptionistIntro:
	ctxt "Welcome to Cable"
	line "Trade Center."

	para "You may trade your"
	line "#mon here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

Text_TimeCapsuleReceptionistIntro:
	ctxt "Welcome to Cable"
	line "Club Time Capsule."

	para "You can travel to"
	line "the past and trade"
	cont "your #mon."

	para "Would you like to"
	line "trade across time?"
	done

Text_FriendNotReady:
	ctxt "Your friend is not"
	line "ready."
	prompt

Text_MustSaveGame:
	ctxt "Before opening the"
	line "link, you must"
	cont "save your game."
	done

Text_PleaseWait:
	ctxt "Please wait."
	done

Text_LinkTimedOut:
	ctxt "The link has been"
	line "closed because of"
	cont "inactivity."

	para "Please contact"
	line "your friend and"
	cont "come again."
	prompt

Text_PleaseComeAgain:
	ctxt "Please come again."
	prompt

Text_PleaseComeIn:
	ctxt "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom:
	ctxt "We'll put you in"
	line "the link room for"
	cont "the time being."
	done

Text_CantLinkToThePast:
	ctxt "You can't link to"
	line "the past here."
	prompt

Text_IncompatibleRooms:
	ctxt "Incompatible rooms"
	line "were chosen."
	prompt

Text_PleaseEnter:
	ctxt "Please enter."
	prompt

Text_RejectNewMon:
	ctxt "Sorry - <STRBF1>"
	line "can't be taken."
	done

Text_RejectMonWithNewMove:
	ctxt "You can't take the"
	line "<STRBF1> with a"
	cont "<STRBF2>."
	done

Text_TimeCapsuleClosed:
	ctxt "I'm sorry - the"
	line "Time Capsule is"
	cont "being adjusted."
	done

Text_TradeRoomClosed:
	ctxt "I'm sorry - the"
	line "Trade Machine is"
	cont "being adjusted."
	done

Text_BattleRoomClosed:
	ctxt "I'm sorry - the"
	line "Battle Machine is"
	cont "being adjusted."
	done

Text_OhPleaseWait:
	ctxt "Oh, please wait."
	done

Text_ChangeTheLook:
	ctxt "We need to change"
	line "the look here…"
	done

Text_LikeTheLook:
	ctxt "How does this"
	line "style look to you?"
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
