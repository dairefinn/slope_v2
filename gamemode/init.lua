-- This runs on server init

-- Marks files as "To be sent to clients when they join"
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared/shared.lua")
AddCSLuaFile("helpers/logging.lua")
AddCSLuaFile("main/sounds.lua")
AddCSLuaFile("entities/player.lua")
AddCSLuaFile("vgui/scoreboard/scoreboard.lua")
AddCSLuaFile("shared/corpse_shared.lua")

include("cl_init.lua")

-- Server only imports
include("entities/corpse.lua")
include("entities/player.lua")
include("entities/player_ext.lua")
include("helpers/util.lua")
include("main/convars.lua")
include("main/hooks.lua")
include("main/keybinds.lua")


GM.RoundStartTime = 0
GM.playermodel = GetRandomPlayerModel()

function GM:Initialize()
    PrintInfo("==================================================")
    PrintInfo("gamemode server initializing...")
end
