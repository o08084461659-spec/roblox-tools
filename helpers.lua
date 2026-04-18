-- Utility function to find the maximum value in a table
local function findMaxValue(t)
    local maxVal = t[1]
    for i = 2, #t do
        if t[i] > maxVal then
            maxVal = t[i]
        end
    end
    return maxVal
end

-- Utility function to calculate the average of a table
local function calculateAverage(t)
    local sum = 0
    for _, v in ipairs(t) do
        sum = sum + v
    end
    return sum / #t
end

-- Utility function to filter a table based on a condition
local function filterTable(t, condition)
    local result = {}
    for _, v in ipairs(t) do
        if condition(v) then
            table.insert(result, v)
        end
    end
    return result
end

-- Better error handling for string manipulation
local function safeStringManipulation(str, func)
    if type(str) ~= 'string' then
        error('Expected a string for manipulation')
    end
    return func(str)
end

return {
    findMaxValue = findMaxValue,
    calculateAverage = calculateAverage,
    filterTable = filterTable,
    safeStringManipulation = safeStringManipulation
}