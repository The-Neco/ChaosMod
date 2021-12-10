Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscNoRadar", "No Radar", "Removes the players Radar.", function()
    local noRadar = true
    Citizen.CreateThread(function()
      while noRadar do
        Citizen.Wait(0)
        DisplayRadar(false)
        DisableControlAction(0, 199, true)
        DisableControlAction(0, 200, true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-500)
    noRadar = false
    Citizen.Wait(500)
    DisplayRadar(true)
  end, nil)
end)
