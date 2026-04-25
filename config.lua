-- Config module for Roblox tools

---@class Config
local Config = {}

--- The default settings for the tools
---@type table
Config.Defaults = {
    sensitivity = 0.5,
    volume = 1.0,
    brightness = 0.8,
    keyBindings = {
        jump = Enum.KeyCode.Space,
        interact = Enum.KeyCode.E,
        inventory = Enum.KeyCode.I
    }
}

--- Initialize the configuration with custom settings
---@param customSettings table
function Config.initialize(customSettings)
    for key, value in pairs(customSettings) do
        if Config.Defaults[key] ~= nil then
            Config.Defaults[key] = value
        end
    end
end

--- Retrieve the current configuration settings
---@return table
function Config.getSettings()
    return Config.Defaults
end

return Config
