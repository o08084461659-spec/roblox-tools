-- Input validation function
local function isValidInput(input)
    return type(input) == "string" and #input > 0
end

-- Main processing loop
local function mainLoop()
    while true do
        print("Enter a command:")
        local userInput = io.read()

        if isValidInput(userInput) then
            print(string.format("You entered: %s", userInput))
            -- Perform processing here
        else
            print("Invalid input. Please try again.")
        end
    end
end

mainLoop()