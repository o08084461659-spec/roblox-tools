# Roblox Tools

A set of powerful utilities designed to enhance the development experience in Roblox using Lua. This project provides essential functions and tools to streamline game creation and improve performance in your Roblox projects. 

## Features

- **Custom Logger**: A robust logging system that allows developers to track game events and debug issues efficiently.
- **Player Data Management**: Simplified APIs to easily save, load, and manipulate player data using DataStore.
- **Remote Event Handlers**: Pre-built templates for handling remote events effectively, reducing boilerplate code.
- **User Interface Helpers**: Tools for managing UI elements such as animations, transitions, and responsiveness, enhancing player interaction.

## Installation

To install **roblox-tools** in your Roblox environment, run the following commands in your terminal:

```bash
git clone https://github.com/Developer/roblox-tools.git
cd roblox-tools
```

Once cloned, you can simply place the `roblox-tools` folder into your Roblox Studio project. Ensure all dependencies are met according to the documentation included in the repository. 

## Basic Usage Example

Here's how to implement the custom logger in your game:

```lua
local Logger = require(game.ServerScriptService.RobloxTools.Logger)

Logger.Info("Game started!", "MainModule")

-- Player join event
game.Players.PlayerAdded:Connect(function(player)
    Logger.Success(player.Name .. " has joined the game.")
end)
```

Utilize the player data management feature as follows:

```lua
local PlayerData = require(game.ServerScriptService.RobloxTools.PlayerData)

PlayerData.Save(player.UserId, {Coins = 100, Level = 1})

PlayerData.Load(player.UserId):andThen(function(data)
    print("Loaded Data: " .. tostring(data))
end)
```

## License

![MIT License](https://img.shields.io/badge/license-MIT-green)

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.