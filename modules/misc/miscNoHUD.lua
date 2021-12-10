Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscNoHUD", "No HUD", "Removes the players HUD.", function()
    local noHud = true
    Citizen.CreateThread(function()
      while noHud do
        Citizen.Wait(0)
        HideHudAndRadarThisFrame()
        DisableControlAction(0, 199, true)
        DisableControlAction(0, 200, true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
    noHud = false
  end, nil)
end)
