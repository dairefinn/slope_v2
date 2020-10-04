-- This runs on client init

include("shared/shared.lua")

-- Imports
include("vgui/scoreboard/scoreboard.lua")
include("shared/corpse_shared.lua")

function GM:Initialize()
    PrintError("gamemode client initializing...")
end