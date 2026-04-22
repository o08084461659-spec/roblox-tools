-- Utility function to check if a value is in a table
function table.includes(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Utility function to merge two tables
function table.merge(target, source)
    for k, v in pairs(source) do
        if type(v) == 'table' and type(target[k] or false) == 'table' then
            target[k] = table.merge(target[k] or {}, v)
        else
            target[k] = v
        end
    end
    return target
end

-- Utility function to deep clone a table
function table.deepcopy(original)
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == 'table' then
            copy[k] = table.deepcopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

-- Utility function to find the maximum value in a table
function table.max(tbl)
    local maxVal = tbl[1]
    for i = 2, #tbl do
        if tbl[i] > maxVal then
            maxVal = tbl[i]
        end
    end
    return maxVal
end

-- Utility function to format a table as string
function table.tostring(tbl)
    local str = "{"
    for k, v in pairs(tbl) do
        str = str .. tostring(k) .. ": " .. tostring(v) .. ", "
    end
    return str:sub(1, -3) .. "}"
end
