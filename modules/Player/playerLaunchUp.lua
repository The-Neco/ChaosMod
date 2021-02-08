Citizen.CreateThread(function()
  ChaosMod.Modules.new("playerLaunchUp", "Launch Player Up", "Launches the player upwards.", function()
    local MyPed = PlayerPedId()
    local MyVeh = GetVehiclePedIsIn(MyPed, false)
    if MyVeh ~= 0 then
      local playerVel = GetEntityVelocity(MyVeh)
      SetEntityVelocity(MyVeh, playerVel.x, playerVel.y, 100.0)
    else
      local playerVel = GetEntityVelocity(MyPed)
      SetPedToRagdoll(MyPed, 10000, 10000, 0, true, true, false)
      Citizen.Wait(0)
      SetEntityVelocity(MyPed, playerVel.x, playerVel.y, 100.0)
    end
  end, nil)
end)
