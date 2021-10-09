require("utils/lodash.lua")
require "WebUI.lua"

Trunks = {}

local ComponentsLists = {}

local lastId = 1

local availableComponents = { "Box", "Button" }

-- Factory
function Trunks:New(componentType, maybeOptions)
    local newComponent = {}

    -- Error handling
    -- Who cares ? \o/

    -- Assigning base parameters
    newComponent.data = {}
    newComponent.data.id = lastId
    lastId = lastId + 1
    newComponent.data.component = componentType

    -- Intializing component
    newComponent.data.position = {
        positionType = "absolute"
    }
    newComponent.data.styling = {}

    -- Sending to renderer
    trunksWindow:CallEvent("TRUNKS_ADD_COMPONENT", JSON.stringify(newComponent.data))

    -- Internals (or not but its at your own risks :D)
    newComponent.__update = function(self)
        local value = JSON.stringify(self.data)
        Package.Log("Sending for updating " .. value)
        trunksWindow:CallEvent("TRUNKS_UPDATE_COMPONENT", value)
    end
    -- End internals

    -- TODO: Split functions depending of component
    -- Getters and setters boilerplate
        --Positionning
        newComponent.SetPosX = function(self, x)
            self.data.position.posX = x
            self.__update(self)
        end

        newComponent.SetPosY = function(self, y)
            self.data.position.posY = y
            self.__update(self)
        end

        newComponent.SetWidth = function(self, width)
            self.data.position.width = width
            self.__update(self)
        end

        newComponent.SetHeight = function(self, height)
            self.data.position.height = height
            self.__update(self)
        end

        -- Styling
        newComponent.SetColorStyle = function(self, color)
            self.data.styling.color = color
            self.__update(self)
        end

        newComponent.SetProportion = function(self, prop)
            self.data.styling.proportion = prop
            self.__update(self)
        end

        newComponent.SetFullWidth = function(self, fw)
            self.data.styling.isFullWidth = fw
            self.__update(self)
        end

        -- Component properties
        -- Inputs
        newComponent.SetText = function(self, text)
            self.data.text = text
            self.__update(self)
        end

        newComponent.SetMaxValue = function(self, mv)
            self.data.maxValue = mv
            self.__update(self)
        end

        newComponent.SetValue = function(self, v)
            self.data.value = v
            self.__update(self)
        end

        newComponent.SetLoading = function(self, value)
            self.data.isLoading = value
            self.__update(self)
        end

        -- Icon
        newComponent.SetIcon = function(self, v)
            self.data.icon = v
            self.__update(self)
        end

        -- Javascript
        newComponent.SetSrc = function(self, v)
            self.data.src = v
            self.__update(self)
        end

        newComponent.SetContent = function(self, v)
            self.data.content = v
            self.__update(self)
        end

        -- Radios and select can have multiple values
        newComponent.AddValue = function(self, v)
            if (self.data.value == nil) then self.data.value = {} end
            self.data.value = table.insert(self.data.value, v)
            self.__update(self)
        end

        newComponent.GetValue = function(self)
            return self.data.value
        end

        -- Foolproof bindings
        newComponent.Value = newComponent.GetValue
    -- End getters and setters

    -- Utility functions
    newComponent.Show = function(self)
        Package.Log("Hey I should show now !")
        Package.Log(NanosUtils.Dump(self))
    end
    -- End utility functions

    -- Indexing component for routing
    ComponentsLists[newComponent.data.id] = newComponent

    return newComponent
end

local routerLookupTable = {
    ["onClick"] = function(component, event)
        if (component.OnClick == nil) then return end
        component.OnClick()
    end,
    ["onChange"] = function(component, event)
        if (component.OnChange == nil) then return end
        component.data.value = event.value
        component.OnChange(event.value)
    end,
    ["onMouseEnter"] = function(component, event)
        if (component.OnOver == nil) then return end
        component.OnOver()
    end,
    ["onEnter"] = function(component, event)
        if (component.OnEnter == nil) then return end
        component.OnEnter()
    end,
    ["onEscape"] = function(component, event)
        if (component.OnEscape == nil) then return end
        component.OnEscape()
    end,
    ["onFocus"] = function(component, event)
        if (component.OnFocus == nil) then return end
        component.OnFocus()
    end
}

-- Event routing
trunksWindow:Subscribe("TRUNKS_UI_EVENT", function(payload)
    Package.Log("Received event")
    local event = JSON.parse(payload)
    local component = ComponentsLists[event.eventPayload.id]
    if (component == nil) then
        Package.Error("Component not found O_O (Something went terribly wrong during event routing)")
        return
    end
    local eventType = event.eventType
    Package.Log("Received event from : " .. NanosUtils.Dump(component))

    local handler = routerLookupTable[eventType]
    if (handler == nil) then
        Package.Error("No handler found for event " .. eventType)
        return
    end

    handler(component, event)
end)