-- Configuration Loader with Defaults
local Config = {}

function Config.loadDefaults()
    return {
        volume = 0.5,
        graphicsQuality = 3,
        language = 'en',
        showHints = true,
    }
end

function Config.loadCustom(filePath)
    local customConfig = {}
    local success, err = pcall(function()
        local file = io.open(filePath, 'r')
        if not file then error('Could not open config file') end
        customConfig = game:GetService('HttpService'):JSONDecode(file:read('*a'))
        file:close()
    end)
    if not success then
        warn('Loading custom config failed: ' .. err)
        return Config.loadDefaults()
    end
    return customConfig
end

function Config.mergeDefaults(custom)
    local defaults = Config.loadDefaults()
    for key, value in pairs(custom) do
        defaults[key] = value
    end
    return defaults
end

function Config.load(filePath)
    local customConfig = Config.loadCustom(filePath)
    return Config.mergeDefaults(customConfig)
end

return Config