dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local components = EntityGetComponent( entity_id, "VariableStorageComponent" )
local entity_list_name = "monsters"

if ( components ~= nil ) then
	for key,comp_id in pairs(components) do
		local var_name = ComponentGetValue( comp_id, "name" )
		if ( var_name == "entity_list" ) then
			entity_list_name = ComponentGetValue( comp_id, "value_string" )
		end
	end
end

local entity_lists = 
{
elemental = { {"watershooter"}, {"watershooter", 2} },
skull = { {"waterskull"}, {"fireskull"} },
hamis = { {"hamis", 2}, {"hamis", 2}, {"hamis", 3}, {"hamis", 3}, {"hamis", 3}, {"hamis", 3}, {"hamis", 4}, {"hamis", 4},{"hamis", 5}, {"hamis", 6} },
}

SetRandomSeed( x - 437, y + 235)
local options = entity_lists[entity_list_name]
local opts = #options
local rnd = 1

for i=1,3 do
    rnd = Random(1,999999)
end

rnd = Random(1,opts)
local entity_to_spawn = options[rnd][1] or "watershooter"
local entity_count = options[rnd][2] or 1

local option = "mods/dextrome_summon_spells/files/animals/" .. entity_to_spawn .. ".xml"

GamePlaySound( "data/audio/Desktop/projectiles.bank", "player_projectiles/egg/hatch", x, y )

for j=1,entity_count do
	local eid = EntityLoad( option, x, y )
	
	local herd_id
	local players = EntityGetWithTag( "player_unit" )
	if ( #players > 0 ) then
		local p = players[1]
		
		edit_component( p, "GenomeDataComponent", function(comp,vars)
			herd_id = ComponentGetValue2( comp, "herd_id" )
		end)
	end	
	
	local charm_component = GetGameEffectLoadTo( eid, "CHARM", true )
	if( charm_component ~= nil ) then
		ComponentSetValue( charm_component, "frames", -1 )
	end

	-- so that hatched enemies don't drop gold
	local lua_components = EntityGetComponent( eid, "LuaComponent")
	if( lua_components ~= nil ) then
		for i,lua_comp in ipairs(lua_components) do
			if( ComponentGetValue( lua_comp, "script_death") == "data/scripts/items/drop_money.lua" ) then
				-- this crashes the game, so let's just set this to NULL
				-- EntityRemoveComponent( eid, lua_comp )
				ComponentSetValue( lua_comp, "script_death", "" )
			end
		end
	end

	local damagemodels = EntityGetComponent( eid, "DamageModelComponent" )
	if( damagemodels ~= nil ) then
		for i,damagemodel in ipairs(damagemodels) do
			local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) )
				max_hp = max_hp * 4.0
			
			ComponentSetValue( damagemodel, "max_hp", max_hp )
			ComponentSetValue( damagemodel, "hp", max_hp )
		end
	end
	
	if ( herd_id ~= nil ) then
		edit_component( eid, "GenomeDataComponent", function(comp,vars)
			ComponentSetValue2( comp, "herd_id", herd_id )
		end)
	end
end