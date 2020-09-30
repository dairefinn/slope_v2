-- Declare hooks here
function InitHooks()
    hook.Add( "PlayerNoClip", "NCLP.Disable", TryNoclip)
end

-- Can only noclip if enabled for role
function TryNoclip(player)
    local admin_noclip = GetConVar("slope_admin_noclip"):GetInt();
    local superadmin_noclip = GetConVar("slope_superadmin_noclip"):GetInt();
    local canNoclip = (((admin_noclip == 1) and player:IsAdmin()) or ((superadmin_noclip == 1) and player:IsSuperAdmin()));
    return canNoclip;
end 

