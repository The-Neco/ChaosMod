Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscForceFP", "Forced First Person", "Make the player stuck in First Person.", function()
    local firstPerson = true
    Citizen.CreateThread(function()
      while firstPerson do
        Citizen.Wait(0)
        SetCinematicModeActive(false)
        SetFollowPedCamViewMode(4)
        SetFollowVehicleCamViewMode(4)
        SetFollowVehicleCamZoomLevel(4)

        DisableControlAction(0, 0, true)
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-500)
    firstPerson = false
    Citizen.Wait(500)
    SetFollowPedCamViewMode(1)
    SetFollowVehicleCamViewMode(1)
  end, nil)
end)
