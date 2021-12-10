Citizen.CreateThread(function()
  ChaosMod.Modules.new("vehicleCinematicCam", "Cinematic cam", "Forces player into Cinematic cam.", function()
    local isCinematicCam = true
    Citizen.CreateThread(function()
      while isCinematicCam do
        Citizen.Wait(0)
        local MyPed = PlayerPedId()
        local MyVeh = GetVehiclePedIsIn(MyPed, false)
        SetPlayerCanDoDriveBy(PlayerId(), false)
        SetCinematicModeActive(true)
        DisableControlAction(0, 80, true)
        if MyVeh ~= 0 then
          DisableControlAction(0, 27, true)
          DisableControlAction(0, 0, true)
        end
      end
    end)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)-200)
    isCinematicCam = false
    Citizen.Wait(200)
    SetCinematicModeActive(false)
    SetPlayerCanDoDriveBy(PlayerId(), true)
  end, nil)
end)
