Citizen.CreateThread(function()
    ChaosMod.Modules.new("miscLowPoly", "Low render distance", "Someone bought a potato.", function()
        local lowPoly = true
        Citizen.CreateThread(function()
            while lowPoly do
                Citizen.Wait(0)
                OverrideLodscaleThisFrame(0.04)
                for ped in EnumeratePeds() do
                    if DoesEntityExist(ped) and not IsPedAPlayer(ped) and not IsEntityAMissionEntity(ped) then
                        ForcePedMotionState(ped, 0xbac0f10b, 0, 0, 0) -- 0xbac0f10b is "nothing" according to Script Hook V
                    end
                end
            end
            OverrideLodscaleThisFrame(1.0)
        end)
        Citizen.Wait(GetConvarInt("chaosmod_eventtimer", 30000))
        lowPoly = false
    end, nil)
  end)
  