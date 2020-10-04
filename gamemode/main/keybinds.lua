-- F1 key
function GM:ShowHelp(player)
    player:SetTeam(TEAM_PLAYER)
    player:PrintMessage(4, "Set " .. player:Nick() .. " to team " .. team.GetName(TEAM_PLAYER))
end

-- F2 key
function GM:ShowTeam(player)
    player:SetTeam(TEAM_UNASSIGNED)
    player:PrintMessage(4, "Set " .. player:Nick() .. " to team " .. team.GetName(TEAM_UNASSIGNED))
    
end

-- F3 key
function GM:ShowSpare1(player)
    player:SetTeam(TEAM_SPECTATOR)
    player:PrintMessage(4, "Set " .. player:Nick() .. " to team " .. team.GetName(TEAM_SPECTATOR))
end

-- F4 key
function GM:ShowSpare2(player)
    player:Spawn()
    player:PrintMessage(4, "Respawned " .. player:Nick() .. ". Team: " .. team.GetName(TEAM_SPECTATOR))
end

-- Other keys
function GM:KeyPress( player, key )
    -- Key bound to ....
    if (key == IN_ATTACK) then -- +attack (lmb)
    elseif (key == IN_JUMP) then -- +jump (space)
    elseif (key == IN_DUCK) then -- +duck (ctrl)
    elseif (key == IN_FORWARD) then -- +forward (w)
    elseif (key == IN_BACK) then -- +back (s)
    elseif (key == IN_USE) then -- +use (e)
    elseif (key == IN_CANCEL) then -- TODO: +cancel? Maybe esc
    elseif (key == IN_LEFT) then -- +left (camera)
    elseif (key == IN_RIGHT) then -- +right (camera)
    elseif (key == IN_MOVELEFT) then -- +moveleft (strafe)
    elseif (key == IN_MOVERIGHT) then -- +moveright (strafe)
    elseif (key == IN_ATTACK2) then -- +attack2 (rmb)
    elseif (key == IN_RUN) then -- TODO: +run? (?)
    elseif (key == IN_RELOAD) then -- +reload (r)
    elseif (key == IN_ALT1) then -- +alt1 (l-alt)
    elseif (key == IN_ALT2) then -- +alt2 (r-alt)
    elseif (key == IN_SCORE) then -- +showscores (tab)
    elseif (key == IN_SPEED) then -- +speed (shift)
    elseif (key == IN_WALK) then -- +walk (?)
    elseif (key == IN_ZOOM) then -- +zoom (?)
    elseif (key == IN_WEAPON1) then -- For use in weapons. Set in the physgun when scrolling an object away from you
    elseif (key == IN_WEAPON2) then -- For use in weapons. Set in the physgun when scrolling an object towards you
    elseif (key == IN_BULLRUSH) then -- ??
    elseif (key == IN_GRENADE1) then -- +grenade1 bound key
    elseif (key == IN_GRENADE2) then -- +grenade2 bound key
    else
    end

    player:PrintMessage(4, player:Nick() .. " pressed key: " .. key)

    -- TODO: Keybinds
    -- key_function_map[key]
end

-- Test noises
function TestKey()
    sound.Play(SOUND.lego_yoda_death, player:GetPos(), 90, 100, 100)
end

function TestKey2()
    sound.Play(SOUND.lego_yoda_death, player:GetPos(), 90, 100, 70)
end