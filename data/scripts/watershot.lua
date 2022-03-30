table.insert( actions,
{
	id          = "WATERSHOT",
	name 		= "water shot",
	description = "water shot...",
	sprite 		= "data/ui_gfx/gun_actions/acidshot.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/acidshot_unidentified.png",
	related_projectiles	= {"mods/dextrome_summon_spells/data/entities/projectiles/watershot.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4", -- WATERSHOT
	spawn_probability                 = "1,1,1,1", -- WATERSHOT
	price = 180,
	mana = 20,
	max_uses = 20,
	custom_xml_file = "data/entities/misc/custom_cards/acidshot.xml",
	action 		= function()
		add_projectile("data/entities/projectiles/watershot.xml")
		c.fire_rate_wait = c.fire_rate_wait + 10
	end,
} )
