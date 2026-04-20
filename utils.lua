-- Utility functions for Roblox tools

local Utils = {}

-- Generate a random number within a range
function Utils.randomInRange(min, max)
    return math.random(min, max)
end

-- Check if a value is a number
function Utils.isNumber(value)
    return type(value) == 'number'
end

-- Clamp a number between a minimum and maximum
function Utils.clamp(value, min, max)
    return math.max(min, math.min(value, max))
end

-- Shuffle a table randomly
function Utils.shuffle(t)
    local shuffled = {}
    for i, v in pairs(t) do
        local j = Utils.randomInRange(1, i)
        shuffled[i], shuffled[j] = shuffled[j], v
    end
    return shuffled
end

-- Convert a vector3 to a string format
function Utils.vector3ToString(vec)
    return string.format('%.2f, %.2f, %.2f', vec.X, vec.Y, vec.Z)
end

-- Check if a table is empty
function Utils.isTableEmpty(t)
    return next(t) == nil
end

return Utils
