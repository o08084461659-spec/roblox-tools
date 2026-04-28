-- Utility function to perform network operations with retry logic

local HttpService = game:GetService('HttpService')

local function performNetworkOperation(url, method, data, retries)
    local attempt = 0
    local success, result

    while attempt < retries do
        attempt = attempt + 1
        success, result = pcall(function()
            return HttpService:RequestAsync({
                Url = url,
                Method = method,
                Body = HttpService:JSONEncode(data),
                Headers = {['Content-Type'] = 'application/json'}
            })
        end)

        if success and result.Success then
            return result.Body
        elseif not success then
            warn('Network error: ' .. tostring(result))
        else
            warn('Attempt ' .. attempt .. ' failed: ' .. tostring(result.StatusCode))
        end

        wait(1)  -- Wait before retrying
    end

    error('Network operation failed after ' .. retries .. ' attempts')
end

return {
    performNetworkOperation = performNetworkOperation
}