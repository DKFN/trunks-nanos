## Welcome to TRUNKS for nanos docs !

Trunks is a small GUI kit that lets you create GUI using only Lua

This repository contains the implementation specific to [Nanos World](https://nanos.world/) game

Do not hesitate to contact me if you encounter any problem via discord:
DeadlyKungFu.Ninja#8294 or via Nanos World discord

### Installation

Download the repository content and add it to your packages

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

- [Hello world](https://dkfn.github.io/trunks-nanos/tuts/helloWorld)
- <strike> [Your first GUI](https://dkfn.github.io/trunks-nanos/tuts/gui1) </strike>
- <strike> [Your first complex GUI](https://dkfn.github.io/trunks-nanos/tuts/gui2) </strike>
- <strike> [Displaying images](https://dkfn.github.io/trunks-nanos/tuts/images) </strike>
- <strike> [Customize the default theme](https://dkfn.github.io/trunks-nanos/tuts/customizecss) </strike>
- <strike> [Import custom fonts](https://dkfn.github.io/trunks-nanos/tuts/customizefonts) </strike>

#### API Specifications
- [Components complete list](https://dkfn.github.io/trunks-nanos/componentslist)

-- TODO
