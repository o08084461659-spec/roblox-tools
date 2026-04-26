-- Utility function to handle Roblox data
local HttpService = game:GetService('HttpService')

local function serializeToJson(data)
    return HttpService:JSONEncode(data)
end

local function deserializeFromJson(jsonString)
    return HttpService:JSONDecode(jsonString)
end

local function saveDataToStore(data, key)
    local jsonData = serializeToJson(data)
    local success, err = pcall(function()
        -- Example of storing in a module variable, can be enhanced
        local storage = require(game.ServerStorage:WaitForChild('DataStore'))
        storage[key] = jsonData
    end)
    if not success then
        warn('Error saving data: ' .. err)
    end
end

local function loadDataFromStore(key)
    local storage = require(game.ServerStorage:WaitForChild('DataStore'))
    local jsonData = storage[key]
    if jsonData then
        return deserializeFromJson(jsonData)
    else
        warn('No data found for key: ' .. key)
        return nil
    end
end

return {
    saveDataToStore = saveDataToStore,
    loadDataFromStore = loadDataFromStore,
    serializeToJson = serializeToJson,
    deserializeFromJson = deserializeFromJson,
}