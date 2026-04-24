-- Input validation helper functions

local function isValidInput(input)
    if type(input) ~= "string" then
        return false, "Input must be a string"
    elseif #input == 0 then
        return false, "Input cannot be empty"
    end
    return true, nil
end

local function processInput(input)
    local isValid, errMsg = isValidInput(input)
    if not isValid then
        error(errMsg)
    end
    -- Process the valid input
    print("Processing input: " .. input)
    -- Add additional processing logic here
end

-- Main processing loop
local function mainLoop(inputs)
    for _, input in ipairs(inputs) do
        local success, err = pcall(processInput, input)
        if not success then
            print("Error processing input: " .. err)
        end
    end
end

return {
    mainLoop = mainLoop,
    isValidInput = isValidInput
}