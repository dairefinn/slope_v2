
local plymeta = FindMetaTable("Player")
if not plymeta then return end

function plymeta:IsAlive() return self:Team() == TEAM_PLAYER end
function plymeta:IsSpec() return self:Team() == TEAM_SPECTATOR end
function plymeta:IsUnassigned() return self:Team() == TEAM_UNASSIGNED end

AccessorFunc(plymeta, "role", "Role", FORCE_NUMBER) -- TODO: WTF does this do

-- Strips player of all equipment
function plymeta:StripAll()
   self:StripAmmo()
   self:StripWeapons()
end

function plymeta:ResetViewRoll()
    local ang = self:EyeAngles()
    if ang.r != 0 then
       ang.r = 0
       self:SetEyeAngles(ang)
    end
 end
 