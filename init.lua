ChaosMod = {}
ChaosMod.Modules = {}
ChaosMod.ModuleList = {}
ChaosMod.Modules.__index = ChaosMod.Modules

function GetModuleClass(ID)
  return ChaosMod.Modules[ID]
end

function ChaosMod.Modules.new(Identifier, Name, Description, ClientFunction, ServerFunction)
  local newModule = {}
  setmetatable(newModule, ChaosMod.Modules)
  newModule.ID = Identifier
  newModule.Name = Name
  newModule.Description = Description
  newModule.ClientFunction = ClientFunction
  newModule.ServerFunction = ServerFunction
  if IsDuplicityVersion() then
    newModule.Event = string.format("ChaosMod:%s:%s:Start", newModule.ID, randomString(10))
  else
    TriggerServerEvent("ChaosMod:RequstEventName", newModule.ID)
  end
  DebugPrint(string.format("%s has been loaded.", newModule.ID))
  ChaosMod.Modules[Identifier] = newModule
  ChaosMod.ModuleList[#ChaosMod.ModuleList+1] = Identifier
  return newModule
end

function ChaosMod.Modules:Start()
  DebugPrint(string.format("%s has been triggered.", self.ID))
  TriggerClientEvent('chat:addMessage', -1, {args = {"^5[^1ChaosMod^5]", string.format("%s - %s", self.Name, self.Description)}})
  if self.ClientFunction then
    TriggerClientEvent(self.Event, -1)
  end
  if self.ServerFunction then
    self.ServerFunction()
  end
end

if IsDuplicityVersion() then
  function ChaosMod.Modules:GetEventName()
    return self.Event
  end
  RegisterNetEvent("ChaosMod:RequstEventName")
  AddEventHandler("ChaosMod:RequstEventName", function(Identifier)
    TriggerClientEvent("ChaosMod:RecieveEventName", source, Identifier, GetModuleClass(Identifier):GetEventName())
  end)
else
  function ChaosMod.Modules:UpdateEventID(Event)
    self.Event = Event
    if self.ClientFunction then
      RegisterNetEvent(self.Event)
      AddEventHandler(self.Event, self.ClientFunction)
    end
  end
  RegisterNetEvent("ChaosMod:RecieveEventName")
  AddEventHandler("ChaosMod:RecieveEventName", function(Identifier, EventName)
    GetModuleClass(Identifier):UpdateEventID(EventName)
  end)
end
