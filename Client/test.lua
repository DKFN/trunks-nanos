require('TrunksComponents.lua')

function test()
    Package.Log("Test log")

    local testBtn = {
        id = "myBtn",
        component = "Button",
        text = "Hello nanos from Lua via JSON !",
        position = {
            positionType = "absolute",
            posX = 0,
            posY = 0
        }
    }
    trunksWindow:CallEvent("TRUNKS_ADD_COMPONENT", JSON.stringify(testBtn))
    Package.Log("Trunks window")

    local myBtn = Trunks:New("Button")
    myBtn:SetPosX(200)
    myBtn:SetPosX(400)
    myBtn:SetText("Hello from LUA via OOP !")
    myBtn:Show()
end
