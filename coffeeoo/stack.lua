local class = require("coffeeoo.class")

local stack = class.create("Stack")

function stack.__new(self, vals)
	self.__values = {}
	self.__index = 0

	if vals == nil then
		vals = {}
	end

	for _,v in ipairs(vals) do
		self:push(v)
	end
end

function stack:push(val)
	self.__index = self.__index + 1
	self.__values[self.__index] = val
end

function stack:pop(val)
	if self.__index < 1 then
		return nil
	end
	local output = self.__values[self.__index]
	self.__values[self.__index] = nil
	self.__index = self.__index - 1
	return output
end

function stack:empty()
	return self.__index == 0
end

-- __len doesn't work in lua 5.1
function stack:len()
	return self.__index
end

function stack:values()
	local output = {}
	for i,v in ipairs(self.__values) do
		output[i] = v
	end
	return output
end

function stack:__tostring()
	local strings = {}
	for i, val in ipairs(self.__values) do
		if type(val) == "string" then
			strings[i] = ("%q"):format(val)
		else
			strings[i] = tostring(val)
		end
	end
	return ("stack: {%s}"):format(table.concat(strings, ', '))
end

return stack
