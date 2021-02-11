local RecentlyUsed = {}

Citizen.CreateThread(function()
  while true do
    SetConvarReplicated("chaosmod_eventtimer", GetConvarInt("chaosmod_eventtimer", 30000))
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    if ChaosMod.OverrideNext ~= nil then
      ChaosMod.Modules[ChaosMod.OverrideNext]:Start()
      ChaosMod.OverrideNext = nil
    else
      math.randomseed(os.clock())
      local NextEvent = math.random(1, #ChaosMod.ModuleList)
      while WasRecentlyUsed(ChaosMod.ModuleList[NextEvent]) do
        Citizen.Wait(10)
        NextEvent = math.random(1, #ChaosMod.ModuleList)
      end
      ChaosMod.Modules[ChaosMod.ModuleList[NextEvent]]:Start()
      table.insert(RecentlyUsed, 1, ChaosMod.ModuleList[NextEvent])
      if RecentlyUsed[4] then
        table.remove(RecentlyUsed, 4)
      end
    end
  end
end)

function WasRecentlyUsed(ID)
  for _, Event in pairs(RecentlyUsed) do
    if ID == Event then
      return true
    end
  end
  return false
end

function isValidModule(moduleName)
  for _, module in pairs(ChaosMod.ModuleList) do
    if string.lower(module) == string.lower(moduleName) then
      return module
    end
  end
  return false
end

RegisterCommand("ChaosMod:ForceNext", function(source, args, rawcommand)
  if args[1] == nil or args[1] == "" then
    if source > 0 then
      TriggerClientEvent('chat:addMessage', source, {args = {"^5[^1ChaosMod^5]", "Incorrect usage /ChaosMod:ForceNext [Module Identifier]"}})
    else
      print("^5[^1ChaosMod^5] ^7Incorrect usage ChaosMod:ForceNext [Module Identifier]")
    end
    return
  end
  local module = isValidModule(args[1])
  if module ~= false then
    ChaosMod.OverrideNext = module
    if source > 0 then
      TriggerClientEvent('chat:addMessage', source, {args = {"^5[^1ChaosMod^5]", string.format("Module overrided, %s will be next.", module)}})
    else
      print(string.format("^5[^1ChaosMod^5] ^7Module overrided, %s will be next.", module))
    end
  else
    if source > 0 then
      TriggerClientEvent('chat:addMessage', source, {args = {"^5[^1ChaosMod^5]", "Invalid module."}})
    else
      print("^5[^1ChaosMod^5] ^7Invalid module.")
    end
  end
end, true)
