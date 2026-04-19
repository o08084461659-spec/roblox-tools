-- Helper Functions for Common Roblox Operations

local Helpers = {}

-- Function to get a player by username
function Helpers.getPlayerByUsername(username)
    local players = game:GetService("Players")
    for _, player in ipairs(players:GetPlayers()) do
        if player.Name:lower() == username:lower() then
            return player
        end
    end
    return nil
end

-- Function to add a new part to the workspace
function Helpers.createPart(size, position, color)
    local part = Instance.new("Part")
    part.Size = size or Vector3.new(4, 1, 2)
    part.Position = position or Vector3.new(0, 5, 0)
    part.Color = color or Color3.new(1, 0, 0)
    part.Anchored = true
    part.Parent = workspace
    return part
end

-- Function to play a sound from a given asset ID
function Helpers.playSound(assetId, volume)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid:" .. tostring(assetId)
    sound.Volume = volume or 1
    sound:Play()
    return sound
end

return Helpers
