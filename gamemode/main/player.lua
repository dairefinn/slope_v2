-- Set the default loadout
function GM:PlayerLoadout(player)
	player:Give( "weapon_crowbar" )

	-- Prevent default Loadout.
	return true
end

function GM:AllowPlayerPickup(player, entity)
	PrintInfo("Not implemented")
end