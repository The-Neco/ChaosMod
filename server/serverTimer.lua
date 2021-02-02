local RecentlyUsed = {}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
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
end)

function WasRecentlyUsed(ID)
  for _, Event in pairs(RecentlyUsed) do
    if ID == Event then
      return true
    end
  end
  return false
end
