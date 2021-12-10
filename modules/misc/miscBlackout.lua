Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscBlackout", "Blackout", "Causes a blackout.", function()
    SetClockTime(0, 0, 0)
    local blackout = true
    Citizen.CreateThread(function()
      while blackout do
        Citizen.Wait(0)
        SetArtificialLightsState(true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-500)
    blackout = false
    Citizen.Wait(500)
    SetArtificialLightsState(false)
  end, nil)
end)
