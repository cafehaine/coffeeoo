local class = require("coffeeoo.class")

local stone = class.create("Stone")

function stone:__new(coordinates)
	self.__coordinates = coordinates
end

function stone:get_name()
	return "stone"
end

function stone:__tostring()
	return ("%s block at %d %d %d"):format(self:get_name(), self.__coordinates.x, self.__coordinates.y, self.__coordinates.z)
end

function stone:get_texture()
	return "stone.png"
end

return stone
