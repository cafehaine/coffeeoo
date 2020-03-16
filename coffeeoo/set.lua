--- A way to store unique values
-- @module coffeeoo.set
-- @alias Set

local class = require("coffeeoo.class")

--- The set class
-- @type Set
local Set = class.create("Set")

--- Instantiate a new set
-- @function new
-- @tparam[opt] table vals initial values
-- @treturn Set a new set
function Set.__new(self, vals)
	self.__values = {}
	self.__count = 0

	if vals == nil then
		vals = {}
	end

	for _,v in ipairs(vals) do
		self:add(v)
	end
end

--- Check if a value is contained in this set
-- @param val the value
-- @treturn bool is the value present
function Set:contains(val)
	return self.__values[val] == true
end

--- Add a value to this set
-- @param val the value
function Set:add(val)
	if not self.__values[val] then
		self.__values[val] = true
		self.__count = self.__count + 1
	end
end

--- Remove a value from this set
-- @param val the value
function Set:remove(val)
	if self.__values[val] then
		self.__values[val] = nil
		self.__count = self.__count - 1
	end
end

--- Return if the set is empty
-- @treturn bool is the set empty
function Set:empty()
	return self.__count == 0
end

--- Return the number of elements in this set
-- @treturn int the number of elements
function Set:__len()
	return self.__count

--- Return the number of elements in this set
-- This is an alias for __len, as lua 5.1 doesn't support this metamethod.
-- @treturn int the number of elements
function Set:len()
	return self:__len()
end

--- Generate a table containing all the values of this set
-- @treturn table the values in this set
function Set:values()
	local output = {}
	local index = 1
	for val, b in pairs(self.__values) do
		output[index] = val
		index = index + 1
	end
	return output
end

--- Generate a string representation of this set
-- @treturn string
function Set:__tostring()
	local strings = {}
	for i, val in ipairs(self:values()) do
		if type(val) == "string" then
			strings[i] = ("%q"):format(val)
		else
			strings[i] = tostring(val)
		end
	end
	return ("Set: {%s}"):format(table.concat(strings, ', '))
end

return Set
