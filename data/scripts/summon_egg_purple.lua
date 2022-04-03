table.insert( actions,
{
	id          = "SUMMON_EGG_HAMIS",
	name 		= "Summon Hamis Egg",
	description = "Summons an egg that houses Hamis, lots of Hamis!",
	sprite 		= "data/ui_gfx/gun_actions/summon_egg.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/bomb_unidentified.png",
	related_projectiles	= {"data/entities/items/pickup/egg_monster.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4,5,6", -- SUMMON_EGG
	spawn_probability                 = "1.1,1.0,1.0,0.9,0.9,0.9,0.9", -- SUMMON_EGG
	price = 69,
	mana = 69, 
	max_uses    = 20, 
	action 		= function()
		--SetRandomSeed( GameGetFrameNum(), GameGetFrameNum() )
		--local types = {"monster","slime","red","fire"}
		--local rnd = Random(1, #types)
		--local egg_name = "egg_" .. tostring(types[rnd]) .. ".xml"
		add_projectile("mods/dextrome_summon_spells/data/entities/items/pickup/egg_hamis.xml")
	end,
} )
