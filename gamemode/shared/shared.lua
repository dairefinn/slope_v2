-- This file is a shared script that runs on both the client and server
GM.Name = "Slope V2"
GM.Author = "Daire Finn"
GM.Email = "N/A"
GM.Website = "github.com/dairefinn"

-- CREATE TEAMS
-- - TEAM_PLAYER = 1
-- - TEAM_SPECTATOR = 1002

-- - Unassigned = 1001
-- - Joining / Connecting = 0
TEAM_PLAYER = 1

-- Create teams
function GM:CreateTeams()
    PrintInfo("Setting up teams")
    team.SetUp(TEAM_PLAYER, "Players", Color(0, 200, 0, 255), false)
    team.SetUp(TEAM_SPECTATOR, "Spectators", Color(200, 200, 0, 255), true)

    -- Not that we use this, but feels good
    team.SetSpawnPoint(TEAM_PLAYER, "info_player_deathmatch")
    team.SetSpawnPoint(TEAM_SPECTATOR, "info_player_deathmatch")

    PrintTable(team.GetAllTeams(), 0)
end