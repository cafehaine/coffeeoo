local class = require("coffeeoo.class")
local super = require("stone")

local andesite = class.create("Andesite", super)

--[[ Not necessary as we don't add any attributes
function andesite:__new(...)
	super.__new(self, ...)
end
]]

function andesite:get_name()
	return "andesite"
end

function andesite:get_texture()
	return "andesite.png"
end

return andesite
