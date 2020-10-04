-- function GM:ScoreboardShow()
-- 	showScoreboard()
-- end

-- function GM:ScoreboardHide()
-- 	hideScoreboard()
-- end

-- function showScoreboard()
--     -- Create the scoreboard here, with an base like DPanel, you can use an DListView for the rows.
--     --[[ Line painting ]]--
--     for _, v in ipairs( player.GetAll() ) do
--         local line = playerlist:AddLine( v:Name(), v:Frags(), v:Deaths(), v:Ping() )
--         function line:Paint( w, h )
--             -- Paint the LINEs here
--         end
--     end

--     --[[ Column header painting ]]--
--     for _, v in ipairs(playerlist.Columns) do
--         function v.Header:Paint(w, h)
--             -- Paint the HEADERs here
--         end

--         v.Header:SetTextColor( Color( 255, 255, 255, 0 ) ) -- Set its text alpha with this in case you paint the text manually
--     end

-- 	function hideScoreboard()
-- 		-- This is where you hide the scoreboard, such as with Base:Remove()
-- 	end
-- end