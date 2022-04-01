function OnModPreInit()
	
end

function OnModInit()
	
end

function OnModPostInit()
	
end

function OnPlayerSpawned( player_entity ) 

end

ModTextFileSetContent("data/scripts/item_spawnlists.lua","mods/dextrome_summon_spells/data/scripts/item_spawnlists.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_frog.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_elemental.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_tappura.lua")
--ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/data/scripts/summon_egg_support.lua")

print("mod initialization done")

