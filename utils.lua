-- Function to perform a network operation with retry logic
local function performNetworkOperation(url, retries, delay)
    local attempts = 0
    local success, response

    while attempts < retries do
        success, response = pcall(function()
            return game:GetService('HttpService'):GetAsync(url)
        end)

        if success then
            return response
        else
            attempts = attempts + 1
            print('Attempt ' .. attempts .. ' failed: ' .. response)
            wait(delay)
        end
    end

    error('Network operation failed after ' .. attempts .. ' attempts')
end

return {
    performNetworkOperation = performNetworkOperation,
}