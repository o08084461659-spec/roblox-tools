-- Utility functions for Roblox 

local Utils = {}

-- Safely retrieve table value with error handling
function Utils.safeGet(table, key)
    if type(table) ~= 'table' then
        error('First argument must be a table')
    end
    if table[key] == nil then
        return 'Key does not exist in table'
    end
    return table[key]
end

-- Function to add elements to a table with error handling
function Utils.safeAdd(table, value)
    if type(table) ~= 'table' then
        error('First argument must be a table')
    end
    if value == nil then
        error('Value cannot be nil')
    end
    table[#table + 1] = value
end

-- Safe snippet to combine two tables
function Utils.safeMerge(table1, table2)
    if type(table1) ~= 'table' or type(table2) ~= 'table' then
        error('Both arguments must be tables')
    end
    for key, value in pairs(table2) do
        table1[key] = value
    end
end

-- Example usage: Utility for logging with error handling
function Utils.safeLog(message)
    if type(message) ~= 'string' then
        error('Log message must be a string')
    end
    print(os.date('%Y-%m-%d %H:%M:%S') .. ' - ' .. message)
end

return Utils