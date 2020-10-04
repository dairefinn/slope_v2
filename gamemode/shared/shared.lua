-- Shared imports between client and server
include("../helpers/logging.lua")
include("../main/sounds.lua")

-- This file is a shared script that runs on both the client and server
GM.Name = "Slope V2"
GM.Author = "Daire Finn"
GM.Email = "N/A"
GM.Website = "github.com/dairefinn"

-- TEAMS
TEAM_PLAYER = 1
TEAM_SPECTATOR = 1002
TEAM_UNASSIGNED = 1001
TEAM_JOINING = 0

-- local default_playermodels = {
--     Model("models/player/phoenix.mdl"),
--     Model("models/player/arctic.mdl"),
--     Model("models/player/guerilla.mdl"),
--     Model("models/player/leet.mdl")
--  };

--  -- Returns a random player model
--  function GetRandomPlayerModel()
--     return table.Random(default_playermodels);
--  end


-- Create teams
function GM:CreateTeams()
    PrintInfo("Setting up teams")
    team.SetUp(TEAM_PLAYER, "Players", Color(0, 200, 0, 255), false)
    team.SetUp(TEAM_SPECTATOR, "Spectators", Color(200, 200, 0, 255), true)

    -- Not that we use this, but feels good
    team.SetSpawnPoint(TEAM_PLAYER, "info_player_deathmatch")
    team.SetSpawnPoint(TEAM_SPECTATOR, {})
end
