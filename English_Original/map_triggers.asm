MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	trigger_def POKECENTER_BACKROOM, wPokecenter2FTrigger
	trigger_def TRADE_CENTER, wTradeCenterTrigger
	trigger_def BATTLE_CENTER, wColosseumTrigger
	trigger_def TIME_CAPSULE, wTimeCapsuleTrigger
	trigger_def ROUTE_69_GATE, wRoute69GateTrigger
	trigger_def ROUTE_69_ILKBROTHERHOUSE, wIlkBrotherHouseTrigger
	trigger_def MILOS_B1F, wMilosB1FTrigger
	trigger_def MILOS_B2F, wMilosB2FTrigger
	trigger_def MILOS_B2FB, wMilosB2FBTrigger
	trigger_def BATTLE_TOWER_ENTRANCE, wBattleTowerEntranceTrigger
	trigger_def BATTLE_TOWER_ELEVATOR, wBattleTowerElevatorTrigger
	trigger_def BATTLE_TOWER_HALLWAY, wBattleTowerHallwayTrigger
	trigger_def BATTLE_TOWER_BATTLE_ROOM, wBattleTowerBattleRoomTrigger
	trigger_def FIRELIGHT_PALLETPATH_1F, wFirelightTunnelTrigger
	trigger_def RUINS_F1, wRuinsF1Trigger
	trigger_def RUINS_F2, wRuinsF2Trigger
	trigger_def RUINS_F3, wRuinsF3Trigger
	trigger_def RUINS_F4, wRuinsF4Trigger
	trigger_def RUINS_F5, wRuinsF5Trigger
	trigger_def SAXIFRAGE_ISLAND, wSaxifrageTrigger
	trigger_def PRISON_F2, wPrisonF2Trigger
	trigger_def CLATHRITE_B1F, wClathriteBF1Trigger
	trigger_def PHLOX_LAB_B1F, wAcquaMinesBasementTrigger
	trigger_def HAUNTED_MANSION_BASEMENT, wHauntedMansionBasementTrigger
	trigger_def PHLOX_LAB_1F, wPhloxLab1FTrigger
	trigger_def PROVINCIAL_PARK_CONTEST, wProvincialParkContestTrigger
	trigger_def SOUTHERLY_CITY, wSoutherlyCityTrigger
	trigger_def ROUTE_69, wRoute69Trigger
	trigger_def NALJO_BORDER_WEST, wNaljoBadgeCheckTrigger
	trigger_def LAUREL_CITY, wLaurelCityTrigger
	trigger_def INTRO_OUTSIDE, wIntroOutsideTrigger
	trigger_def SPURGE_GYM_1F, wSpurgeGym1FTrigger
	db -1
