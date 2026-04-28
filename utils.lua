-- Retry logic for network operations in Roblox
local HttpService = game:GetService('HttpService')

local function retryNetworkOperation(url, method, data, retries, delay)
    local attempts = 0
    local response
    while attempts < retries do
        attempts = attempts + 1
        local success, err = pcall(function()
            if method == 'GET' then
                response = HttpService:GetAsync(url)
            elseif method == 'POST' then
                response = HttpService:PostAsync(url, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
            end
        end)

        if success then
            return HttpService:JSONDecode(response)
        else
            warn('Attempt ' .. attempts .. ' failed: ' .. err)
            wait(delay)
        end
    end
    error('Failed after ' .. attempts .. ' attempts.')
end

return {
    retryNetworkOperation = retryNetworkOperation
}