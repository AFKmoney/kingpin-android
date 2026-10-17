LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := kingpin_game

LOCAL_CFLAGS := -DUSE_GLES1 -DIOAPI_NO_64 -DYQ2OSTYPE=\"Linux\" -DYQ2ARCH=\"Arm\" -DKINGPIN

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../engine/src/game/header \
	$(TOP_DIR) \
	$(TOP_DIR)/Clibs_OpenTouch \
	$(TOP_DIR)/Clibs_OpenTouch/quake

LOCAL_SRC_FILES := \
	G_cmds.c \
	G_combat.c \
	G_items.c \
	G_main.c \
	G_save.c \
	G_spawn.c \
	P_client.c \
	ai_bitch.c \
	ai_bum_sit.c \
	ai_dog.c \
	ai_punk.c \
	ai_runt.c \
	ai_shorty.c \
	ai_skinny.c \
	ai_thug.c \
	ai_thug_sit.c \
	ai_whore.c \
	ep_all.c \
	ep_crystalpalace.c \
	ep_log.c \
	ep_posionville.c \
	ep_radiocity.c \
	ep_shipyards.c \
	ep_skidrow.c \
	ep_steeltown.c \
	ep_trainyard.c \
	g_ai.c \
	g_ai_ents.c \
	g_ai_fight.c \
	g_ai_memory.c \
	g_cast.c \
	g_chase.c \
	g_fog.c \
	g_func.c \
	g_joe_misc.c \
	g_misc.c \
	g_pawn.c \
	g_phys.c \
	g_svcmds.c \
	g_target.c \
	g_teamplay.c \
	g_trigger.c \
	g_utils.c \
	g_weapon.c \
	m_bbox.c \
	m_move.c \
	p_hud.c \
	p_trail.c \
	p_view.c \
	p_weapon.c \
	q_shared.c \
	vehicles.c \
	voice.c \
	voice_bitch.c \
	voice_punk.c \

LOCAL_LDLIBS := -llog
include $(BUILD_SHARED_LIBRARY)
