Citizen.CreateThread(function()
  ChaosMod.Modules.new("miscSuperStunt", "Super Stunt", "Do a backflip.", function()
    local myPed = PlayerPedId()
    local rampHash = `prop_mp_ramp_03`
    local myCoords = GetEntityCoords(myPed)
    local rampPos = GetOffsetFromEntityInWorldCoords(myPed, 0, 5, 0)

    local ramp = CreateObject(rampHash, rampPos, true, false, true)
    PlaceObjectOnGroundProperly(ramp)
    rampPos = GetEntityCoords(ramp)
    SetEntityCoords(ramp, rampPos.x, rampPos.y, rampPos.z - 0.3, true, true, true, false)
    SetEntityRotation(ramp, GetEntityPitch(myPed), -GetEntityRoll(myPed), GetEntityHeading(myPed), 0, true)
    SetEntityAsNoLongerNeeded(ramp)
    Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000)/2)
    DeleteEntity(ramp)
    DeleteObject(ramp)
  end, nil)
end)
