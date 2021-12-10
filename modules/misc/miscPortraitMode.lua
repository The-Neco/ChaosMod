Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscPortraitMode", "Portrait Mode", "Portrait Mode.", function()
    local portraitMode = true
    local maxBoxWidth = 0.35
    local currentBoxWidth = 0
    Citizen.CreateThread(function()
      while portraitMode do
        Citizen.Wait(0)
        DrawRect((currentBoxWidth / 2), 0.5, currentBoxWidth, 1.0, 0, 0, 0, 255)
        DrawRect(1 - (currentBoxWidth / 2), 0.5, currentBoxWidth, 1.0, 0, 0, 0, 255)
        if currentBoxWidth < maxBoxWidth then
          currentBoxWidth = currentBoxWidth + 0.01
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    portraitMode = false
  end, nil)
end)
