local Stone = require("stone")
local Andesite = require("andesite")

local stone = Stone.new({x=10, y=10, z=10})
local andesite = Andesite.new({x=10, y=11, z=10})

print(stone)
print(andesite)

print(stone:get_texture())
print(andesite:get_texture())
