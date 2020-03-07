print("==> Set tests...")

local Set = require("coffeeoo.set")

local set = Set.new()
assert(set:contains(1) == false)
assert(set:len() == 0)
set:add(1)
assert(set:contains(1) == true)
assert(set:len() == 1)

print("==> Stack tests...")

local Stack = require("coffeeoo.stack")

local stack = Stack.new()
assert(stack:len() == 0)
stack:push(1)
assert(stack:len() == 1)
assert(stack:pop() == 1)
assert(stack:len() == 0)

print("==> All tests passed.")
