-- This runs on server init

-- Marks files as "To be sent to clients when they join"
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared/shared.lua")
AddCSLuaFile("helpers/logging.lua")

-- Imports for server usage
include("shared/shared.lua")

include("helpers/logging.lua")

include("main/convars.lua")
include("main/hooks.lua")
include("main/player.lua")

function GM:Initialize()
    PrintInfo("==================================================")
    PrintInfo("gamemode server initializing...")
    InitHooks();
end
