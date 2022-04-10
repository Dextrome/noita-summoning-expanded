local nxml = dofile_once("mods/dextrome_summon_spells/files/scripts/nxml.lua")
local content = ModTextFileGetContent("data/entities/particles/charm.xml")
local xml = nxml.parse(content)

for element in xml:each_child() do
  if element.attr.sprite_file == "mods/dextrome_summon_spells/data/particles/charm.xml" then
    print("test")
    print(element.attr.emission_interval_max_frames)

    for attr in element:each_child() do
        print(attr.tostring)

        if attr == "scale.x" then
            print("scale.x found")
        end        
    end
  end
end
ModTextFileSetContent("data/entities/particles/charm.xml", tostring(xml))