-- TODO: Keybinds
local key_function_map = {
    [32] = TestKey, 
    [33] = TestKey2
}

hook.Add( "KeyPress", "keypress_use_hi", HandleKeyPress)

function HandleKeyPress( player, key )
    print(player, key);
    print(LookupKeyBinding(key))
    -- key_function_map[key]
end

function TestKey()
    sound.Play(SOUND.lego_yoda_death, player:GetPos(), 90, 100, 100)
end

function TestKey2()
    sound.Play(SOUND.lego_yoda_death, player:GetPos(), 90, 100, 70)
end