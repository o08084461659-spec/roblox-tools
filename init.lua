-- Initialize Roblox services
local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

-- Error handling function
local function handleError(err)
    warn('Error occurred: ' .. tostring(err))
end

-- Function to safely get player
local function getPlayerByName(name)
    local player = Players:FindFirstChild(name)
    if not player then
        handleError('Player not found: ' .. name)
        return nil
    end
    return player
end

-- Function to clone an item safely
local function cloneItem(itemName)
    local item = ReplicatedStorage:FindFirstChild(itemName)
    if not item then
        handleError('Item not found: ' .. itemName)
        return nil
    end
    return item:Clone()
end

-- Example of use
local function spawnItemForPlayer(playerName, itemName)
    local player = getPlayerByName(playerName)
    if player then
        local newItem = cloneItem(itemName)
        if newItem then
            newItem.Parent = player.Backpack
            print('Item spawned for ' .. playerName)
        end
    end
end

-- Test the function with error handling
spawnItemForPlayer('NonExistentPlayer', 'Sword')
spawnItemForPlayer('ExistingPlayer', 'NonExistentItem')
spawnItemForPlayer('ExistingPlayer', 'Sword')
