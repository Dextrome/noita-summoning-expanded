function OnModPreInit()
	
end

function OnModInit()
	
end

function OnModPostInit()
	
end

function OnPlayerSpawned( player_entity ) 

end

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_frog.lua")
ModLuaFileAppend( "data/scripts/items/egg_hatch.lua", "mods/dextrome_summon_spells/data/scripts/egg_frog.lua")

print("mod initialization done")

