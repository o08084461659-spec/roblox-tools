-- Utility functions for common operations

local Utils = {}

-- Function to merge two tables
function Utils.mergeTables(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        if type(v) == 'table' and type(result[k]) == 'table' then
            result[k] = Utils.mergeTables(result[k], v)
        else
            result[k] = v
        end
    end
    return result
end

-- Function to deep clone a table
function Utils.deepClone(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[Utils.deepClone(orig_key)] = Utils.deepClone(orig_value)
        end
        setmetatable(copy, Utils.deepClone(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Function to check if a table is empty
function Utils.isTableEmpty(t)
    return next(t) == nil
end

-- Function to find a value in an array
function Utils.findValue(array, value)
    for index, v in ipairs(array) do
        if v == value then
            return index
        end
    end
    return nil
end

return Utils
