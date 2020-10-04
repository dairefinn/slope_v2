
local plymeta = FindMetaTable( "Player" )
if not plymeta then return end

function plymeta:IsAlive() return self:Team() == TEAM_PLAYER end
function plymeta:IsSpec() return self:Team() == TEAM_SPEC end

AccessorFunc(plymeta, "role", "Role", FORCE_NUMBER)

-- Strips player of all equipment
function plymeta:StripAll()
   -- standard stuff
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
 