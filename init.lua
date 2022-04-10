function OnModPreInit()
	
end

function OnModInit()
    
end

function OnModPostInit()
	
end

function OnPlayerSpawned( player_entity ) 

end


local summon_egg_frog_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_frog_enabled")
local summon_egg_tappura_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_tappura_enabled")
local summon_egg_support_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_support_enabled")
local summon_egg_passive_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_passive_enabled")
local summon_egg_hamis_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_hamis_enabled")
local summon_egg_bigslime_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_bigslime_enabled")
local summon_egg_skull_enabled = ModSettingGet("dextrome_summon_spells.summon_egg_skull_enabled")

--ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_elemental.lua")
ModLuaFileAppend( "data/scripts/item_spawnlists.lua", "mods/dextrome_summon_spells/files/scripts/inject_eggs.lua")
if summon_egg_frog_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_frog.lua") end
if summon_egg_tappura_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_tappura.lua") end
if summon_egg_support_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_support.lua") end
if summon_egg_passive_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_passive.lua") end
if summon_egg_hamis_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_hamis.lua") end
if summon_egg_bigslime_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_bigslime.lua") end
if summon_egg_skull_enabled == true then ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/dextrome_summon_spells/files/scripts/summon_egg_skull.lua") end
--ModTextFileSetContent("data/entities/particles/charm.xml","mods/dextrome_summon_spells/data/entities/particles/charm.xml")
--ModTextFileSetContent("data/entities/misc/effect_charm.xml","mods/dextrome_summon_spells/data/entities/misc/effect_charm.xml")
--ModTextFileSetContent("data/entities/misc/effect_charm_short.xml","mods/dextrome_summon_spells/data/entities/misc/effect_charm_short.xml")

--dofile_once("mods/dextrome_summon_spells/files/scripts/applymodsettings.lua")


function OnModSettingsChanged() 

end


print("mod initialization done")