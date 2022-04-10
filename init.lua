function OnModPreInit()
	
end

function OnModInit()
    
end

function OnModPostInit()
	
end

function OnPlayerSpawned( player_entity ) 

end

--ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_elemental.lua")
ModLuaFileAppend( "data/scripts/item_spawnlists.lua", "mods/dextrome_summon_spells/files/scripts/inject_eggs.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_frog.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_tappura.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_support.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_passive.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_hamis.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_skull.lua")
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_bigslime.lua")
--ModTextFileSetContent("data/entities/particles/charm.xml","mods/dextrome_summon_spells/data/entities/particles/charm.xml")
--ModTextFileSetContent("data/entities/misc/effect_charm.xml","mods/dextrome_summon_spells/data/entities/misc/effect_charm.xml")
--ModTextFileSetContent("data/entities/misc/effect_charm_short.xml","mods/dextrome_summon_spells/data/entities/misc/effect_charm_short.xml")
print("mod initialization done")

