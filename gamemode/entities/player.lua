-- Runs when a players loadout is set
function GM:PlayerLoadout(player)
	if IsValid(player) and (not player:IsSpec()) then
		player:Give( "weapon_crowbar" )
	end 
end

-- Runs when a players model is set
function GM:PlayerSetModel(player)
	local mdl = GAMEMODE.playermodel or "models/player/phoenix.mdl"
	util.PrecacheModel(mdl)
	player:SetModel(mdl)
end

-- Run player spawn
function GM:PlayerSpawn(player)
	-- Some spawns may be tilted
	player:ResetViewRoll()
	
	player.spawn_nick = player:Nick()
	player.has_spawned = true

	-- Handle spectators
	if player:IsSpec() then
		player:StripAll()
		player:Spectate(OBS_MODE_ROAMING)
		return
	 end



	 player:UnSpectate()

	 -- ye olde hooks
	 hook.Call("PlayerLoadout", GAMEMODE, player)
	 hook.Call("PlayerSetModel", GAMEMODE, player)

  
	 player:SetupHands()
end

-- Runs when a player tries to pick something up (with the e key)
function GM:AllowPlayerPickup(player, entity)
	PrintInfo("Not implemented")
end

-- Runs when a player dies
function GM:PlayerDeath(victim, inflictor, attacker)
	victim:SetTeam(TEAM_SPECTATOR)
	victim:Flashlight(false)
	local rag_ent = victim.server_ragdoll or victim:GetRagdollEntity()
	victim:SpectateEntity(rag_ent)
	PrintInfo("User died. Team: " .. team.GetName(victim:Team()))
end

-- Runs when trying to kill a player
function GM:DoPlayerDeath(player, attacker, dmginfo)
	if player:IsSpec() then return end -- Don't kill spectators

	-- Create ragdoll and hook up marking effects
	local rag = CORPSE.Create(player, attacker, dmginfo)
	player.server_ragdoll = rag -- nil if clientside
 
	CreateDeathEffect(player, false) -- Spray blood on floor
	-- DamageLog(Format("%s was killed", player:Nick())) -- TODO: Death message
	player:StripAll() -- Strip all weapons
	PlayDeathSound(player) -- Play death noise
 
	local killwep = util.WeaponFromDamage(dmginfo)
 end

 -- Put death effect at the specified location
function CreateDeathEffect(ent, marked)
	local pos = ent:GetPos() + Vector(0, 0, 20)
 
	local jit = 35.0
 
	local jitter = Vector(math.Rand(-jit, jit), math.Rand(-jit, jit), 0)
	util.PaintDown(pos + jitter, "Blood", ent)
 
	if marked then
	   util.PaintDown(pos, "Cross", ent)
	end
end

-- Play death sound
function PlayDeathSound(victim)
	if not IsValid(victim) then return end
 
	sound.Play(SOUND.lego_yoda_death, victim:GetShootPos(), 90, 100)
 end

 -- TODO: THIRDPERSON STUFF
 if ( SERVER ) then
	function ThirdPersonPlayerSay( Player, Text, Public )
		if Player:IsUserGroup {"superadmin", "admin", "moderator", "donator"} then
			if ( Player:IsValid() ) then
				if ( string.lower( Text ) == "/thirdperson" ) then
					Player:ConCommand( "ls_thirdperson 1" )
					return ""
				elseif ( string.lower( Text ) == "/firstperson" ) then
					Player:ConCommand( "ls_thirdperson 0" )
					return ""
				end
			end
		else
			ULib.tsayColor(Player, Color(255, 0, 0, 0), "You don't have that ability!")
		end
	end
	hook.Add( "PlayerSay", "ThirdPersonPlayerSay", ThirdPersonPlayerSay )
end

LsThirdPerson = CreateConVar( "ls_thirdperson", "0", {

	FCVAR_ARCHIVE

} )

if ( CLIENT ) then
	-- You should only modify the following table values, unless you know what you're doing.

	local CameraOffset = { -- Allows you to offset the camera however you like.

		UD = 0, -- Up / Down. Use a positive number for up, negative for right. Default = 0
		RL = 20, -- Right / Left. Use a positive number for right, negative for left. Default = 0
		FB = -70 -- Forward / Backward. Use a positive number for forward ( Not sure why you would do it ), negative for backward. Default = -88

	}

	function ThirdPersonDrawPlayer()

		return LsThirdPerson:GetBool() and not ( LocalPlayer():InVehicle() ) or LocalPlayer():IsPlayingTaunt()

	end
	hook.Add( "ShouldDrawLocalPlayer", "ThirdPersonDrawPlayer", ThirdPersonDrawPlayer )

	function ThirdPersonCalcView( Player, Origin, Ang, Fov )

		if ( LsThirdPerson:GetBool() and not ( Player:InVehicle() ) ) then

			local TraceData = { }

			TraceData.start = Player:EyePos()
			TraceData.endpos = Player:EyePos() + ( Player:GetUp() * CameraOffset.UD ) + ( Player:GetRight() * CameraOffset.RL ) + ( Player:GetForward() * CameraOffset.FB )
			TraceData.filter = Player
			TraceData.mask = MASK_SOLID_BRUSHONLY

			local Trace = util.TraceLine( TraceData )

			local View = { }
			View.origin = Trace.HitPos + Player:GetForward() * 8
			View.angles = Player:GetAngles()
			View.fov = Fov

			return View

		end

	end
	hook.Add( "CalcView", "ThirdPersonCalcView", ThirdPersonCalcView )
end

-- Hook: When a player tries to noclip
function TryNoclip(player)
    local admin_noclip = GetConVar("slope_admin_noclip"):GetInt();
    local superadmin_noclip = GetConVar("slope_superadmin_noclip"):GetInt();
    local canNoclip = (((admin_noclip == 1) and player:IsAdmin()) or ((superadmin_noclip == 1) and player:IsSuperAdmin()));
    return canNoclip;
end 
