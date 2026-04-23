-- Core Module for Roblox Tools
local Core = {}

-- Table to store performance metrics
Core.metrics = {}

-- Function to track FPS
function Core.trackFPS()
    local lastTime = tick()
    local frameCount = 0
    while true do
        local currentTime = tick()
        frameCount = frameCount + 1
        if currentTime - lastTime >= 1 then
            local fps = frameCount / (currentTime - lastTime)
            table.insert(Core.metrics, fps)
            lastTime = currentTime
            frameCount = 0
        end
        wait(0.03)  -- Yield for a small time
    end
end

-- Function to get average FPS
function Core.getAverageFPS()
    local total = 0
    local count = #Core.metrics
    for _,fps in ipairs(Core.metrics) do
        total = total + fps
    end
    return count > 0 and (total / count) or 0
end

-- Optimize rendering loop
function Core.optimizeRendering()
    local lastCall = tick()
    game:GetService('RunService').RenderStepped:Connect(function()
        if tick() - lastCall >= 0.016 then  -- About 60 FPS
            lastCall = tick()
            -- Place rendering logic here
        end
    end)
end

return Core
