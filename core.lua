-- Utility function to handle retries for network operations
local function retryNetworkOperation(operation, retries, delay)
    local success, result
    local attempts = 0
    
    while attempts < retries do
        success, result = pcall(operation)
        if success then
            return result
        end
        attempts = attempts + 1
        print(string.format("Attempt %d failed: %s. Retrying in %d seconds...", attempts, result, delay))
        wait(delay)
    end
    error(string.format("All %d attempts failed.", retries))
end

-- Example usage of retry logic
local function fetchDataFromServer()
    return game.HttpService:GetAsync("https://example.com/data")
end

local function performNetworkTask()
    local retries = 3
    local delay = 2
    local data = retryNetworkOperation(fetchDataFromServer, retries, delay)
    print("Data fetched successfully:", data)
end

performNetworkTask()