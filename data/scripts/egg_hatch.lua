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
monsters = { {"zombie"}, {"zombie"}, {"zombie"}, {"zombie", 2}, {"zombie", 2}, {"zombie", 2}, {"zombie", 2}, {"zombie", 2}, {"zombie", 2}, {"zombie", 3} },
slimes = { {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic"}, {"slimeshooter_nontoxic", 2}, {"slimeshooter_nontoxic", 2}, {"slimeshooter_nontoxic", 2}, {"acidshooter"} },
fire = { {"firebug"}, {"firebug"}, {"firebug", 2}, {"firebug", 2}, {"firebug", 2}, {"firebug", 3}, {"firebug", 3}, {"firebug", 3}, {"firebug", 3}, {"bigfirebug"} },
red = { {"bat"}, {"bat", 2}, {"bat", 2}, {"bat", 2}, {"bat", 2}, {"bat", 3}, {"bat", 4}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler"} },
chilly = { {"tentacler_small"}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler_small"}, {"tentacler"}, {"tentacler"}, {"tentacler"} },
purple = { {"longleg", 2}, {"longleg", 2}, {"longleg", 3}, {"longleg", 3}, {"longleg", 3}, {"longleg", 3}, {"longleg", 3}, {"longleg", 4},{"longleg", 5}, {"longleg", 6} },
worms = { {"worm_tiny"}, {"worm_tiny"}, {"worm_tiny"}, {"worm_tiny"}, {"worm_tiny"}, {"worm"}, {"worm"}, {"worm"}, {"worm_big"}, {"worm_big"} },
frogs = { {"frog"}, {"frog"}, {"frog"}, {"frog"}, {"frog"}, {"frog"}, {"frog"}, {"frog", 2}, {"frog", 2}, {"frog_big"} },
tappura = { {"miner_weak"}, {"miner_weak"}, {"miner_weak"}, {"miner_weak"}, {"miner_weak"}, {"miner_weak"}, {"miner"}, {"miner"}, {"miner_fire"}, {"miner_chef"} },
support = { {"coward"}, {"scavenger_shield"}, {"scavenger_invis"}, {"scavenger_heal"}, {"scavenger_heal"}, {"scavenger_heal"}, {"scavenger_invis"}, {"scavenger_shield"}, {"coward"}, {"healerdrone_physics"} },
}

SetRandomSeed( x - 437, y + 235 )

local options = entity_lists[entity_list_name]
--local opts = #options

local rnd = 1

--math.randomseed(os.time())
--math.random(); math.random(); math.random()

for i=1,6 do
    rnd = Random(1,10)
	--print(rnd)
end
--for i=1,opts do
--	rnd = math.min(rnd + math.min(math.max(Random(1, 8) - 7, 0), 1), opts)
--end


local entity_to_spawn = options[rnd][1] or "zombie"
local entity_count = options[rnd][2] or 1

local option = "data/entities/animals/" .. entity_to_spawn .. ".xml"

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
	
	if ( entity_list_name ~= "worms" ) then
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
end