# Player's name

We want to know the player's name when he connects to the server, for that
lets use the [Query Alert](soonTm) to say hello to the world !

## Creating the Query Alert
We want to create the Query Alert with a title and an explanation of what we are going to ask the user

Import the package on the top of your script 
```lua
Package.RequirePackage("trunks-nanos")
```

And Create a [Query Alert](soonTm)
```lua
local plyNameAlert = Trunks:New("QueryAlert")
```

Unlike in the HelloWorld tutorial, we are going to use the chaining method to declare some of our component properties to make the code a bit smaller

Using this method, we can specify everything when we initialize the variable:
```lua
local plyNameAlert = Trunks:New("QueryAlert")
        :SetTitle("Who are you ?")
        :SetSize(250, 300)
        :SetText("John doe")
```

Remember to ask for the players mouse using `Client.SetMouseEnabled(true)`

The code of the whole script should look like this:
```lua
Package.RequirePackage("trunks-nanos")

Client.SetMouseEnabled(true)
local plyNameAlert = Trunks:New("QueryAlert")
        :SetTitle("Who are you ?")
        :SetSize(250, 300)
        :SetText("John doe")
```

In the end this gives us a nice alert with a text input:
![Hello world alert](../images/playersName/pn1.PNG)

## Getting the player name when he clicks Ok
Exactly like the HelloWorld example, we need to specify an `OnClickOk` function to the alert but this time we are retreiving the playerName
```lua
plyNameAlert.OnClickOk = function()
    local playerName = plyNameAlert:Value()
    Package.Log("Players name : "..playerName)

    plyNameAlert:Hide()
    Client.SetMouseEnabled(false)
end 
```

Like before we also close the Alert and then give back the mouse to the player.

We don't want the player to be able to validate without entering a name so in case the value is `nil` we stop the execution of the rest of the function:
```lua
    if (playerName == nil) then return end
```

Giving this final script:
```lua
plyNameAlert.OnClickOk = function()
    local playerName = plyNameAlert:Value()
    if (playerName == nil) then return end
    Package.Log("Players name : "..playerName)
    plyNameAlert:Hide()
    Client.SetMouseEnabled(false)
end
```

Going further, you could for example send the value to the server so that the server can register it in a database for example
```lua
plyNameAlert.OnClickOk = function()
    local playerName = plyNameAlert:Value()
    if (playerName == nil) then return end
    Package.Log("Players name : "..playerName)
    plyNameAlert:Hide()
    Client.SetMouseEnabled(false)
    Events.CallRemote("PlayerName", playerName)
end
```
