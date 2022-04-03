function OnModPreInit()
	
end

function OnModInit()
	
end

function OnModPostInit()
	
end

function OnPlayerSpawned( player_entity ) 

end


ModLuaFileAppend( "data/scripts/item_spawnlists.lua", "mods/dextrome_summon_spells/data/scripts/inject_eggs.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_frog.lua")
--ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_elemental.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_tappura.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_support.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_passive.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_purple.lua")

print("mod initialization done")

