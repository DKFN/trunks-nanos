## Welcome to TRUNKS for nanos docs !

Trunks is a small GUI kit that lets you create GUI using only Lua

This repository contains the implementation specific to [Nanos World](https://nanos.world/) game

Do not hesitate to contact me if you encounter any problem via discord:
DeadlyKungFu.Ninja#8294 or via Nanos World discord

### Installation

You will need two packages to use Trunks in nanos world
- [trunks-nanos](https://github.com/DKFN/trunks-nanos) : The Lua API for Nanos world
- [trunks-nanos-core](https://github.com/DKFN/trunks-nanos-core) : The built version of the GUI and some javascript adapters for the game

In the end, your package folder should look like this:

-- Insert image of script

Finally, add  `trunks-nanos` in your script's `Package.toml`
```toml
packages_requirements = [
    "trunks-nanos"
]
```

### Usage
To use Trunks you must require the package like this:
```lua
Package.RequirePackage("trunks-nanos")
```

After that you will have access to two globals `Trunks` and `trunksWindow` and you can start creating some components
```lua
Package.RequirePackage("trunks-nanos")

local mySuperButton = Trunks:New("Button")
mySuperButton:SetPosX(500)
mySuperButton:SetPosY(500)
mySuperButton:SetText("Hello World !")
```

Launch your server and you should see a button in your screen with `Hello World !` written on it :)

### Going further 

Now that you have everything up and running you can go further with:

#### Tutorials
-- TODO

#### API Specifications
-- TODO
