-- Initialize the Roblox tools module
local tools = {}

-- Function to create a new tool
function tools.createTool(name, properties)
    local tool = Instance.new("Tool")
    tool.Name = name
    for prop, value in pairs(properties) do
        tool[prop] = value
    end
    return tool
end

-- Function to setup tool events
function tools.setupToolEvents(tool)
    tool.Activated:Connect(function()
        print(tool.Name .. " activated!")
    end)
end

-- Function to initialize all tools
function tools.initializeTools()
    local toolsList = {"Sword", "Axe", "Pickaxe"}
    for _, toolName in ipairs(toolsList) do
        local tool = tools.createTool(toolName, {ToolTip = "A powerful tool!", CanBeDropped = true})
        tools.setupToolEvents(tool)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
end

-- Binds the initialization to the PlayerAdded event
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait()
    tools.initializeTools()
end)

return tools
