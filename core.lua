-- Main processing loop for Roblox tools

local function validateInput(input)
    if type(input) ~= 'string' then
        return false, 'Input must be a string.'
    end
    if input:match('^[%w%s]+$') == nil then
        return false, 'Input contains invalid characters.'
    end
    return true
end

local function processInput(input)
    local isValid, errorMsg = validateInput(input)
    if not isValid then
        warn('Input validation failed: ' .. errorMsg)
        return
    end

    print('Processing input: ' .. input)
    -- Insert input processing logic here
end

while true do
    local userInput = io.read()  -- Simulate user input in a loop
    processInput(userInput)
end
