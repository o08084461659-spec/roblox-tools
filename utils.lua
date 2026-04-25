-- Retry logic for network operations

local HttpService = game:GetService('HttpService')

local function performRequest(url, method, retries, delay)
    local attempt = 0
    local response, errorMessage

    while attempt < retries do
        attempt = attempt + 1
        
        local success, result = pcall(function()
            return HttpService:RequestAsync({
                Url = url,
                Method = method,
                Headers = {['Content-Type'] = 'application/json'}
            })
        end)
        
        if success and result.Success then
            return result.Body
        else
            errorMessage = result or 'Unknown error'
            print('Attempt ' .. attempt .. ' failed: ' .. errorMessage)
            wait(delay)
        end
    end
    
    error('All retry attempts failed: ' .. errorMessage)
end

return {
    performRequest = performRequest
}